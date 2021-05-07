import 'package:flutter_post_req/user_model.dart';
import 'package:http/http.dart' as http;

Future<UserModel> createUser(String name, String jobTitle) async{
  final String apiUrl = "https://reqres.in/api/users";
  var client = http.Client();

  final response = await client.post(Uri.parse(apiUrl),
      body: {
        "name": name,
        "job": jobTitle
      }
  );
  if(response.statusCode == 201){
    final String responseString = response.body;
    return userModelFromJson(responseString);
  }else{
    return null;
  }
}