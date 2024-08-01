import 'package:bookstore_flutter/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BooksHorizontalListView extends StatefulWidget {
  final List<BookEntity> books;
  final String? titleCategory;
  final VoidCallback? loadNextPage;

  const BooksHorizontalListView({
    super.key,
    required this.books,
    this.titleCategory,
    this.loadNextPage,
  });

  @override
  State<BooksHorizontalListView> createState() =>
      _BooksHorizontalListViewState();
}

class _BooksHorizontalListViewState extends State<BooksHorizontalListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (widget.loadNextPage == null) return;
    if (_scrollController.position.pixels + 350 >=
        _scrollController.position.maxScrollExtent) {
      widget.loadNextPage!();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Column(
        children: [
          if (widget.titleCategory != null)
            _Title(
              title: widget.titleCategory,
            ),
          const SizedBox(height: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                controller: _scrollController,
                itemCount: widget.books.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return _Slide(
                    book: widget.books[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String extractIdentifierFromPath(String path) {
  List<String> parts = path.split('/');
  if (parts.length > 1) {
    return parts.last;
  } else {
    throw ArgumentError('No identifier found in path');
  }
}

class _Slide extends StatelessWidget {
  final BookEntity book;
  const _Slide({required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            height: 200, // Altura fija para todas las imágenes
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                book.imageUrl,
                fit: BoxFit.cover,
                width: 150,
                height: 200, // Altura fija para todas las imágenes
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    String bookId = extractIdentifierFromPath(book.key);
                    return GestureDetector(
                        onTap: () {
                          print('hizo click $bookId');
                          context.push('/book/$bookId/${book.coverId}');
                        },
                        child: child);
                  }
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 13),
                  book.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Año publicación: ",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(book.firstPublishedYear.toString(),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  const _Title({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.bodyLarge;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          if (title != null)
            Text(
              title ?? '',
              style: titleStyle,
            ),
        ],
      ),
    );
  }
}
