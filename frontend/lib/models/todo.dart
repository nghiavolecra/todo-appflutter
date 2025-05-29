class Todo {
  final String? id;
  final String title;
  final String? content;
  final String status;
  final DateTime? datetime;

  Todo({
    this.id,
    required this.title,
    this.content,
    this.status = 'in_progress',
    this.datetime,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json['_id'],
    title: json['title'],
    content: json['content'],
    status: json['status'] ?? 'in_progress',
    datetime: json['datetime'] != null
        ? DateTime.parse(json['datetime'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'content': content,
    'status': status,
    'datetime': datetime?.toIso8601String(),
  };

  Todo copyWith({
    String? title,
    String? content,
    String? status,
    DateTime? datetime,
  }) {
    return Todo(
      id: id,
      title: title ?? this.title,
      content: content ?? this.content,
      status: status ?? this.status,
      datetime: datetime ?? this.datetime,
    );
  }
}
