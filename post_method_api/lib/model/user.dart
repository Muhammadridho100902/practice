import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  String? id;
  String? name;
  String? job;
  String? created;

  Api({
     this.id,
     this.name,
     this.job,
     this.created,
  });

  factory Api.fromJson(Map<String, dynamic> json) {
    return Api(
      id: json['id'],
      name: json['name'],
      job: json['job'],
      created: json['createdAt'],
    );
  }

  Future<Api> postData(String name, String job) async {
    String mainUrl = "https://reqres.in/api/users";

    var response = await http.post(
      Uri.parse(mainUrl),
      body: {
        'name': name,
        'job': job,
      },
    );

    var result = json.decode(response.body);

    return Api.fromJson(result);
  }
}
