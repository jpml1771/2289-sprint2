import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/product.dart';
import '../Widgets/banner.dart';
import '../controllers/shopping_controller.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ShoppingController shoppingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 15, 95, 194),
              Color.fromARGB(255, 108, 152, 205),
              Color.fromARGB(255, 192, 195, 200),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  customAppBar(),
                ],
              ),
              // TODO
              // aquí debemos rodear el widget Expanded en un Obx para
              // observar los cambios en la lista de entries del shoppingController
              Obx(
                () => Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: shoppingController.entries.length,
                      itemBuilder: (context, index) {
                        return _row(shoppingController.entries[index], index);
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _row(Product product, int index) {
    return _card(product);
  }

  Widget _card(Product product) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(product.name),
        Text(product.price.toString()),
        Column(
          children: [
            IconButton(
                onPressed: () {
                  shoppingController.agregarProducto(product.id);
                  // TODO
                  // aquí debemos llamar al método del controlador que
                  // incrementa el número de unidades del producto
                  // pasandole el product.id
                },
                icon: const Icon(Icons.arrow_upward)),
            IconButton(
                onPressed: () {
                  shoppingController.quitarProducto(product.id);
                  // TODO
                  // aquí debemos llamar al método del controlador que
                  // disminuye el número de unidades del producto
                  // pasandole el product.id
                },
                icon: const Icon(Icons.arrow_downward))
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Quantity"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.quantity.toString()),
            ),
          ],
        )
      ]),
    );
  }
}
