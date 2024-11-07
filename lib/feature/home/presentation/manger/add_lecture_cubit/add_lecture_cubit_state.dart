class AddLectureState {
  final DateTime selectedTime;
  final int selectedCount;
  final int selectedDayIndex;
  final String grade;
  final String region;

  AddLectureState({
    required this.selectedTime,
    required this.selectedCount,
    required this.selectedDayIndex,
    required this.grade,
    required this.region,
  });

  AddLectureState copyWith({
    DateTime? selectedTime,
    int? selectedCount,
    int? selectedDayIndex,
    String? grade,
    String? region,
  }) {
    return AddLectureState(
      selectedTime: selectedTime ?? this.selectedTime,
      selectedCount: selectedCount ?? this.selectedCount,
      selectedDayIndex: selectedDayIndex ?? this.selectedDayIndex,
      grade: grade ?? this.grade,
      region: region ?? this.region,
    );
  }
}
