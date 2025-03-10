import 'dart:convert';

import "package:collection/collection.dart";

import '../data/dummy_data.dart';

class Contact {
  final String name;
  final String number;
  Contact({required this.name, required this.number});

  static Map<String, List<Contact>> getGroup() {
    final g = groupBy(dummyData, (e) => e.name[0].toUpperCase());

    return g;
  }

  Contact copyWith({String? name, String? number}) {
    return Contact(name: name ?? this.name, number: number ?? this.number);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'number': number};
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      name: map['name'] as String,
      number: map['number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) =>
      Contact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Contact(name: $name, number: $number)';

  @override
  bool operator ==(covariant Contact other) {
    if (identical(this, other)) return true;

    return other.name == name && other.number == number;
  }

  @override
  int get hashCode => name.hashCode ^ number.hashCode;
}
