import 'package:chapter_1/data_provider.dart';
import 'package:chapter_1/product_menu.dart';
import 'package:flutter/material.dart';

import 'data_model/data_model.dart';

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
  // ignore: non_constant_identifier_names
  DataProvider data = DataProvider();
  List<Recipe> recipe_data = [];
  @override
  void initState() {
    super.initState();
    recipe_data = DataProvider.samples;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // 2
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // 3
      body: SafeArea(
        // TODO: Replace child: Container()
        // 4
        child: ListView.builder(
          // 5
          itemCount: recipe_data.length,
          // 6
          itemBuilder: (BuildContext context, int index) {
            // 7
            // TODO: Update to return Recipe card
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  child: SizedBox(
                      height: 460,
                      child: Card(
                          elevation: 10,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(recipe_data[index].label),
                              const SizedBox(height: 10),
                              Image.asset(recipe_data[index].imageUrl)
                            ],
                          ))),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductMenu(
                                image: recipe_data[index].imageUrl,
                                label: recipe_data[index].label,
                                title: 'Product Menu',
                                recipe: recipe_data[index],
                              )),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
