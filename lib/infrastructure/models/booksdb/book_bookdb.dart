class BookFromBookDB {
  final String key;
  final String title;
  final int editionCount;
  final int coverId;
  final List<String> subject;
  final List<String> iaCollection;
  final bool lendinglibrary;
  final bool printdisabled;
  final String lendingEdition;
  final String lendingIdentifier;
  final List<String> authors;
  final int firstPublishYear;
  final String ia;
  final bool publicScan;
  final bool hasFulltext;
  final String? availability;
  final String? imageUrl;

  BookFromBookDB({
    required this.key,
    required this.title,
    required this.editionCount,
    required this.coverId,
    required this.subject,
    required this.iaCollection,
    required this.lendinglibrary,
    required this.printdisabled,
    required this.lendingEdition,
    required this.lendingIdentifier,
    required this.authors,
    required this.firstPublishYear,
    required this.ia,
    required this.publicScan,
    required this.hasFulltext,
    this.availability,
    this.imageUrl,
  });

  factory BookFromBookDB.fromJson(Map<String, dynamic> json) => BookFromBookDB(
      key: json["key"] ?? '',
      title: json["title"] ?? '',
      
      editionCount: json["edition_count"] ?? '',
      coverId: json["cover_id"] != null
          ? int.tryParse(json["cover_id"].toString()) ?? 0
          : 0,
      subject: List<String>.from(json["subject"].map((x) => x)),
      iaCollection: List<String>.from(json["ia_collection"].map((x) => x)),
      lendinglibrary: json["lendinglibrary"] ?? '',
      printdisabled: json["printdisabled"] ?? '',
      lendingEdition: json["lending_edition"] ?? '',
      lendingIdentifier: json["lending_identifier"] ?? '',
      authors: json["authors"] != null
          ? List<String>.from(json["authors"].map((x) => x['name']))
          : [],
      firstPublishYear: json["first_publish_year"] ?? '',
      ia: json["ia"] ?? '',
      publicScan: json["public_scan"] ?? '',
      hasFulltext: json["has_fulltext"] ?? '',
      availability: null,
      imageUrl: json["imageUrl"] ?? '');

  Map<String, dynamic> toJson() => {
        "key": key,
        "title": title,
        "edition_count": editionCount,
        "cover_id": coverId,
        "subject": List<dynamic>.from(subject.map((x) => x)),
        "ia_collection": List<dynamic>.from(iaCollection.map((x) => x)),
        "lendinglibrary": lendinglibrary,
        "printdisabled": printdisabled,
        "lending_edition": lendingEdition,
        "lending_identifier": lendingIdentifier,
        "authors": List<dynamic>.from(authors.map((x) => x)),
        "first_publish_year": firstPublishYear,
        "ia": ia,
        "public_scan": publicScan,
        "has_fulltext": hasFulltext,
        "availability": availability,
        "imageUrl": imageUrl
      };
}
