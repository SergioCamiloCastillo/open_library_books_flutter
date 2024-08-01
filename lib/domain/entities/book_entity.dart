class BookEntity {
  final String title;
  final List<String> authors;
  final String description;
  final String imageUrl;
  final String editionName;
  final String firstPublishedYear;
  final int pages;
  final String editorial;
  final String language;
  final List<String> genres;
  final String key;
  final int coverId;
  final List<String>? subjects;

  BookEntity(
      {this.coverId = 0,
      this.subjects,
      required this.title,
      required this.authors,
      required this.description,
      required this.imageUrl,
      required this.editionName,
      required this.firstPublishedYear,
      required this.pages,
      required this.editorial,
      required this.language,
      required this.genres,
      required this.key});
}
