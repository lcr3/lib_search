
class LibraryState {
  LibraryState(this.name, this.reserveUrl, this.references);

  final String name;
  final String reserveUrl;
  final List<Reference> references;

  // ignore: prefer_constructors_over_static_methods
  static LibraryState fromJson(String name, Map<String, dynamic> json) {
    final stateJson = json['libkey'] as Map<String, dynamic>?;
    final references = <Reference>[];
    if (stateJson != null) {
      stateJson.forEach((key, dynamic value) {
        references.add(Reference(key, value));
      });
    }
    return LibraryState(
      name,
      json['reserveurl'] as String,
      references,
    );
  }
}

class Reference {
  Reference(this.name, this.type);

  final String name;
  final String type;

  Reference.fromJson(String name, dynamic type)
  : this.name = name,
    this.type = type as String;
}