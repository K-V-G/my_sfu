class Zachetka {
  final int yearOfStudy;
  final int semester;
  final String discipline;
  final String controlType;
  final String finalGrade;
  final int? liniyaGizni;
  final int count_c;
  final int id_student;

  Zachetka({
    required this.yearOfStudy,
    required this.semester,
    required this.discipline,
    required this.controlType,
    required this.finalGrade,
    required this.count_c,
    required this.id_student,
    this.liniyaGizni,
  });

  Map<String, dynamic> toMap() {
    return {
      'yearOfStudy': yearOfStudy,
      'semester': semester,
      'discipline': discipline,
      'controlType': controlType,
      'finalGrade': finalGrade,
      'liniyaGizni': liniyaGizni,
      'idStudent': id_student,
      'countCource': count_c
    };
  }

  static Zachetka fromMap(Map<String, dynamic> map) {
    return Zachetka(
      yearOfStudy: map['yearOfStudy'],
      semester: map['semester'],
      discipline: map['discipline'],
      controlType: map['controlType'],
      finalGrade: map['finalGrade'],
      liniyaGizni: map['liniyaGizni'],
      count_c: map['countCource'],
      id_student: map['idStudent'],
    );
  }
}