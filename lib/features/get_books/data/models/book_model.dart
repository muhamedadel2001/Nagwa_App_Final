class BookModel {
  dynamic next;
  dynamic previous;
  List<Results>? results;

  BookModel({this.next, this.previous, this.results});

  BookModel.fromJson(Map<String, dynamic> json) {
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? title;
  List<Authors>? authors;
  List<String>? summaries;
  Formats? formats;

  Results({
    this.id,
    this.title,
    this.authors,
    this.summaries,
    this.formats,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['authors'] != null) {
      authors = <Authors>[];
      json['authors'].forEach((v) {
        authors!.add(Authors.fromJson(v));
      });
    }
    summaries = json['summaries'].cast<String>();

    formats =
        json['formats'] != null ? Formats.fromJson(json['formats']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (authors != null) {
      data['authors'] = authors!.map((v) => v.toJson()).toList();
    }
    data['summaries'] = summaries;

    if (formats != null) {
      data['formats'] = formats!.toJson();
    }
    return data;
  }
}

class Authors {
  String? name;

  Authors({
    this.name,
  });

  Authors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Formats {
  String? imageJpeg;
  Formats({
    this.imageJpeg,
  });

  Formats.fromJson(Map<String, dynamic> json) {
    imageJpeg = json['image/jpeg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image/jpeg'] = imageJpeg;
    return data;
  }
}
