import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'translation.g.dart';

@HiveType(typeId: 0)
class Translation extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String word;
  @HiveField(1)
  final String? phonetic;
  @HiveField(2)
  final List<dynamic>? phonetics;
  @HiveField(3)
  final String? origin;
  @HiveField(4)
  final List<dynamic>? meanings;
  @HiveField(5)
  final DateTime? dateTime;
  @HiveField(6)
  final bool? isFavorite;
  Translation({
    required this.word,
    this.phonetic,
    this.phonetics,
    this.origin,
    this.meanings,
    this.dateTime,
    this.isFavorite,
  });

  @override
  List<Object?> get props => [word];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'phonetic': phonetic,
      'phonetics': phonetics,
      'origin': origin,
      'meanings': meanings,
      'dateTime': DateTime.now(),
      'isFavorite': false,
    };
  }

  factory Translation.fromMap(Map<String, dynamic> map) {
    return Translation(
      word: map['word'],
      phonetic: map['phonetic'] as String?,
      phonetics: map['phonetics'] as List<dynamic>?,
      origin: map['origin'] as String?,
      meanings: map['meanings'] as List<dynamic>?,
      dateTime: map['dateTime'] ?? DateTime.now(),
      isFavorite: map['isFavorite'] ?? false,
    );
  }

  Translation copyWith({
    String? word,
    String? phonetic,
    List<dynamic>? phonetics,
    String? origin,
    List<dynamic>? meanings,
    DateTime? dateTime,
    bool? isFavorite,
  }) {
    return Translation(
      word: word ?? this.word,
      phonetic: phonetic ?? this.phonetic,
      phonetics: phonetics ?? this.phonetics,
      origin: origin ?? this.origin,
      meanings: meanings ?? this.meanings,
      dateTime: dateTime ?? this.dateTime,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
