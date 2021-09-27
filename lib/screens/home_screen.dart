import 'package:flutter/material.dart';
import 'package:vehicles_app/models/token.dart';

class HomeScreen extends StatefulWidget {
  final Token token;

  HomeScreen({required this.token});


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicles'),
      ),
      body: _getBody(),
      
    );
  }

 Widget _getBody() {
   return Container(
     margin: EdgeInsets.all(30),
     child: Center(
       child: Text(
         'Bienvenid@ ${widget.token.user.fullName}',
         style: TextStyle(
           fontSize: 20,
           fontWeight: FontWeight.bold
         ),
         ),
     ),
   );
 }
}