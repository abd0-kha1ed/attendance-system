class AddLectureState {
  final DateTime selectedTime;
  final int selectedCount;
  final int selectedDayIndex;

  AddLectureState({
    required this.selectedTime,
    required this.selectedCount,
    required this.selectedDayIndex,
  });

  AddLectureState copyWith({
    DateTime? selectedTime,
    int? selectedCount,
    int? selectedDayIndex,
  }) {
    return AddLectureState(
      selectedTime: selectedTime ?? this.selectedTime,
      selectedCount: selectedCount ?? this.selectedCount,
      selectedDayIndex: selectedDayIndex ?? this.selectedDayIndex,
    );
  }
}