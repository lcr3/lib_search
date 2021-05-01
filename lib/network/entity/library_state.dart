
class LibraryState {
  LibraryState(this.name, this.reserveUrl, this.states);

  final String name;
  final String reserveUrl;
  final List<State> states;

  // ignore: prefer_constructors_over_static_methods
  static LibraryState fromJson(String name, Map<String, dynamic> json) {
    final stateJson = json['libkey'] as Map<String, dynamic>?;
    final states = <State>[];
    if (stateJson != null) {
      stateJson.forEach((key, dynamic value) {
        states.add(State(key, value));
      });
    }
    return LibraryState(
      name,
      json['reserveurl'] as String,
      states,
    );
  }
}

class State {
  State(this.name, this.type);

  final String name;
  final String type;

  State.fromJson(String name, dynamic type)
  : this.name = name,
    this.type = type as String;
}