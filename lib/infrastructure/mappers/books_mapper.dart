import 'package:bookstore_flutter/domain/entities/book_entity.dart';
import 'package:bookstore_flutter/infrastructure/models/booksdb/books_search.dart';
import 'package:bookstore_flutter/infrastructure/models/booksdb/book_bookdb.dart';
import 'package:bookstore_flutter/infrastructure/models/booksdb/movie_details.dart';

class BooksMapper {
  static BookEntity bookDBToEntity(BookFromBookDB bookdb) => BookEntity(
      key: bookdb.key,
      authors: bookdb.authors.map((e) => e.toString()).toList(),
      title: bookdb.title,
      imageUrl: bookdb.coverId != null
          ? 'https://covers.openlibrary.org/b/id/${bookdb.coverId}-L.jpg'
          : 'https://static-01.daraz.pk/p/9c4bbb21ac32475a2f3d8c55d2b7337d.jpg',
      genres: [],
      description: '',
      editionName: '',
      firstPublishedYear: '${bookdb.firstPublishYear}',
      pages: 0,
      editorial: '',
      language: '',
      subjects: bookdb.subject.map((e) => e.toString()).toList(),
      coverId: bookdb.coverId);

  static BookEntity bookDetailsToEntity(BookDetails bookdb, String coverId) => BookEntity(
      coverId: int.parse(coverId),
      key: bookdb.key,
      subjects: bookdb.subjects,
      authors: bookdb.authors.map((e) => e.toString()).toList(),
      title: bookdb.title,
      imageUrl: coverId.isNotEmpty
          ? 'https://covers.openlibrary.org/b/id/$coverId-L.jpg'
          : 'https://static-01.daraz.pk/p/9c4bbb21ac32475a2f3d8c55d2b7337d.jpg',
      genres: [],
      description: bookdb.description,
      editionName: '',
      firstPublishedYear: bookdb.firstPublishDate,
      pages: 0,
      editorial: '',
      language: '');

  static BookEntity booksSearch(Doc bookdb) => BookEntity(
      key: bookdb.key,
      authors: bookdb.authorName ?? [], // Maneja autores nulos
      title: bookdb.title ?? 'No title', // Maneja títulos nulos
      language: '',
      imageUrl: bookdb.coverI != null
          ? 'https://covers.openlibrary.org/b/id/${bookdb.coverI}-L.jpg'
          : 'https://static-01.daraz.pk/p/9c4bbb21ac32475a2f3d8c55d2b7337d.jpg',
      genres: [],
      description: bookdb.firstSentence?.isNotEmpty == true ? bookdb.firstSentence!.first : '', // Maneja descripciones nulas
      editionName: '',
      firstPublishedYear: bookdb.firstPublishYear?.toString() ?? 'Unknown', // Maneja fechas de publicación nulas
      pages: 0,
      editorial: '');
}