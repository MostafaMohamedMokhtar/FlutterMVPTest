
import 'dart:convert';

import 'package:flutter_mvp_test/data/fetch_data_exception.dart';
import 'package:flutter_mvp_test/model/user.dart';
import 'package:http/http.dart' as http;

abstract class ContactDataRepository{
  Future<List<User>> fetchContacts() ;
}

class ContactDataRepositoryImp implements ContactDataRepository {
  final String _url = 'http://api.randomuser.me/?results=50' ;

  @override
  Future<List<User>> fetchContacts() async {
    http.Response response = await http.get(Uri.parse(_url));
    String jsonBody = response.body ;
    final statusCode = response.statusCode ;
    if(statusCode != 200 || jsonBody == null ){
      throw FetchDataException('statusCode: $statusCode');
    }
    Map<String , dynamic> parsedData = jsonDecode(jsonBody);
    List contacts = parsedData['results'];
    return contacts.map((user) => User.fromJson(user)).toList();
  }

}