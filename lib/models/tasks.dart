import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Task extends Equatable {
  final String title;
  final String description;
  final String id;
  final String date;
  bool? isFavourite;
  bool? isDone;
  bool? isDeleted;
  Task({
    required this.title,
    required this.description,
    required this.id,
    required this.date,
    this.isFavourite,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isFavourite = isFavourite ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({
    String? title,
    String? id,
    String? date,
    String? description,
    bool? isDone,
    bool? isFavourite,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
      isFavourite: isFavourite ?? this.isFavourite,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, id, isDone, isDeleted];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'id': id,
      'date': date,
      'isDone': isDone,
      'isFavourite': isFavourite,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      description: map['description'] as String,
      id: map['id'] as String,
      date: map['date'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isFavourite:
          map['isFavourite'] != null ? map['isFavourite'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }
}


// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// // ignore_for_file: public_member_api_docs, sort_constructors_first
// class Task extends Equatable {
//   final String title;
//   final String id;
//   bool? isDone;
//   bool? isDeleted;
//   Task({
//     required this.title,
//     required this.id,
//     this.isDone,
//     this.isDeleted,
//   }) {
//     isDone = isDone ?? false;
//     isDeleted = isDeleted ?? false;
//   }

//   Task copyWith({
//     String? title,
//     String? id,
//     bool? isDone,
//     bool? isDeleted,
//   }) {
//     return Task(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       isDone: isDone ?? this.isDone,
//       isDeleted: isDeleted ?? this.isDeleted,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'title': title,
//       'id': id,
//       'isDone': isDone,
//       'isDeleted': isDeleted,
//     };
//   }

//   factory Task.fromMap(Map<String, dynamic> map) {
//     return Task(
//       title: map['title'] ?? '' as String,
//       id: map['id'] ?? '' as String,
//       isDone: map['isDone'] != null ? map['isDone'] as bool : null,
//       isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
//     );
//   }

//   @override
//   // TODO: implement props
//   List<Object?> get props => [title, id, isDone, isDeleted];
// }
