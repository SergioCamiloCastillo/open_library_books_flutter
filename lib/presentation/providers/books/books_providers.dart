import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookstore_flutter/presentation/providers/providers.dart';
import 'package:bookstore_flutter/domain/entities/book_entity.dart';

final biographyBooksProvider =
    StateNotifierProvider<BooksNotifier, List<BookEntity>>((ref) {
  final fetchMoreBooks =
      ref.watch(bookRepositoryProvider).getBiographyBooksRepository;
  return BooksNotifier(fetchMoreBooks: fetchMoreBooks);
});
final fantasyBooksProvider =
    StateNotifierProvider<BooksNotifier, List<BookEntity>>((ref) {
  final fetchMoreBooks =
      ref.watch(bookRepositoryProvider).getFantasyBooksRepository;
  return BooksNotifier(fetchMoreBooks: fetchMoreBooks);
});
final fictionBooksProvider =
    StateNotifierProvider<BooksNotifier, List<BookEntity>>((ref) {
  final fetchMoreBooks =
      ref.watch(bookRepositoryProvider).getFictionBooksRepository;
  return BooksNotifier(fetchMoreBooks: fetchMoreBooks);
});
final misteryBooksProvider =
    StateNotifierProvider<BooksNotifier, List<BookEntity>>((ref) {
  final fetchMoreBooks =
      ref.watch(bookRepositoryProvider).getMisteryBooksRepository;
  return BooksNotifier(fetchMoreBooks: fetchMoreBooks);
});
final ventureBooksProvider =
    StateNotifierProvider<BooksNotifier, List<BookEntity>>((ref) {
  final fetchMoreBooks =
      ref.watch(bookRepositoryProvider).getVentureBooksRepository;
  return BooksNotifier(fetchMoreBooks: fetchMoreBooks);
});
final nonFictionBooksProvider =
    StateNotifierProvider<BooksNotifier, List<BookEntity>>((ref) {
  final fetchMoreBooks =
      ref.watch(bookRepositoryProvider).getNonFictionBooksRepository;
  return BooksNotifier(fetchMoreBooks: fetchMoreBooks);
});
final romanceBooksProvider =
    StateNotifierProvider<BooksNotifier, List<BookEntity>>((ref) {
  final fetchMoreBooks =
      ref.watch(bookRepositoryProvider).getRomanceBooksRepository;
  return BooksNotifier(fetchMoreBooks: fetchMoreBooks);
});
final scienceBooksProvider =
    StateNotifierProvider<BooksNotifier, List<BookEntity>>((ref) {
  final fetchMoreBooks =
      ref.watch(bookRepositoryProvider).getScienceBooksRepository;
  return BooksNotifier(fetchMoreBooks: fetchMoreBooks);
});

typedef BookCallback = Future<List<BookEntity>> Function(
    {int start, int limit});

class BooksNotifier extends StateNotifier<List<BookEntity>> {
  int startItem = 0;
  int limitItem = 5;
  BookCallback fetchMoreBooks;
  bool isLoading = false;

  BooksNotifier({required this.fetchMoreBooks}) : super([]);

  Future<void> loadNextItemsToRender() async {
    if (isLoading) return;

    isLoading = true;
    print('fetchingg');
    print('start item: $startItem');
    print('limit item: $limitItem');
    final List<BookEntity> books =
        await fetchMoreBooks(start: startItem, limit: limitItem);

    if (books.isNotEmpty) {
      state = [...state, ...books];
      startItem = startItem == 0 ? 10 : startItem + 10;
      limitItem = limitItem + 10;
      await Future.delayed(const Duration(milliseconds: 300));
    }

    isLoading = false;
  }
}
