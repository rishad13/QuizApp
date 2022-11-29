// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';
String API1='https://6377526681a568fc251232a4.mockapi.io/sample/1';
List<Album> albumFromJson(String str) =>
    List<Album>.from(json.decode(str).map((x) => Album.fromJson(x)));

String albumToJson(List<Album> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Album {
  Album({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.questions,
    required this.id,
  });

  DateTime createdAt;
  String name;
  String avatar;
  List<QuestionElement> questions;
  String id;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        questions: List<QuestionElement>.from(
            json["questions"].map((x) => QuestionElement.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
        "id": id,
      };
}

class QuestionElement {
  QuestionElement({
    required this.question,
    required this.answers,
    required this.correctIndex,
  });

  QuestionEnum question;
  List<String> answers;
  int correctIndex;

  factory QuestionElement.fromJson(Map<String, dynamic> json) =>
      QuestionElement(
        question: questionEnumValues.map[json["question"]]!,
        answers: List<String>.from(json["answers"].map((x) => x)),
        correctIndex: json["correctIndex"],
      );

  Map<String, dynamic> toJson() => {
        "question": questionEnumValues.reverse[question],
        "answers": List<dynamic>.from(answers.map((x) => x)),
        "correctIndex": correctIndex,
      };
}

enum QuestionEnum {
  WHAT_IS_THE_SCIENTIFIC_NAME_OF_A_BUTTERFLY,
  HOW_HOT_IS_THE_SURFACE_OF_THE_SUN,
  WHO_ARE_THE_ACTORS_IN_THE_INTERNSHIP,
  WHAT_IS_THE_CAPITAL_OF_SPAIN,
  WHAT_ARE_THE_SCHOOL_COLORS_OF_THE_UNIVERSITY_OF_TEXAS_AT_AUSTIN,
  WHAT_IS_70_DEGREES_FAHRENHEIT_IN_CELSIUS,
  WHEN_WAS_MAHATMA_GANDHI_BORN,
  HOW_FAR_IS_THE_MOON_FROM_EARTH,
  WHAT_IS_65_TIMES_52,
  HOW_TALL_IS_MOUNT_EVEREST,
  WHEN_DID_THE_AVENGERS_COME_OUT,
  WHAT_IS_48879_IN_HEXIDECIMAL
}

final questionEnumValues = EnumValues({
  "How far is the moon from Earth?":
      QuestionEnum.HOW_FAR_IS_THE_MOON_FROM_EARTH,
  "How hot is the surface of the sun?":
      QuestionEnum.HOW_HOT_IS_THE_SURFACE_OF_THE_SUN,
  "How tall is Mount Everest?": QuestionEnum.HOW_TALL_IS_MOUNT_EVEREST,
  "What are the school colors of the University of Texas at Austin?":
      QuestionEnum
          .WHAT_ARE_THE_SCHOOL_COLORS_OF_THE_UNIVERSITY_OF_TEXAS_AT_AUSTIN,
  "What is 48,879 in hexidecimal?": QuestionEnum.WHAT_IS_48879_IN_HEXIDECIMAL,
  "What is 65 times 52?": QuestionEnum.WHAT_IS_65_TIMES_52,
  "What is 70 degrees Fahrenheit in Celsius?":
      QuestionEnum.WHAT_IS_70_DEGREES_FAHRENHEIT_IN_CELSIUS,
  "What is the capital of Spain?": QuestionEnum.WHAT_IS_THE_CAPITAL_OF_SPAIN,
  "What is the scientific name of a butterfly?":
      QuestionEnum.WHAT_IS_THE_SCIENTIFIC_NAME_OF_A_BUTTERFLY,
  "When did The Avengers come out?":
      QuestionEnum.WHEN_DID_THE_AVENGERS_COME_OUT,
  "When was Mahatma Gandhi born?": QuestionEnum.WHEN_WAS_MAHATMA_GANDHI_BORN,
  "Who are the actors in The Internship?":
      QuestionEnum.WHO_ARE_THE_ACTORS_IN_THE_INTERNSHIP
});

class EnumValues<T> {
   Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
