
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/json_model.dart';
// import 'Users  .dart';

void main() {
  runApp(apidemo());
}


class apidemo extends StatefulWidget {
  apidemo({Key? key}) : super(key: key);

  @override
  _apidemoState createState() => _apidemoState();
}

class _apidemoState extends State<apidemo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Service {
  static const String url = 'https://api.github.com/users';

  static get https => null;
  static Future<List<Users>> getUsers() async{
    try {
      final response = await https.get(url);
      if (200 == response.statusCode) {
        final List<Users> users = usersFromJson(response.body);
        return users;
        
      }else{
        // ignore: deprecated_member_use
        return <Users>[];
      }
    } catch (e) {
      // ignore: deprecated_member_use
      return <Users>[];
    }
  }
   late List<Users> _users;
   late bool _isLoading;

   @override
   void initState() {
     _isLoading = true;
     Services.getUsers().then((users) {
       _users = users;
       _isLoading = false;
     }); 
   }
   @override
   Widget build(BuildContext context) {
     return  Scaffold(
       appBar: AppBar(
         title: Text(_isLoading ?'Load Data': 'Users'),
       ),
       body: Container(
         color: Colors.blue,
         child: ListView.builder(
           itemCount: null == _users? 0 : _users.length,
           itemBuilder: (context, index){
           Users users = _users as Users;
           return ListTile(
            //  title: Text(users.name),
            //  subtitle: Text(users.email),
           );
         }),
       ),
     );
   }

  
}

class Services {
  static getUsers() {}
}