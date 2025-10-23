import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/auth/loginScreen.dart';
import 'package:evently_app/auth/registerScreen.dart';
import 'package:evently_app/provider/app_theme_provider.dart';
import 'package:evently_app/provider/eventListProvider.dart';
import 'package:evently_app/provider/userProvider.dart';
import 'package:evently_app/tabs/add_event.dart';
import 'package:evently_app/tabs/profiletab.dart';
import 'package:evently_app/introdction_Screen.dart';
import 'package:evently_app/provider/app_language_provider.dart';
import 'package:evently_app/widgets/toggle.dart';
import 'package:evently_app/utls/approute.dart';
import 'package:evently_app/utls/appthem.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Homepage.dart';


import 'firebase_options.dart';
import 'firstScreen.dart';
import 'l10n/app_localizations.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final languageProvider=AppLanguageProvider();
  languageProvider.loadLanguage();
  // await FirebaseFirestore.instance.disableNetwork();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>AppLanguageProvider(),),
        ChangeNotifierProvider(create: (context)=>AppThemeProvider(),),
        ChangeNotifierProvider(create: (context)=>EventListProvider(),),
        ChangeNotifierProvider(create: (context)=>UserProvider(),)
      ],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    var appTheme=Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      locale: Locale(languageProvider.applanguage) ,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: Approuts.logoutScreen ,
    routes: {
      Approuts.logoutScreen :(context)=>logoutScreen(),
      Approuts.intro_screen :(context)=>IntrodctionScreen(),
     Approuts.loginscreen :(context)=>Loginscreen(),
      Approuts.registerScreen:(context)=>RegisterScreen(),
      Approuts.addevent:(context)=>AddEvent(),
      Approuts.homepage :(context)=>HomePage(),


    },
       darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: appTheme.appTheme ,
    );
  }
}