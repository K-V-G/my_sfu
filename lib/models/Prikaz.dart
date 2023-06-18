import 'package:shared_preferences/shared_preferences.dart';

class Prikaz {
  String nomer;
  String title;
  String date;
  final int id_student;
  final int? liniyaGizni;

  Prikaz ( {
    required this.nomer,
    required this.title,
    required this.date,
    required this.id_student,
    required this.liniyaGizni,
  });

  Map<String, dynamic> toMap() {
    return {
      'nomer': nomer,
      'title': title,
      'date': date,
      'id_student': id_student,
      'liniyaGizni': liniyaGizni,
    };
  }

  static Prikaz fromMap(Map<String, dynamic> map) {
    return Prikaz(
      nomer: map['nomer'],
      title: map['title'],
      date: map['date'],
      liniyaGizni: map['liniyaGizni'],
      id_student: map['id_student'],
    );
  }

}