import 'package:chapter11/model/User.dart';
import 'package:flutter/material.dart';

import 'networking/user_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String apiUrl = 'http://localhost:3000/api/productType';
  User usermodel = new User();
  UserService user_api = new UserService();
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      user_api.fetchSettings(apiUrl);
      // user_api.fetchData(apiUrl);
    }

    return Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // ignore: prefer_const_literals_to_create_immutables
            Container(
              padding: EdgeInsets.all(12.0),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.60,
                  child: ElevatedButton(
                    onPressed: () {
                      user_api.fetchSettings(apiUrl);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xffef7823),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ))),
                  )),
              // GridView.builder(
              //     itemCount: usermodel.id!.length,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         crossAxisSpacing: 4.0,
              //         mainAxisSpacing: 4.0),
              //     itemBuilder: (BuildContext context, int index) {
              //       return Center(
              //         child: Container(child: Text("${usermodel.name}")),
              //       );
              //     })
              //     )
            )
          ])
        ])));
  }
}
