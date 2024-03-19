
import 'package:flutter/material.dart';
import 'package:notes_app/Helpers/AppNavigations/NavigationConfig.dart';
import 'package:notes_app/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {

  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF252525)),
        onGenerateRoute: AppRoute(
            initialPage: Pages.homeScreenConfig,
            initialPageData: null
        ).onGenerateRoute,
        // home: Scaffold(
        //   body: Text("Hello World!"),
        // ),
      ),
    );
  }
}