import 'dart:convert';
import 'package:apipre/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(MaterialApp(home: MyApp(),));
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var data ;
  Future getData()async {

 var response= await http.get(Uri.parse("https://reqres.in/api/users?page=2'"));
 setState(() {
   var decode = json.decode(response.body);
   data=decode["data"] ;
   print(data);
 });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Api'),
      centerTitle: true,
      ),
body: ListView.builder(
  itemCount: data==null?0:data.length,

  itemBuilder: (context, index){
return ListTile(
  title: Text(data[index]['first_name']),
  subtitle: Text(data[index]['email']),
 onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(reciveddata: data[index],)));
 },
);
  } ),
    );
  }
}
