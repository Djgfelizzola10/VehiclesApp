// ignore_for_file: avoid_types_as_parameter_names

import 'dart:convert';

import 'package:vehicles_app/helpers/constans.dart';
import 'package:vehicles_app/models/procedure.dart';
import 'package:vehicles_app/models/responrse.dart';
import 'package:http/http.dart' as http;

class ApiHelper {

  static Future<Response> getProcedures(String token) async{
    var url=Uri.parse('${Constans.apiUrl}/api/Procedures');
    var response=await http.get(
      url,
      headers:{
        'content-type':'application/json',
        'accept' : 'application/json',
        'authorization':'bearer $token',
      },
    );

    var body = response.body;
    if(response.statusCode >= 400){
      return Response(isSuccess: false, message: body);
    }

    List<Procedure> list = [];
    var decodeJson = jsonDecode(body);
    if(decodeJson!=null){
      for (var item in decodeJson) {
        list.add(Procedure.fromJson(item));
      }
    }
    return Response(isSuccess: true,result: list);
  } 

  static Future<Response> put(String controller,String id, Map<String, dynamic> request,String token) async{
    var url=Uri.parse('${Constans.apiUrl}$controller$id');
    var response=await http.put(
      url,
      headers:{
        'content-type':'application/json',
        'accept' : 'application/json',
        'authorization':'bearer $token',
      },
      body: jsonEncode(request),
    );

    if(response.statusCode >= 400){
      return Response(isSuccess: false, message: response.body);
    }

    return Response(isSuccess: true);
  } 

  static Future<Response> post(String controller, Map<String, dynamic> request,String token) async{
    var url=Uri.parse('${Constans.apiUrl}$controller');
    var response=await http.post(
      url,
      headers:{
        'content-type':'application/json',
        'accept' : 'application/json',
        'authorization':'bearer $token',
      },
      body: jsonEncode(request),
    );

    if(response.statusCode >= 400){
      return Response(isSuccess: false, message: response.body);
    }

    return Response(isSuccess: true);
  }
  
  static Future<Response> delete(String controller,String id,String token) async{
    var url=Uri.parse('${Constans.apiUrl}$controller$id');
    var response=await http.delete(
      url,
      headers:{
        'content-type':'application/json',
        'accept' : 'application/json',
        'authorization':'bearer $token',
      },
    );

    if(response.statusCode >= 400){
      return Response(isSuccess: false, message: response.body);
    }

    return Response(isSuccess: true);
  } 
}