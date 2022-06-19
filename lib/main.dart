import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:milo/screens/auth_screen.dart';
import 'package:milo/screens/patient/home_screen.dart';
import 'package:milo/services/authentication.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  locationPermission();
  runApp(const MyApp());
}

Future locationPermission() async {
  Location location = Location();
  var serviceEnabled = await location.serviceEnabled();
  while (!serviceEnabled) {
    serviceEnabled = await location.requestService();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamProvider<User?>.value(
        value: AuthenticationService().userStream,
        builder: (context, snapshot) {
          User? user = Provider.of<User?>(context);
          print('User @main.dart ${user?.uid}');
          if (user == null) {
            return const AuthScreen();
          }
          return const HomeScreen();
        },
        initialData: null,
      ),
    );
  }
}
