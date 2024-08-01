import 'package:bookstore_flutter/config/constants/environmen.dart';
import 'package:bookstore_flutter/domain/datasources/books_datasources.dart';
import 'package:bookstore_flutter/domain/entities/book_entity.dart';
import 'package:bookstore_flutter/infrastructure/mappers/books_mapper.dart';
import 'package:bookstore_flutter/infrastructure/models/booksdb/book_bookdb.dart';
import 'package:bookstore_flutter/infrastructure/models/booksdb/bookdb_response.dart';
import 'package:bookstore_flutter/infrastructure/models/booksdb/books_search.dart';
import 'package:bookstore_flutter/infrastructure/models/booksdb/movie_details.dart';
import 'package:dio/dio.dart';

class BookdbDatasourceImpl extends BooksDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.endpointOpenLibrary));
  List<BookEntity> _jsonToBooks(Map<String, dynamic> json) {
    final bookDBResponse = BooksDbResponse.fromJson(json);
    final List<BookEntity> books = bookDBResponse.works
        .map((bookDB) => BooksMapper.bookDBToEntity(bookDB))
        .toList();
    return books;
  }

  List<BookEntity> _jsonToBooksSearch(Map<String, dynamic> json) {
    final bookDBResponse = BooksSearch.fromJson(json);
    final List<BookEntity> books = bookDBResponse.docs
        .map((bookDB) => BooksMapper.booksSearch(bookDB))
        .toList();
    return books;
  }

  @override
  Future<List<BookEntity>> getBiographyBooksDatasource(
      {int start = 0, int limit = 5}) async {
    final response = await dio.get('/subjects/biography.json',
        queryParameters: {'offset': start, 'limit': limit});
    return _jsonToBooks(response.data);
  }

  @override
  Future<List<BookEntity>> getFantasyBooksDatasource(
      {int start = 0, int limit = 5}) async {
    final response = await dio.get('/subjects/fantasy.json',
        queryParameters: {'offset': start, 'limit': limit});
    return _jsonToBooks(response.data);
  }

  @override
  Future<List<BookEntity>> getFictionBooksDatasource(
      {int start = 0, int limit = 5}) async {
    final response = await dio.get('/subjects/fiction.json',
        queryParameters: {'offset': start, 'limit': limit});
    return _jsonToBooks(response.data);
  }

  @override
  Future<List<BookEntity>> getMisteryBooksDatasource(
      {int start = 0, int limit = 5}) async {
    final response = await dio.get('/subjects/mistery.json',
        queryParameters: {'offset': start, 'limit': limit});
    return _jsonToBooks(response.data);
  }

  @override
  Future<List<BookEntity>> getNonFictionBooksDatasource(
      {int start = 0, int limit = 5}) async {
    final response = await dio.get('/subjects/nonfiction.json',
        queryParameters: {'offset': start, 'limit': limit});
    return _jsonToBooks(response.data);
  }

  @override
  Future<List<BookEntity>> getRomanceBooksDatasource(
      {int start = 0, int limit = 5}) async {
    final response =
        await dio.get('/subjects/romance.json?offset=$start&limit=$limit');
    return _jsonToBooks(response.data);
  }

  @override
  Future<List<BookEntity>> getScienceBooksDatasource(
      {int start = 0, int limit = 5}) async {
    final response = await dio.get('/subjects/science.json',
        queryParameters: {'offset': start, 'limit': limit});
    return _jsonToBooks(response.data);
  }

  @override
  Future<List<BookEntity>> getVentureBooksDatasource(
      {int start = 0, int limit = 5}) async {
    final response = await dio.get('/subjects/venture.json',
        queryParameters: {'offset': start, 'limit': limit});
    return _jsonToBooks(response.data);
  }

  @override
  Future<BookEntity> getBookByKey(String key, String coverId) async {
    final response = await dio.get('/works/$key.json');
    if (response.statusCode != 200) {
      throw Exception('Libro no encontrado $key');
    }
    final bookDetails = BookDetails.fromJson(response.data);
    final BookEntity book =
        BooksMapper.bookDetailsToEntity(bookDetails, coverId);
    return book;
  }

  @override
  Future<List<dynamic>> searchBooks(String nameBook) async {
    print('Buscando libro $nameBook');
    final response = await dio.get('/search.json',
        queryParameters: {'q': nameBook.replaceAll(' ', '+'), 'limit': 20});

    if (response.statusCode != 200) {
      throw Exception('Error al buscar libros');
    }

    // Accede a la lista de libros dentro del mapa de respuesta
    final data = response.data;
    if (data is Map<String, dynamic>) {
      // Asegúrate de que 'books' sea una lista dentro del mapa
      final books = data['docs'];
      if (books is List<dynamic>) {
        return books;
      } else {
        throw Exception('Formato de datos inesperado');
      }
    } else {
      throw Exception('Formato de datos inesperado');
    }
  }
}
