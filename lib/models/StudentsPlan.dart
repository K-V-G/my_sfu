class StudentsPlan {
  int? id;
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


  StudentsPlan({
    required this.id,
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
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is StudentsPlan && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

}