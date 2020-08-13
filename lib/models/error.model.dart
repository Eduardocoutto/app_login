
/*https://stackoverflow.com/questions/17488611/how-to-create-private-variables-in-dart*/
class Error{
  final int statusCode;
  final String error;
  final String message;
  

  /*construtor*/
  Error({this.statusCode,this.error,this.message});

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      statusCode: json['statusCode'],
      error: json['error'],
      message: json['message']
    );
  }

  /* Map toJson() {
    return {'id': id, 'name': name, 'email': email};
  } */

/*funções [...]*/

}