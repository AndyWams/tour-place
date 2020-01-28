class TourList {
  final List<Tour> places;

  TourList({
    this.places,
  });

  factory TourList.fromJson(List<dynamic> parsedJson) {
    List<Tour> places = new List<Tour>();
    places = parsedJson.map((i) => Tour.fromJson(i)).toList();

    return TourList(places: places);
  }
}

class Tour {
  final int id;
  final String name;
  final String imagePath;
  final String days;
  final String milage;
  final List<TourDetailModel> details;

  Tour(
      {this.id,
      this.name,
      this.imagePath,
      this.days,
      this.milage,
      this.details});

  factory Tour.fromJson(Map<String, dynamic> parsedJson) {
    var listdetails = parsedJson['details'] as List;
    List<TourDetailModel> detailList =
        listdetails.map((i) => TourDetailModel.fromJson(i)).toList();
    return new Tour(
        id: parsedJson['id'],
        name: parsedJson['name'].toString(),
        imagePath: parsedJson['imagePath'].toString(),
        days: parsedJson['days'].toString(),
        milage: parsedJson['milage'].toString(),
        details: detailList);
  }
  toString() {
    return '{$id, $name, $imagePath, $days, $milage, $details}';
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imagePath": imagePath,
        "days": days,
        "milage": milage,
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
      };
}

class TourDetailModel {
  final String title;
  final String text;

  TourDetailModel({this.title, this.text});

  factory TourDetailModel.fromJson(Map<String, dynamic> parsedJson) {
    return TourDetailModel(
        title: parsedJson['title'].toString(),
        text: parsedJson['text'].toString());
  }

  toString() {
    return '$title, $text';
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "text": text,
      };
}
