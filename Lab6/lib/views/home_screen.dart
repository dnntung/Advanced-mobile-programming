import 'package:flutter/material.dart';
import 'package:food_list_demo/data_provider.dart';
import 'package:food_list_demo/views/newedit_pizza_screen.dart';
import 'dart:convert';
import '../models/pizza.dart';
import 'package:food_list_demo/utils/httphelper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pizzaController = DataProvider.of(context);

    Widget _renderPizza(itemData) {
      return ListTile(
        title: Text(itemData.pizzaName),
        subtitle: Text("${itemData.description} \$ ${itemData.price}"),
        onTap: () {
          _editPizza(context, itemData);
        },
      );
    }

    return Container(
      child: FutureBuilder(
        future: pizzaController
            .callPizzas(), // callPizzas(), //readJsonFile(context),
        builder: (BuildContext context, AsyncSnapshot<List<Pizza>> pizzas) {
          return ListView.builder(
            itemCount: pizzas.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              var itemData = pizzas.data![index];
              return Dismissible(
                key: Key(itemData.id.toString()),
                child: _renderPizza(itemData),
                onDismissed: (item) {
                  HttpHelper httpHelper = HttpHelper();
                  httpHelper.deletePizza(item.index);
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<List<Pizza>> readJsonFile(context) async {
    String myString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizza_list.json');

    List myMap = jsonDecode(myString);
    List<Pizza> myPizzas = [];
    myMap.forEach((dynamic pizza) {
      Pizza myPizza = Pizza.fromJson(pizza);
      // Pizza myPizza = Pizza.fromJsonOrNull(pizza);
      myPizzas.add(myPizza);
    });

    return myPizzas;
  }

  void _editPizza(context, Pizza pizza) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => NewEditPizza(pizza: pizza)));
  }
}
