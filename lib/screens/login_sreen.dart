import 'package:flutter/material.dart';
import 'package:lojavirtualestudo/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: Text(
              "CRIAR CONTA",
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
            style: TextButton.styleFrom(
              textStyle: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "E-mail"),
              keyboardType: TextInputType.emailAddress,
              // ignore: missing_return
              validator: (text) {
                if (text.isEmpty || !text.contains("@")) {
                  return "E-mail inválido";
                }
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Senha"),
              obscureText: true,
              // ignore: missing_return
              validator: (text) {
                if (text.isEmpty || text.length < 6) {
                  return "Senha inválida!";
                }
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onLongPress: () {},
                child: Text(
                  "Esqueci minha senha",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 44.0,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {}
                },
                child: Text(
                  "Entrar",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
