class Sucess {
  int? code;
  Object? response;
  Sucess({this.code, this.response});
}

class Failure {
  int code;
  Object errorresponse;
  Failure({required this.code, required this.errorresponse});
}
