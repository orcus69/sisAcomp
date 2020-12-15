import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sisAcomp/models/matter.dart';
import 'package:sisAcomp/models/matterManager.dart';
import 'package:sisAcomp/models/userManager.dart';
import 'package:sisAcomp/screens/base/baseScreen.dart';
import 'package:provider/provider.dart';
import 'package:sisAcomp/screens/login/loginScreen.dart';
import 'package:sisAcomp/screens/matter/matterScreen.dart';
import 'package:sisAcomp/screens/signup/signupScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => MatterManager(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        title: 'Loja do Daniel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 4, 125, 141),
          scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
          appBarTheme: const AppBarTheme(
            elevation: 0
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        initialRoute: '/base',
        onGenerateRoute: (settings){
          switch(settings.name){
             case '/login':
              return MaterialPageRoute(
                  builder: (_) => LoginScreen()
              );
            case '/signup':
              return MaterialPageRoute(
                  builder: (_) => SignUpScreen()
              );
            case '/matter':
              return MaterialPageRoute(
                  builder: (_) => MatterScreen(
                    settings.arguments as Matter
                  )
              );
            case '/base':
            default:
              return MaterialPageRoute(
                  builder: (_) => BaseScreen()
              );
          }
        },
      ),
    );
  }
}