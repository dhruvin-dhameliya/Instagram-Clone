import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instaclon_flutterfire/providers/use_providerr.dart';
import 'package:instaclon_flutterfire/responsive/mobail_screen_layout.dart';
import 'package:instaclon_flutterfire/responsive/responsive_layout_screen.dart';
import 'package:instaclon_flutterfire/responsive/web_screen_layout.dart';
import 'package:instaclon_flutterfire/screen/home_screen.dart';
import 'package:instaclon_flutterfire/screen/login_screen.dart';
import 'package:instaclon_flutterfire/screen/sign_up_screen.dart';
import 'package:instaclon_flutterfire/util/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        // must add for web project
        apiKey: "AIzaSyCxOdjJd6YIMk3Xo6IskWdDAVjriFt8ePM",
        authDomain: "instaclone-flutterfire.firebaseapp.com",
        projectId: "instaclone-flutterfire",
        storageBucket: "instaclone-flutterfire.appspot.com",
        messagingSenderId: "505425614503",
        appId: "1:505425614503:web:d2b6e536a89d6d3076ed82",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Instagram Clone',
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                  webScreenLayout: webScreenLayout(),
                  mobailScreenLayout: mobailScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            return const LoginScreen();
          },
        ),
        // initialRoute: '/loginPage',
        routes: {
          '/loginPage': (context) => const LoginScreen(),
          '/signUpPage': (context) => const SignUpScreen(),
          '/homePage': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
