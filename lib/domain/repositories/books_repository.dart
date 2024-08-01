import 'package:bookstore_flutter/domain/entities/book_entity.dart';

abstract class BooksRepository {
  Future<List<BookEntity>> getVentureBooksRepository(
      {int start = 0, int limit = 5});
  Future<List<BookEntity>> getFictionBooksRepository(
      {int start = 0, int limit = 5});
  Future<List<BookEntity>> getNonFictionBooksRepository(
      {int start = 0, int limit = 5});
  Future<List<BookEntity>> getMisteryBooksRepository(
      {int start = 0, int limit = 5});
  Future<List<BookEntity>> getRomanceBooksRepository(
      {int start = 0, int limit = 5});
  Future<List<BookEntity>> getBiographyBooksRepository(
      {int start = 0, int limit = 5});
  Future<List<BookEntity>> getScienceBooksRepository(
      {int start = 0, int limit = 5});
  Future<List<BookEntity>> getFantasyBooksRepository(
      {int start = 0, int limit = 5});
  Future<BookEntity> getBookByKey(String key, String coverId);
  Future<List> searchBooks(String nameBook);
}
