import 'dart:convert';

import 'package:desafio_picpay/src/shared/models/users.dart';
import 'package:dio/dio.dart';


class UserRepository {
  final String _endpoint = "http://careers.picpay.com/tests/mobdev/users";
  final Dio _dio = Dio();

  Future<UserResponse> fetchUsers() async {    
     try {
      Response response = await _dio.get(_endpoint);
      print(response);
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      throw Exception("Ocorreu uma exceção: $error stackTrace: $stacktrace");
    } 
    // if (response.statusCode == 200) {
    //   final lista = json.decode(response.body);
    //   final users = lista.map<User>((user) => User.fromJson(user)).toList();
    //   return users;
    // } 
    // return null;
  }

  

}