import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data_model/data_model.dart';
import 'data_provider.dart';
import 'main.dart';

class ProductMenu extends StatefulWidget {
  const ProductMenu(
      {Key? key,
      required this.title,
      required this.image,
      required this.label,
      required this.recipe})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  // ignore: prefer_typing_uninitialized_variables
  final recipe;
  final String title;
  final String image;
  final String label;

  @override
  State<ProductMenu> createState() => _ProductMenu();
}

class _ProductMenu extends State<ProductMenu> {
  // ignore: non_constant_identifier_names
  DataProvider data = DataProvider();
  // ignore: non_constant_identifier_names
  List<Recipe> recipe_data = [];
  int _sliderVal = 1;
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
        backgroundColor: Colors.black45,
        title: Text(widget.title),
      ),
      // 3
      body: SafeArea(
          // TODO: Replace child: Container()
          // 4
          child: Card(
        // 1
        elevation: 2.0,
        // 2
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        // 3
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // 4
          child: Column(
            children: <Widget>[
              Image.asset(widget.image),
              // 5
              const SizedBox(
                height: 14.0,
              ),
              // 6
              Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Palatino',
                ),
              ),
              Expanded(
                // 8
                child: ListView.builder(
                  padding: const EdgeInsets.all(7.0),
                  itemCount: widget.recipe.ingredients.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ingredient = widget.recipe.ingredients[index];
                    // 9
                    return Text('${ingredient.quantity * _sliderVal} '
                        '${ingredient.measure} '
                        '${ingredient.name}');
                  },
                ),
              ),
            ],
          ),
        ),
      )),
      bottomSheet: SizedBox(
          height: 100,
          child: Card(
            child: Slider(
              // 10
              min: 1,
              max: 10,
              divisions: 10,
              // 11
              label: '${_sliderVal * widget.recipe.servings} servings',
              // 12
              value: _sliderVal.toDouble(),
              // 13
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
              // 14
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            ),
          )),
    );
  }
}
