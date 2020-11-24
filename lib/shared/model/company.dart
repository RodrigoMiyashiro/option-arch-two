class Company {
  final String name;
  final String phrase;
  final String bs;

  Company({
    this.name,
    this.phrase,
    this.bs
  });

  factory Company.fromJSON(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return Company(
      name: json['name'],
      phrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}