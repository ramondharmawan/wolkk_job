import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wolkk_job/api/job_model.dart';

final dio = Dio();

Future<JobResponse> getJobs(int page, int limit) async {
  final response = await dio.get(
    'https://private-anon-b14a1697c0-apilinkedin.apiary-mock.com/job',
    queryParameters: {'page': page, 'limit': limit},
  );
  if (kDebugMode) {
    print(const JsonEncoder.withIndent("     ")
        .convert(response.data)
        .toString());
  }
  return JobResponse.fromJson(response.data);
}
