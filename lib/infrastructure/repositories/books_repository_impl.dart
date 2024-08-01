import 'package:bookstore_flutter/domain/datasources/books_datasources.dart';
import 'package:bookstore_flutter/domain/entities/book_entity.dart';
import 'package:bookstore_flutter/domain/repositories/books_repository.dart';

class BooksRepositoryImpl extends BooksRepository {
  final BooksDatasource datasource;

  BooksRepositoryImpl(this.datasource);
  @override
  Future<List<BookEntity>> getBiographyBooksRepository(
      {int start = 0, int limit = 5}) {
    return datasource.getBiographyBooksDatasource(start: start, limit: limit);
  }

  @override
  Future<List<BookEntity>> getFantasyBooksRepository(
      {int start = 0, int limit = 5}) {
    return datasource.getFantasyBooksDatasource(start: start, limit: limit);
  }

  @override
  Future<List<BookEntity>> getFictionBooksRepository(
      {int start = 0, int limit = 5}) {
    return datasource.getFictionBooksDatasource(start: start, limit: limit);
  }

  @override
  Future<List<BookEntity>> getMisteryBooksRepository(
      {int start = 0, int limit = 5}) {
    return datasource.getMisteryBooksDatasource(start: start, limit: limit);
  }

  @override
  Future<List<BookEntity>> getNonFictionBooksRepository(
      {int start = 0, int limit = 5}) {
    return datasource.getNonFictionBooksDatasource(start: start, limit: limit);
  }

  @override
  Future<List<BookEntity>> getRomanceBooksRepository(
      {int start = 0, int limit = 5}) {
    return datasource.getRomanceBooksDatasource(start: start, limit: limit);
  }

  @override
  Future<List<BookEntity>> getScienceBooksRepository(
      {int start = 0, int limit = 5}) {
    return datasource.getScienceBooksDatasource(start: start, limit: limit);
  }

  @override
  Future<List<BookEntity>> getVentureBooksRepository(
      {int start = 0, int limit = 5}) {
    return datasource.getVentureBooksDatasource(start: start, limit: limit);
  }

  @override
  Future<BookEntity> getBookByKey(String key, String coverId) {
    return datasource.getBookByKey(key, coverId);
  }

  @override
  Future<List>searchBooks(String nameBook) {
    return datasource.searchBooks(nameBook);
  }
}
