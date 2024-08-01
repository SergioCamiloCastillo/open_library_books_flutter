import 'package:bookstore_flutter/domain/entities/book_entity.dart';

abstract class BooksDatasource {
  Future<List<BookEntity>> getVentureBooksDatasource(
      {int start = 0, int limit = 5});
  Future<List<BookEntity>> getFictionBooksDatasource(
      {int start = 0, int limit = 5});
  Future<List<BookEntity>> getNonFictionBooksDatasource(
      {int start = 0, int limit = 5});
  Future<List<BookEntity>> getMisteryBooksDatasource(
      {int start = 0, int limit = 5});
  Future<List<BookEntity>> getRomanceBooksDatasource(
      {int start = 0, int limit = 5});
  Future<List<BookEntity>> getBiographyBooksDatasource(
      {int start = 0, int limit = 5});
  Future<List<BookEntity>> getScienceBooksDatasource(
      {int start = 0, int limit = 5});
  Future<List<BookEntity>> getFantasyBooksDatasource(
      {int start = 0, int limit = 5});
  Future<BookEntity> getBookByKey(String key, String coverId);
  Future<List> searchBooks(String nameBook);
}
