class StudentsPlan {
  int? idStudentsPlan;
  String? title;
  String? department;
  int? totalSelfWorkHours;
  int? totalLectureHours;
  int? totalPracticeHours;
  bool? obyzatOrNeObyzat;
  bool? hasExam;
  bool? hasPass;
  int? yearOfStudy;
  int? semestr;
  final int? liniyaGizni;
  final int count_c;
  final int id_student;


  StudentsPlan({
    required this.idStudentsPlan,
    required this.title,
    required this.department,
    required this.totalSelfWorkHours,
    required this.totalLectureHours,
    required this.totalPracticeHours,
    required this.obyzatOrNeObyzat,
    required this.hasExam,
    required this.hasPass,
    required this.yearOfStudy,
    required this.semestr,
    required this.count_c,
    required this.id_student,
    this.liniyaGizni,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is StudentsPlan && runtimeType == other.runtimeType && idStudentsPlan == other.idStudentsPlan;

  @override
  int get hashCode => idStudentsPlan.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'idStudentsPlan': idStudentsPlan,
      'title': title,
      'department': department,
      'totalSelfWorkHours': totalSelfWorkHours,
      'totalLectureHours': totalLectureHours,
      'totalPracticeHours': totalPracticeHours,
      'hasExam': hasExam,
      'hasPass': hasPass,
      'yearOfStudy': yearOfStudy,
      'semestr': semestr,
      'count_c': count_c,
      'liniyaGizni': liniyaGizni,
      'id_student': id_student,
      'obyzatOrNeObyzat': obyzatOrNeObyzat
    };
  }

  static StudentsPlan fromMap(Map<String, dynamic> map) {
    return StudentsPlan(
      idStudentsPlan: map['idStudentsPlan'],
      title: map['title'],
      department: map['department'],
      totalSelfWorkHours: map['totalSelfWorkHours'],
      totalLectureHours: map['totalLectureHours'],
      totalPracticeHours: map['totalPracticeHours'],
      hasExam: map['hasExam'] == 1 ? true : false,
      hasPass: map['hasPass'] == 1 ? true : false,
      liniyaGizni: map['liniyaGizni'],

      yearOfStudy: map['yearOfStudy'],
      semestr: map['semestr'],
      count_c: map['count_c'],
      id_student: map['id_student'],
      obyzatOrNeObyzat: map['obyzatOrNeObyzat'] == 1 ? true : false,
    );
  }
}