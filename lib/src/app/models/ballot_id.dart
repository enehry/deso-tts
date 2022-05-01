class BallotID {
  final String id;
  bool isSelected = false;

  BallotID({required this.id, this.isSelected = false});

  @override
  String toString() => id;

  void select() {
    isSelected = !isSelected;
  }
}
