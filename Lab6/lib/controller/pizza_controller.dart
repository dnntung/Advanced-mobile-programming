import 'package:food_list_demo/models/pizza.dart';
import 'package:food_list_demo/utils/httphelper.dart';

class PizzaController {
  Future<List<Pizza>> callPizzas() async {
    print('Use HttpHelper to get list of pizzas...');
    HttpHelper helper = HttpHelper();
    List<Pizza> pizzas = await helper.getPizzaList();

    return pizzas;
  }
}
