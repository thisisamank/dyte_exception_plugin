// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DyteException {
  final String message;
  final DateTime time;
  DyteException({
    required this.message,
    required this.time,
  });

  DyteException copyWith({
    String? message,
    DateTime? time,
  }) {
    return DyteException(
      message: message ?? this.message,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'time': time.millisecondsSinceEpoch,
    };
  }

  factory DyteException.fromMap(Map<String, dynamic> map) {
    return DyteException(
      message: map['message'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory DyteException.fromJson(String source) =>
      DyteException.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DyteException(message: $message, time: $time)';

  @override
  bool operator ==(covariant DyteException other) {
    if (identical(this, other)) return true;

    return other.message == message && other.time == time;
  }

  @override
  int get hashCode => message.hashCode ^ time.hashCode;
}
