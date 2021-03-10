import 'package:flutter/material.dart';
import 'package:lojavirtualestudo/models/cart_model.dart';
import 'package:lojavirtualestudo/models/user_model.dart';
import 'package:lojavirtualestudo/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return ScopedModel<CartModel>(
            model: CartModel(model),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Loja de Roupas',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                primaryColor: Color.fromARGB(255, 4, 125, 141),
              ),
              home: HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
