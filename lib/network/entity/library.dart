class Library {
  Library(
      this.category,
      this.pref,
      this.libId,
      this.systemId,
      this.formal
      );

  final String category; // LARGE, MEDIUM...
  final String pref; // 東京都
  final String libId; // 104302
  final String systemId; // Tokyo_Kokkai
  final String formal; // 国会図書館

  static Library formJson(Map<String, dynamic> json) {
    return Library(
      json['category'] as String,
      json['pref'] as String,
      json['libid'] as String,
      json['systemid'] as String,
      json['formal'] as String,
    );
  }
}