import 'package:split/utils/constants/constant.dart';
import 'package:split/utils/enums/global.dart';

class Task {
  final String? id;
  final String? name;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  final Priorities? priority;
  final String? description;
  final Status? status;
  final String? createBy;
  final DateTime? createAt;
  final DateTime? modifiedAt;

  Task({
    this.id,
    this.name,
    this.startDateTime,
    this.endDateTime,
    this.priority,
    this.description,
    this.status,
    this.createBy,
    this.createAt,
    this.modifiedAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json[KeyTask.keyId],
      name: json[KeyTask.keyName],
      startDateTime: DateTime.parse(json[KeyTask.keyStartDateTime]),
      endDateTime: DateTime.parse(json[KeyTask.keyEndDateTime]),
      priority: Priorities.values[json[KeyTask.keyPriority]],
      description: json[KeyTask.keyDescription],
      status: Status.values[json[KeyTask.keyStatus]],
      createBy: json[KeyTask.keyCreateBy],
      createAt: DateTime.parse(json[KeyTask.keyCreateAt]),
      modifiedAt: DateTime.parse(json[KeyTask.keyModifiedAt]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      KeyTask.keyId: id,
      KeyTask.keyName: name,
      KeyTask.keyStartDateTime: startDateTime.toString(),
      KeyTask.keyEndDateTime: endDateTime.toString(),
      KeyTask.keyPriority: priority?.index,
      KeyTask.keyDescription: description,
      KeyTask.keyStatus: status?.index,
      KeyTask.keyCreateBy: createBy,
      KeyTask.keyCreateAt: createAt.toString(),
      KeyTask.keyModifiedAt: modifiedAt.toString(),
    };
  }
}
