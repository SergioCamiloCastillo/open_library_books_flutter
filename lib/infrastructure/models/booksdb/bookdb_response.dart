// To parse this JSON data, do
//
//     final booksDbReponse = booksDbReponseFromJson(jsonString);

import 'dart:convert';

import 'package:bookstore_flutter/infrastructure/models/booksdb/book_bookdb.dart';

BooksDbResponse booksDbReponseFromJson(String str) =>
    BooksDbResponse.fromJson(json.decode(str));

String booksDbReponseToJson(BooksDbResponse data) => json.encode(data.toJson());

class BooksDbResponse {
  final String key;
  final String name;
  final String subjectType;
  final int workCount;
  final List<BookFromBookDB> works;

  BooksDbResponse({
    required this.key,
    required this.name,
    required this.subjectType,
    required this.workCount,
    required this.works,
  });

  factory BooksDbResponse.fromJson(Map<String, dynamic> json) => BooksDbResponse(
        key: json["key"],
        name: json["name"],
        subjectType: json["subject_type"],
        workCount: json["work_count"],
        works: List<BookFromBookDB>.from(
            json["works"].map((x) => BookFromBookDB.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "subject_type": subjectType,
        "work_count": workCount,
        "works": List<dynamic>.from(works.map((x) => x.toJson())),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
