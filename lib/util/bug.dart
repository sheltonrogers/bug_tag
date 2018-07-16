class Bug {
  String name;

  Map<String, dynamic> toMap() {
    return {
      "name": name,
    };
  }

  static Bug fromMap(Map<String, dynamic> bugMap) {
    return new Bug()..name = bugMap["name"];
  }

  @override
  String toString() {
    return "Bug: {name: $name}";
  }
}