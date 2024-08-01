// To parse this JSON data, do
//
//     final booksSearch = booksSearchFromJson(jsonString);

import 'dart:convert';

BooksSearch booksSearchFromJson(String str) => BooksSearch.fromJson(json.decode(str));

String booksSearchToJson(BooksSearch data) => json.encode(data.toJson());

class BooksSearch {
    final int numFound;
    final int start;
    final bool numFoundExact;
    final List<Doc> docs;
    final int booksSearchNumFound;
    final String q;
    final dynamic offset;

    BooksSearch({
        required this.numFound,
        required this.start,
        required this.numFoundExact,
        required this.docs,
        required this.booksSearchNumFound,
        required this.q,
        required this.offset,
    });

    factory BooksSearch.fromJson(Map<String, dynamic> json) => BooksSearch(
        numFound: json["numFound"],
        start: json["start"],
        numFoundExact: json["numFoundExact"],
        docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
        booksSearchNumFound: json["num_found"],
        q: json["q"],
        offset: json["offset"],
    );

    Map<String, dynamic> toJson() => {
        "numFound": numFound,
        "start": start,
        "numFoundExact": numFoundExact,
        "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
        "num_found": booksSearchNumFound,
        "q": q,
        "offset": offset,
    };
}

class Doc {
    final List<String>? authorAlternativeName;
    final List<String>? authorKey;
    final List<String>? authorName;
    final List<String>? contributor;
    final String? coverEditionKey;
    final int? coverI;
    final List<String>? ddc;
    final EbookAccess ebookAccess;
    final int ebookCountI;
    final int editionCount;
    final List<String>? editionKey;
    final int? firstPublishYear;
    final List<String>? firstSentence;
    final List<String>? format;
    final bool hasFulltext;
    final List<String>? ia;
    final List<String>? iaCollection;
    final String? iaCollectionS;
    final List<String>? isbn;
    final String key;
    final List<String>? language;
    final int lastModifiedI;
    final List<String>? lcc;
    final List<String>? lccn;
    final int? numberOfPagesMedian;
    final List<String>? oclc;
    final int? ospCount;
    final String? printdisabledS;
    final bool publicScanB;
    final List<String>? publishDate;
    final List<String>? publishPlace;
    final List<int>? publishYear;
    final List<String>? publisher;
    final List<String> seed;
    final String title;
    final String titleSuggest;
    final String titleSort;
    final Type type;
    final List<String>? idGoodreads;
    final List<String>? idLibrarything;
    final List<String>? idDnb;
    final List<String>? idAmazon;
    final List<String>? idDepsitoLegal;
    final List<String>? idAlibrisId;
    final List<String>? idGoogle;
    final List<String>? idPaperbackSwap;
    final List<String>? idWikidata;
    final List<String>? idBetterWorldBooks;
    final List<String>? idOverdrive;
    final List<String>? idCanadianNationalLibraryArchive;
    final List<String>? subject;
    final List<String>? place;
    final List<String>? time;
    final List<String>? person;
    final List<String>? iaLoadedId;
    final List<String>? iaBoxId;
    final double? ratingsAverage;
    final double? ratingsSortable;
    final int? ratingsCount;
    final int? ratingsCount1;
    final int? ratingsCount2;
    final int? ratingsCount3;
    final int? ratingsCount4;
    final int? ratingsCount5;
    final int? readinglogCount;
    final int? wantToReadCount;
    final int? currentlyReadingCount;
    final int? alreadyReadCount;
    final List<String>? publisherFacet;
    final List<String>? personKey;
    final List<String>? timeFacet;
    final List<String>? placeKey;
    final List<String>? personFacet;
    final List<String>? subjectFacet;
    final double version;
    final List<String>? placeFacet;
    final String? lccSort;
    final List<String>? authorFacet;
    final List<String>? subjectKey;
    final String? ddcSort;
    final List<String>? timeKey;
    final String? lendingEditionS;
    final String? lendingIdentifierS;
    final List<String>? idAmazonCoUkAsin;
    final List<String>? idAmazonDeAsin;
    final List<String>? idAmazonCaAsin;
    final List<String>? idAmazonItAsin;
    final List<String>? idBcid;
    final List<String>? idNla;
    final List<String>? idBritishNationalBibliography;
    final List<String>? idScribd;
    final List<String>? idHathiTrust;
    final List<String>? idBritishLibrary;
    final List<String>? idBibliothqueNationaleDeFrance;
    final List<String>? idLibris;
    final String? subtitle;

    Doc({
        this.authorAlternativeName,
        this.authorKey,
        this.authorName,
        this.contributor,
        this.coverEditionKey,
        this.coverI,
        this.ddc,
        required this.ebookAccess,
        required this.ebookCountI,
        required this.editionCount,
        this.editionKey,
        this.firstPublishYear,
        this.firstSentence,
        this.format,
        required this.hasFulltext,
        this.ia,
        this.iaCollection,
        this.iaCollectionS,
        this.isbn,
        required this.key,
        this.language,
        required this.lastModifiedI,
        this.lcc,
        this.lccn,
        this.numberOfPagesMedian,
        this.oclc,
        this.ospCount,
        this.printdisabledS,
        required this.publicScanB,
        this.publishDate,
        this.publishPlace,
        this.publishYear,
        this.publisher,
        required this.seed,
        required this.title,
        required this.titleSuggest,
        required this.titleSort,
        required this.type,
        this.idGoodreads,
        this.idLibrarything,
        this.idDnb,
        this.idAmazon,
        this.idDepsitoLegal,
        this.idAlibrisId,
        this.idGoogle,
        this.idPaperbackSwap,
        this.idWikidata,
        this.idBetterWorldBooks,
        this.idOverdrive,
        this.idCanadianNationalLibraryArchive,
        this.subject,
        this.place,
        this.time,
        this.person,
        this.iaLoadedId,
        this.iaBoxId,
        this.ratingsAverage,
        this.ratingsSortable,
        this.ratingsCount,
        this.ratingsCount1,
        this.ratingsCount2,
        this.ratingsCount3,
        this.ratingsCount4,
        this.ratingsCount5,
        this.readinglogCount,
        this.wantToReadCount,
        this.currentlyReadingCount,
        this.alreadyReadCount,
        this.publisherFacet,
        this.personKey,
        this.timeFacet,
        this.placeKey,
        this.personFacet,
        this.subjectFacet,
        required this.version,
        this.placeFacet,
        this.lccSort,
        this.authorFacet,
        this.subjectKey,
        this.ddcSort,
        this.timeKey,
        this.lendingEditionS,
        this.lendingIdentifierS,
        this.idAmazonCoUkAsin,
        this.idAmazonDeAsin,
        this.idAmazonCaAsin,
        this.idAmazonItAsin,
        this.idBcid,
        this.idNla,
        this.idBritishNationalBibliography,
        this.idScribd,
        this.idHathiTrust,
        this.idBritishLibrary,
        this.idBibliothqueNationaleDeFrance,
        this.idLibris,
        this.subtitle,
    });

    factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        authorAlternativeName: json["author_alternative_name"] == null ? [] : List<String>.from(json["author_alternative_name"]!.map((x) => x)),
        authorKey: json["author_key"] == null ? [] : List<String>.from(json["author_key"]!.map((x) => x)),
        authorName: json["author_name"] == null ? [] : List<String>.from(json["author_name"]!.map((x) => x)),
        contributor: json["contributor"] == null ? [] : List<String>.from(json["contributor"]!.map((x) => x)),
        coverEditionKey: json["cover_edition_key"],
        coverI: json["cover_i"],
        ddc: json["ddc"] == null ? [] : List<String>.from(json["ddc"]!.map((x) => x)),
        ebookAccess: ebookAccessValues.map[json["ebook_access"]]!,
        ebookCountI: json["ebook_count_i"],
        editionCount: json["edition_count"],
        editionKey: json["edition_key"] == null ? [] : List<String>.from(json["edition_key"]!.map((x) => x)),
        firstPublishYear: json["first_publish_year"],
        firstSentence: json["first_sentence"] == null ? [] : List<String>.from(json["first_sentence"]!.map((x) => x)),
        format: json["format"] == null ? [] : List<String>.from(json["format"]!.map((x) => x)),
        hasFulltext: json["has_fulltext"],
        ia: json["ia"] == null ? [] : List<String>.from(json["ia"]!.map((x) => x)),
        iaCollection: json["ia_collection"] == null ? [] : List<String>.from(json["ia_collection"]!.map((x) => x)),
        iaCollectionS: json["ia_collection_s"],
        isbn: json["isbn"] == null ? [] : List<String>.from(json["isbn"]!.map((x) => x)),
        key: json["key"],
        language: json["language"] == null ? [] : List<String>.from(json["language"]!.map((x) => x)),
        lastModifiedI: json["last_modified_i"],
        lcc: json["lcc"] == null ? [] : List<String>.from(json["lcc"]!.map((x) => x)),
        lccn: json["lccn"] == null ? [] : List<String>.from(json["lccn"]!.map((x) => x)),
        numberOfPagesMedian: json["number_of_pages_median"],
        oclc: json["oclc"] == null ? [] : List<String>.from(json["oclc"]!.map((x) => x)),
        ospCount: json["osp_count"],
        printdisabledS: json["printdisabled_s"],
        publicScanB: json["public_scan_b"],
        publishDate: json["publish_date"] == null ? [] : List<String>.from(json["publish_date"]!.map((x) => x)),
        publishPlace: json["publish_place"] == null ? [] : List<String>.from(json["publish_place"]!.map((x) => x)),
        publishYear: json["publish_year"] == null ? [] : List<int>.from(json["publish_year"]!.map((x) => x)),
        publisher: json["publisher"] == null ? [] : List<String>.from(json["publisher"]!.map((x) => x)),
        seed: List<String>.from(json["seed"].map((x) => x)),
        title: json["title"],
        titleSuggest: json["title_suggest"],
        titleSort: json["title_sort"],
        type: typeValues.map[json["type"]]!,
        idGoodreads: json["id_goodreads"] == null ? [] : List<String>.from(json["id_goodreads"]!.map((x) => x)),
        idLibrarything: json["id_librarything"] == null ? [] : List<String>.from(json["id_librarything"]!.map((x) => x)),
        idDnb: json["id_dnb"] == null ? [] : List<String>.from(json["id_dnb"]!.map((x) => x)),
        idAmazon: json["id_amazon"] == null ? [] : List<String>.from(json["id_amazon"]!.map((x) => x)),
        idDepsitoLegal: json["id_depósito_legal"] == null ? [] : List<String>.from(json["id_depósito_legal"]!.map((x) => x)),
        idAlibrisId: json["id_alibris_id"] == null ? [] : List<String>.from(json["id_alibris_id"]!.map((x) => x)),
        idGoogle: json["id_google"] == null ? [] : List<String>.from(json["id_google"]!.map((x) => x)),
        idPaperbackSwap: json["id_paperback_swap"] == null ? [] : List<String>.from(json["id_paperback_swap"]!.map((x) => x)),
        idWikidata: json["id_wikidata"] == null ? [] : List<String>.from(json["id_wikidata"]!.map((x) => x)),
        idBetterWorldBooks: json["id_better_world_books"] == null ? [] : List<String>.from(json["id_better_world_books"]!.map((x) => x)),
        idOverdrive: json["id_overdrive"] == null ? [] : List<String>.from(json["id_overdrive"]!.map((x) => x)),
        idCanadianNationalLibraryArchive: json["id_canadian_national_library_archive"] == null ? [] : List<String>.from(json["id_canadian_national_library_archive"]!.map((x) => x)),
        subject: json["subject"] == null ? [] : List<String>.from(json["subject"]!.map((x) => x)),
        place: json["place"] == null ? [] : List<String>.from(json["place"]!.map((x) => x)),
        time: json["time"] == null ? [] : List<String>.from(json["time"]!.map((x) => x)),
        person: json["person"] == null ? [] : List<String>.from(json["person"]!.map((x) => x)),
        iaLoadedId: json["ia_loaded_id"] == null ? [] : List<String>.from(json["ia_loaded_id"]!.map((x) => x)),
        iaBoxId: json["ia_box_id"] == null ? [] : List<String>.from(json["ia_box_id"]!.map((x) => x)),
        ratingsAverage: json["ratings_average"]?.toDouble(),
        ratingsSortable: json["ratings_sortable"]?.toDouble(),
        ratingsCount: json["ratings_count"],
        ratingsCount1: json["ratings_count_1"],
        ratingsCount2: json["ratings_count_2"],
        ratingsCount3: json["ratings_count_3"],
        ratingsCount4: json["ratings_count_4"],
        ratingsCount5: json["ratings_count_5"],
        readinglogCount: json["readinglog_count"],
        wantToReadCount: json["want_to_read_count"],
        currentlyReadingCount: json["currently_reading_count"],
        alreadyReadCount: json["already_read_count"],
        publisherFacet: json["publisher_facet"] == null ? [] : List<String>.from(json["publisher_facet"]!.map((x) => x)),
        personKey: json["person_key"] == null ? [] : List<String>.from(json["person_key"]!.map((x) => x)),
        timeFacet: json["time_facet"] == null ? [] : List<String>.from(json["time_facet"]!.map((x) => x)),
        placeKey: json["place_key"] == null ? [] : List<String>.from(json["place_key"]!.map((x) => x)),
        personFacet: json["person_facet"] == null ? [] : List<String>.from(json["person_facet"]!.map((x) => x)),
        subjectFacet: json["subject_facet"] == null ? [] : List<String>.from(json["subject_facet"]!.map((x) => x)),
        version: json["_version_"]?.toDouble(),
        placeFacet: json["place_facet"] == null ? [] : List<String>.from(json["place_facet"]!.map((x) => x)),
        lccSort: json["lcc_sort"],
        authorFacet: json["author_facet"] == null ? [] : List<String>.from(json["author_facet"]!.map((x) => x)),
        subjectKey: json["subject_key"] == null ? [] : List<String>.from(json["subject_key"]!.map((x) => x)),
        ddcSort: json["ddc_sort"],
        timeKey: json["time_key"] == null ? [] : List<String>.from(json["time_key"]!.map((x) => x)),
        lendingEditionS: json["lending_edition_s"],
        lendingIdentifierS: json["lending_identifier_s"],
        idAmazonCoUkAsin: json["id_amazon_co_uk_asin"] == null ? [] : List<String>.from(json["id_amazon_co_uk_asin"]!.map((x) => x)),
        idAmazonDeAsin: json["id_amazon_de_asin"] == null ? [] : List<String>.from(json["id_amazon_de_asin"]!.map((x) => x)),
        idAmazonCaAsin: json["id_amazon_ca_asin"] == null ? [] : List<String>.from(json["id_amazon_ca_asin"]!.map((x) => x)),
        idAmazonItAsin: json["id_amazon_it_asin"] == null ? [] : List<String>.from(json["id_amazon_it_asin"]!.map((x) => x)),
        idBcid: json["id_bcid"] == null ? [] : List<String>.from(json["id_bcid"]!.map((x) => x)),
        idNla: json["id_nla"] == null ? [] : List<String>.from(json["id_nla"]!.map((x) => x)),
        idBritishNationalBibliography: json["id_british_national_bibliography"] == null ? [] : List<String>.from(json["id_british_national_bibliography"]!.map((x) => x)),
        idScribd: json["id_scribd"] == null ? [] : List<String>.from(json["id_scribd"]!.map((x) => x)),
        idHathiTrust: json["id_hathi_trust"] == null ? [] : List<String>.from(json["id_hathi_trust"]!.map((x) => x)),
        idBritishLibrary: json["id_british_library"] == null ? [] : List<String>.from(json["id_british_library"]!.map((x) => x)),
        idBibliothqueNationaleDeFrance: json["id_bibliothèque_nationale_de_france"] == null ? [] : List<String>.from(json["id_bibliothèque_nationale_de_france"]!.map((x) => x)),
        idLibris: json["id_libris"] == null ? [] : List<String>.from(json["id_libris"]!.map((x) => x)),
        subtitle: json["subtitle"],
    );

    Map<String, dynamic> toJson() => {
        "author_alternative_name": authorAlternativeName == null ? [] : List<dynamic>.from(authorAlternativeName!.map((x) => x)),
        "author_key": authorKey == null ? [] : List<dynamic>.from(authorKey!.map((x) => x)),
        "author_name": authorName == null ? [] : List<dynamic>.from(authorName!.map((x) => x)),
        "contributor": contributor == null ? [] : List<dynamic>.from(contributor!.map((x) => x)),
        "cover_edition_key": coverEditionKey,
        "cover_i": coverI,
        "ddc": ddc == null ? [] : List<dynamic>.from(ddc!.map((x) => x)),
        "ebook_access": ebookAccessValues.reverse[ebookAccess],
        "ebook_count_i": ebookCountI,
        "edition_count": editionCount,
        "edition_key": editionKey == null ? [] : List<dynamic>.from(editionKey!.map((x) => x)),
        "first_publish_year": firstPublishYear,
        "first_sentence": firstSentence == null ? [] : List<dynamic>.from(firstSentence!.map((x) => x)),
        "format": format == null ? [] : List<dynamic>.from(format!.map((x) => x)),
        "has_fulltext": hasFulltext,
        "ia": ia == null ? [] : List<dynamic>.from(ia!.map((x) => x)),
        "ia_collection": iaCollection == null ? [] : List<dynamic>.from(iaCollection!.map((x) => x)),
        "ia_collection_s": iaCollectionS,
        "isbn": isbn == null ? [] : List<dynamic>.from(isbn!.map((x) => x)),
        "key": key,
        "language": language == null ? [] : List<dynamic>.from(language!.map((x) => x)),
        "last_modified_i": lastModifiedI,
        "lcc": lcc == null ? [] : List<dynamic>.from(lcc!.map((x) => x)),
        "lccn": lccn == null ? [] : List<dynamic>.from(lccn!.map((x) => x)),
        "number_of_pages_median": numberOfPagesMedian,
        "oclc": oclc == null ? [] : List<dynamic>.from(oclc!.map((x) => x)),
        "osp_count": ospCount,
        "printdisabled_s": printdisabledS,
        "public_scan_b": publicScanB,
        "publish_date": publishDate == null ? [] : List<dynamic>.from(publishDate!.map((x) => x)),
        "publish_place": publishPlace == null ? [] : List<dynamic>.from(publishPlace!.map((x) => x)),
        "publish_year": publishYear == null ? [] : List<dynamic>.from(publishYear!.map((x) => x)),
        "publisher": publisher == null ? [] : List<dynamic>.from(publisher!.map((x) => x)),
        "seed": List<dynamic>.from(seed.map((x) => x)),
        "title": title,
        "title_suggest": titleSuggest,
        "title_sort": titleSort,
        "type": typeValues.reverse[type],
        "id_goodreads": idGoodreads == null ? [] : List<dynamic>.from(idGoodreads!.map((x) => x)),
        "id_librarything": idLibrarything == null ? [] : List<dynamic>.from(idLibrarything!.map((x) => x)),
        "id_dnb": idDnb == null ? [] : List<dynamic>.from(idDnb!.map((x) => x)),
        "id_amazon": idAmazon == null ? [] : List<dynamic>.from(idAmazon!.map((x) => x)),
        "id_depósito_legal": idDepsitoLegal == null ? [] : List<dynamic>.from(idDepsitoLegal!.map((x) => x)),
        "id_alibris_id": idAlibrisId == null ? [] : List<dynamic>.from(idAlibrisId!.map((x) => x)),
        "id_google": idGoogle == null ? [] : List<dynamic>.from(idGoogle!.map((x) => x)),
        "id_paperback_swap": idPaperbackSwap == null ? [] : List<dynamic>.from(idPaperbackSwap!.map((x) => x)),
        "id_wikidata": idWikidata == null ? [] : List<dynamic>.from(idWikidata!.map((x) => x)),
        "id_better_world_books": idBetterWorldBooks == null ? [] : List<dynamic>.from(idBetterWorldBooks!.map((x) => x)),
        "id_overdrive": idOverdrive == null ? [] : List<dynamic>.from(idOverdrive!.map((x) => x)),
        "id_canadian_national_library_archive": idCanadianNationalLibraryArchive == null ? [] : List<dynamic>.from(idCanadianNationalLibraryArchive!.map((x) => x)),
        "subject": subject == null ? [] : List<dynamic>.from(subject!.map((x) => x)),
        "place": place == null ? [] : List<dynamic>.from(place!.map((x) => x)),
        "time": time == null ? [] : List<dynamic>.from(time!.map((x) => x)),
        "person": person == null ? [] : List<dynamic>.from(person!.map((x) => x)),
        "ia_loaded_id": iaLoadedId == null ? [] : List<dynamic>.from(iaLoadedId!.map((x) => x)),
        "ia_box_id": iaBoxId == null ? [] : List<dynamic>.from(iaBoxId!.map((x) => x)),
        "ratings_average": ratingsAverage,
        "ratings_sortable": ratingsSortable,
        "ratings_count": ratingsCount,
        "ratings_count_1": ratingsCount1,
        "ratings_count_2": ratingsCount2,
        "ratings_count_3": ratingsCount3,
        "ratings_count_4": ratingsCount4,
        "ratings_count_5": ratingsCount5,
        "readinglog_count": readinglogCount,
        "want_to_read_count": wantToReadCount,
        "currently_reading_count": currentlyReadingCount,
        "already_read_count": alreadyReadCount,
        "publisher_facet": publisherFacet == null ? [] : List<dynamic>.from(publisherFacet!.map((x) => x)),
        "person_key": personKey == null ? [] : List<dynamic>.from(personKey!.map((x) => x)),
        "time_facet": timeFacet == null ? [] : List<dynamic>.from(timeFacet!.map((x) => x)),
        "place_key": placeKey == null ? [] : List<dynamic>.from(placeKey!.map((x) => x)),
        "person_facet": personFacet == null ? [] : List<dynamic>.from(personFacet!.map((x) => x)),
        "subject_facet": subjectFacet == null ? [] : List<dynamic>.from(subjectFacet!.map((x) => x)),
        "_version_": version,
        "place_facet": placeFacet == null ? [] : List<dynamic>.from(placeFacet!.map((x) => x)),
        "lcc_sort": lccSort,
        "author_facet": authorFacet == null ? [] : List<dynamic>.from(authorFacet!.map((x) => x)),
        "subject_key": subjectKey == null ? [] : List<dynamic>.from(subjectKey!.map((x) => x)),
        "ddc_sort": ddcSort,
        "time_key": timeKey == null ? [] : List<dynamic>.from(timeKey!.map((x) => x)),
        "lending_edition_s": lendingEditionS,
        "lending_identifier_s": lendingIdentifierS,
        "id_amazon_co_uk_asin": idAmazonCoUkAsin == null ? [] : List<dynamic>.from(idAmazonCoUkAsin!.map((x) => x)),
        "id_amazon_de_asin": idAmazonDeAsin == null ? [] : List<dynamic>.from(idAmazonDeAsin!.map((x) => x)),
        "id_amazon_ca_asin": idAmazonCaAsin == null ? [] : List<dynamic>.from(idAmazonCaAsin!.map((x) => x)),
        "id_amazon_it_asin": idAmazonItAsin == null ? [] : List<dynamic>.from(idAmazonItAsin!.map((x) => x)),
        "id_bcid": idBcid == null ? [] : List<dynamic>.from(idBcid!.map((x) => x)),
        "id_nla": idNla == null ? [] : List<dynamic>.from(idNla!.map((x) => x)),
        "id_british_national_bibliography": idBritishNationalBibliography == null ? [] : List<dynamic>.from(idBritishNationalBibliography!.map((x) => x)),
        "id_scribd": idScribd == null ? [] : List<dynamic>.from(idScribd!.map((x) => x)),
        "id_hathi_trust": idHathiTrust == null ? [] : List<dynamic>.from(idHathiTrust!.map((x) => x)),
        "id_british_library": idBritishLibrary == null ? [] : List<dynamic>.from(idBritishLibrary!.map((x) => x)),
        "id_bibliothèque_nationale_de_france": idBibliothqueNationaleDeFrance == null ? [] : List<dynamic>.from(idBibliothqueNationaleDeFrance!.map((x) => x)),
        "id_libris": idLibris == null ? [] : List<dynamic>.from(idLibris!.map((x) => x)),
        "subtitle": subtitle,
    };
}

enum EbookAccess {
    BORROWABLE,
    NO_EBOOK,
    PRINTDISABLED,
    UNCLASSIFIED
}

final ebookAccessValues = EnumValues({
    "borrowable": EbookAccess.BORROWABLE,
    "no_ebook": EbookAccess.NO_EBOOK,
    "printdisabled": EbookAccess.PRINTDISABLED,
    "unclassified": EbookAccess.UNCLASSIFIED
});

enum Type {
    WORK
}

final typeValues = EnumValues({
    "work": Type.WORK
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
