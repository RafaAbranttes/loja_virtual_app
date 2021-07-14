import 'package:flutter/material.dart';
import 'package:lojavirtualestudo/tabs/home_tab.dart';
import 'package:lojavirtualestudo/tabs/orders_tab.dart';
import 'package:lojavirtualestudo/tabs/products_tab.dart';
import 'package:lojavirtualestudo/widgets/cart_button.dart';
import 'package:lojavirtualestudo/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
          floatingActionButton: CartButton(),
        ),
        Container(
          color: Colors.yellow,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Meus Pedidos"),
            centerTitle: true,
          ),
          body: OrdersTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Container(
          color: Colors.blue,
        ),
      ],
    );
  }
}
