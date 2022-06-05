import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dobin_finance_mobile_test/pages/register.dart';
import 'package:dobin_finance_mobile_test/providers/auth.dart';
import 'package:dobin_finance_mobile_test/providers/user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
          title: 'Dobin mobile application test',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: FutureBuilder(builder: (context, snapshot) {
            // print(snapshot);
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.none:
                return Register();
              default:
                return null;
            }
          }),
          routes: {
            '/register': (context) => Register(),
          }),
    );
  }
}
