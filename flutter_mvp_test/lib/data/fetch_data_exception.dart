import 'dart:core';
class FetchDataException implements Exception{
  final String _message ;
  FetchDataException(this._message);
  @override
  String toString() {
    return 'An error occured :  $_message ' ;
  }
}