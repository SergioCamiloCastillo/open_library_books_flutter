import 'package:bookstore_flutter/domain/entities/book_entity.dart';
import 'package:bookstore_flutter/presentation/providers/books/book_info_provider.dart';
import 'package:bookstore_flutter/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookScreen extends ConsumerStatefulWidget {
  static const name = 'book-screen';
  final String bookId;
  final String coverId;
  const BookScreen({super.key, required this.bookId, required this.coverId});

  @override
  BookScreenState createState() => BookScreenState();
}

class BookScreenState extends ConsumerState<BookScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(bookInfoProvider.notifier).loadBook(widget.bookId, widget.coverId);
  }

  @override
  Widget build(BuildContext context) {
    final book = ref.watch(bookInfoProvider)[widget.bookId];
    if (book == null) {
      return const Scaffold(
        body: Center(
          child: FullScreenLoader(),
        ),
      );
    }
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(book: book),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _BookDetails(book: book),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BookDetails extends StatelessWidget {
  final BookEntity book;
  const _BookDetails({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Row with vertical dividers
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.date_range_outlined,
                          color: colors.primary,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Fecha publicación',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Text(book.firstPublishedYear,
                        style: const TextStyle(fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.topic_outlined,
                          color: colors.primary,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Tema',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Text(
                      book.subjects?.isNotEmpty == true
                          ? book.subjects![0]
                          : 'Sin tema disponible',
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(thickness: 2, height: 32),
          Text('Acerca del libro', style: textStyles.labelLarge),
          const SizedBox(height: 8),
          Text(
            book.description ?? 'No description available.',
            style: TextStyle(color: Colors.grey[600], fontSize: 15),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final BookEntity book;
  const _CustomSliverAppBar({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.4,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFFF8EFEB), Color(0xFFE4E3FC)],
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.05, // Adjusted positioning
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: size.width * 0.4, // Adjusted width
                    height: size.width * 0.6, // Aspect ratio for image
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(book.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: size.width * 0.8), // Limit width
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFFF8EFEB), Color(0xFFE4E3FC)],
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: SizedBox(
                      child: Text(
                        book.title,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
