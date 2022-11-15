import 'dart:html';

import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  // lista de productos
  var entries = <Product>[].obs;
  // el valor total de la compra
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // los dos elementos que vamos a tener en la tienda
    entries.add(Product(0, "Toy car", 10));
    entries.add(Product(1, "Toy house", 20));
  }

  void calcularTotal() {
    int newTotal = 0;
    for (var entry in entries) {
      newTotal = newTotal + entry.price * entry.quantity;
    }
    // TODO
    // calcular el valor total de los elementos en el carro de compras
    //print(total.value);
    total.value = newTotal;
  }

  void agregarProducto(id) {
    logInfo('agregarProducto $id');
    var entry = entries.firstWhere((element) => element.id == id);
    var index = entries.indexOf(entry);
    entry.quantity++;
    entries[index] = entry;
    // TODO
    // Encontrar el elemento usando el id, revisar el método firstWhere de la lista
    // después obtener el index de ese elemento, revisar el método indexOf de la lista
    // después hacer el incremento en la cantidad
    // finalmente actualizar entries usando el indice y el elemento actualizado
    //print(entry.quantity);
    calcularTotal();
  }

  void quitarProducto(id) {
    logInfo('quitarProducto $id');
    var entry = entries.firstWhere((element) => element.id == id);
    var index = entries.indexOf(entry);
    if (entry.quantity > 0) {
      entry.quantity--;
      entries[index] = entry;
    }
    //print(entry.quantity);
    // TODO
    // similar a agregarProducto
    // validar cuando la cantidad es igual a cero
    calcularTotal();
  }
}
