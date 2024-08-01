import 'package:bookstore_flutter/domain/entities/book_entity.dart';
import 'package:bookstore_flutter/presentation/providers/books/books_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookInfoProvider =
    StateNotifierProvider<BookMapNotifier, Map<String, BookEntity>>((ref) {
  final bookRepository = ref.watch(bookRepositoryProvider);
  return BookMapNotifier(getBook: bookRepository.getBookByKey);
});

typedef GetBookCallback = Future<BookEntity> Function(
    String key, String coverId);

class BookMapNotifier extends StateNotifier<Map<String, BookEntity>> {
  final GetBookCallback getBook;
  BookMapNotifier({required this.getBook}) : super({});

  Future<void> loadBook(String bookKey, String coverId) async {
    if (state[bookKey] != null) return;
    print('realizando http');
    final book = await getBook(bookKey, coverId);
    state = {...state, bookKey: book};
  }
}
