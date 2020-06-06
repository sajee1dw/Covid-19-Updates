import 'package:covid_19/pages/home.dart';
import 'package:covid_19/providers/status.dart';
import 'package:covid_19/providers/utility.dart';
import 'package:covid_19/widjets/toggle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final StatusProvider status = StatusProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => UtilityProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ToggleButton(),
        ),
        FutureProvider(
          create: (BuildContext context) => status.getStatus(),
          catchError: (context, error) {
            print(error.toString());
          },
        )
      ],
      child: MaterialApp(
        title: 'COVID-19',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: HomePage()
      ),
    );
  }
}
