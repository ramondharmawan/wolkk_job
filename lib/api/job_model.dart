class JobResponse {
  final bool success;
  final String message;
  final Pagination pagination;
  final List<Job> data;

  JobResponse({
    required this.success,
    required this.message,
    required this.pagination,
    required this.data,
  });

  factory JobResponse.fromJson(Map<String, dynamic> json) {
    return JobResponse(
      success: json['success'],
      message: json['message'],
      pagination: Pagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((job) => Job.fromJson(job)).toList(),
    );
  }
}

class Pagination {
  final int from;
  final int to;
  final int lastPage;
  final int perPage;
  final int total;

  Pagination({
    required this.from,
    required this.to,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      from: int.parse(json['from'].toString()),
      to: int.parse(json['to'].toString()),
      lastPage: int.parse(json['last_page'].toString()),
      perPage: int.parse(json['per_page'].toString()),
      total: int.parse(json['total'].toString()),
    );
  }
}

class Job {
  final int id;
  final String title;
  final String location;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updatedAt;

  Job({
    required this.id,
    required this.title,
    required this.location,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      title: json['title'],
      location: json['location'],
      tags: List<String>.from(json['tag']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
