class BookDetails {
  final String firstPublishDate;
  final String title;
  final List<int> covers;
  final String key;
  final List<Author> authors;
  final CoverEdition type;
  final List<String> subjects;
  final List<String> subjectPlaces;
  final List<Excerpt> excerpts;
  final String location;
  final String description;
  final List<String> subjectTimes;
  final List<String> subjectPeople;
  final List<Link> links;
  final List<String> lcClassifications;
  final List<String> deweyNumber;
  final int latestRevision;
  final int revision;
  final Created created;
  final Created lastModified;

  BookDetails({
    required this.firstPublishDate,
    required this.title,
    required this.covers,
    required this.key,
    required this.authors,
    required this.type,
    required this.subjects,
    required this.subjectPlaces,
    required this.excerpts,
    required this.location,
    required this.description,
    required this.subjectTimes,
    required this.subjectPeople,
    required this.links,
    required this.lcClassifications,
    required this.deweyNumber,
    required this.latestRevision,
    required this.revision,
    required this.created,
    required this.lastModified,
  });

  factory BookDetails.fromJson(Map<String, dynamic> json) {
    return BookDetails(
      firstPublishDate: json["first_publish_date"] as String? ?? '',
      title: json["title"] as String? ?? '',
      covers: List<int>.from(
        (json["covers"] as List<dynamic>?)?.map((x) => x as int) ?? [],
      ),
      key: json["key"] as String? ?? '',
      authors: List<Author>.from(
        (json["authors"] as List<dynamic>?)
                ?.map((x) => Author.fromJson(x as Map<String, dynamic>)) ??
            [],
      ),
      type: CoverEdition.fromJson(json["type"] as Map<String, dynamic>),
      subjects: List<String>.from(
        (json["subjects"] as List<dynamic>?)?.map((x) => x as String) ?? [],
      ),
      subjectPlaces: List<String>.from(
        (json["subject_places"] as List<dynamic>?)?.map((x) => x as String) ??
            [],
      ),
      excerpts: List<Excerpt>.from(
        (json["excerpts"] as List<dynamic>?)
                ?.map((x) => Excerpt.fromJson(x as Map<String, dynamic>)) ??
            [],
      ),
      location: json["location"] as String? ?? '',
      description: json["description"] is String
          ? json["description"] as String
          : '', // Corrected type checking
      subjectTimes: List<String>.from(
        (json["subject_times"] as List<dynamic>?)?.map((x) => x as String) ??
            [],
      ),
      subjectPeople: List<String>.from(
        (json["subject_people"] as List<dynamic>?)?.map((x) => x as String) ??
            [],
      ),
      links: List<Link>.from(
        (json["links"] as List<dynamic>?)
                ?.map((x) => Link.fromJson(x as Map<String, dynamic>)) ??
            [],
      ),
      lcClassifications: List<String>.from(
        (json["lc_classifications"] as List<dynamic>?)
                ?.map((x) => x as String) ??
            [],
      ),
      deweyNumber: List<String>.from(
        (json["dewey_number"] as List<dynamic>?)?.map((x) => x as String) ??
            [],
      ),
      latestRevision: int.tryParse(json["latest_revision"]?.toString() ?? '0') ?? 0,
      revision: int.tryParse(json["revision"]?.toString() ?? '0') ?? 0,
      created: Created.fromJson(json["created"] as Map<String, dynamic>),
      lastModified: Created.fromJson(json["last_modified"] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        "first_publish_date": firstPublishDate,
        "title": title,
        "covers": List<dynamic>.from(covers.map((x) => x)),
        "key": key,
        "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
        "type": type.toJson(),
        "subjects": List<dynamic>.from(subjects.map((x) => x)),
        "subject_places": List<dynamic>.from(subjectPlaces.map((x) => x)),
        "excerpts": List<dynamic>.from(excerpts.map((x) => x.toJson())),
        "location": location,
        "description": description,
        "subject_times": List<dynamic>.from(subjectTimes.map((x) => x)),
        "subject_people": List<dynamic>.from(subjectPeople.map((x) => x)),
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "lc_classifications": List<dynamic>.from(lcClassifications.map((x) => x)),
        "dewey_number": List<dynamic>.from(deweyNumber.map((x) => x)),
        "latest_revision": latestRevision,
        "revision": revision,
        "created": created.toJson(),
        "last_modified": lastModified.toJson(),
      };
}

class Author {
  final CoverEdition author;
  final CoverEdition type;

  Author({
    required this.author,
    required this.type,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        author: CoverEdition.fromJson(json["author"] as Map<String, dynamic>),
        type: CoverEdition.fromJson(json["type"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "author": author.toJson(),
        "type": type.toJson(),
      };
}

class CoverEdition {
  final String key;

  CoverEdition({
    required this.key,
  });

  factory CoverEdition.fromJson(Map<String, dynamic> json) => CoverEdition(
        key: json["key"] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        "key": key,
      };
}

class Created {
  final String type;
  final String value;

  Created({
    required this.type,
    required this.value,
  });

  factory Created.fromJson(Map<String, dynamic> json) => Created(
        type: json["type"] as String? ?? '',
        value: json["value"] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}

class Excerpt {
  final String excerpt;

  Excerpt({
    required this.excerpt,
  });

  factory Excerpt.fromJson(Map<String, dynamic> json) => Excerpt(
        excerpt: json["excerpt"] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        "excerpt": excerpt,
      };
}

class Link {
  final String title;
  final String url;
  final CoverEdition type;

  Link({
    required this.title,
    required this.url,
    required this.type,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        title: json["title"] as String? ?? '',
        url: json["url"] as String? ?? '',
        type: CoverEdition.fromJson(json["type"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
        "type": type.toJson(),
      };
}