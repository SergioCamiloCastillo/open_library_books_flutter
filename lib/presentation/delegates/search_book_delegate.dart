import 'dart:async';

import 'package:bookstore_flutter/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

typedef SearchBooksCallback = Future<List> Function(String query);

class SearchBookDelegate extends SearchDelegate {
  final SearchBooksCallback searchBooks;
  StreamController debounceBooks = StreamController.broadcast();
  Timer? _debounceTimer;

  SearchBookDelegate({required this.searchBooks});
  void _onQueryChanged(String query) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 200), () async {
      if (query.isEmpty) {
        debounceBooks.add([]);
        return;
      }
      final books = await searchBooks(query);
      debounceBooks.add(books);
    });
  }

  void clearStreams() {
    debounceBooks.close();
  }

  @override
  String? get searchFieldLabel => 'Buscar libro...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          clearStreams();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('build results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return StreamBuilder(
      stream: debounceBooks.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: FullScreenLoader());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error interno'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
              child: Text('No se encuentran libros relacionados'));
        } else {
          final books = snapshot.data;
          return ListView.builder(
            itemCount: books!.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return BooksSearchItem(
                  book: book,
                  onBookSelected: (context, book) {
                    clearStreams();
                    close(context, book);
                  });
            },
          );
        }
      },
    );
  }
}

class BooksSearchItem extends StatelessWidget {
  final book;
  final Function onBookSelected;
  const BooksSearchItem(
      {super.key, required this.book, required this.onBookSelected});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => onBookSelected(context, book),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    book['cover_i'] != null
                        ? 'https://covers.openlibrary.org/b/id/${book['cover_i']}-L.jpg'
                        : 'https://static-01.daraz.pk/p/9c4bbb21ac32475a2f3d8c55d2b7337d.jpg',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) => child),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book['title'] ?? 'Título no disponible',
                      style: textStyles.titleMedium),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      'Año publicación: ${book['author_name'] != null ? (book['author_name'] as List<dynamic>).join(', ') : 'No disponible'}',
                      style: textStyles.bodySmall),
                  Text(
                      'Autor: ${book['author_name'] != null ? (book['author_name'] as List<dynamic>).join(', ') : 'No disponible'}',
                      style: textStyles.bodySmall),
                  Text(
                    'Género: ${book['subject'] != null ? (book['subject'] as List<dynamic>).take(3).map((e) => e.toString()).join(', ') : 'No disponible'}',
                    style: textStyles.bodySmall,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
