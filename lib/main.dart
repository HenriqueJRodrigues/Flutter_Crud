import 'package:flutter/material.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:flutter_crud/views/user_form.dart';
import 'package:flutter_crud/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(      
      create: (ctx)=>  Users(),  
      ),
      ],
      child: MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: Colors.cyan,
      ),
      routes:{
      AppRoutes.HOME:(_)=> UserList(),
      AppRoutes.USER_FORM: (ctx) => UserForm(),
      },
      ),
    );
  }
}

