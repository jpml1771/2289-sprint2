import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/banner.dart';
import '../Widgets/cart_total.dart';
import 'product_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          child: Column(children: [
        Stack(
          children: [buildProfileImage(), customAppBar()],
        ),
        const SizedBox(
          height: 60,
        ),
        const Text("Brad Wilson",
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w700)),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Kilcoole, Waterford",
          style: TextStyle(
              fontSize: 18.0,
              color: Colors.black45,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w300),
        ),
        CartTotal()
      ])),
    );
  }

  Widget buildProfileImage() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 60),
        child: const
            //CustomBanner(200),
            CircleAvatar(
          backgroundImage: NetworkImage("https://i.pravatar.cc/150"),
          radius: 80,
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
            onTap: () => Get.to(() => ProductList(),
                transition: Transition.circularReveal,
                duration: const Duration(seconds: 1)),
            child: const Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
