import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateful {
  String? id, name, job, createdAt;

  HttpStateful({this.id, this.name, this.job, this.createdAt});

  Future<HttpStateful> connect(String name, String job) async {
    var url = Uri.parse('https://reqres.in/api/users');

    var data = await http.post(url, body: {
      "name": name,
      "job": job,
    });

    var response = json.decode(data.body);

    return HttpStateful(
      id: response['id'],
      name: response['name'],
      job: response['job'],
      createdAt: response['createdAt'],
    );
  }
}
