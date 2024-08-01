import 'package:bookstore_flutter/infrastructure/datasources/bookdb_datasource_impl.dart';
import 'package:bookstore_flutter/infrastructure/repositories/books_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//este repositorio es inmutable
final bookRepositoryProvider = Provider((ref) {
  return BooksRepositoryImpl(BookdbDatasourceImpl());
});
