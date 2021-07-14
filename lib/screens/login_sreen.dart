import 'package:flutter/material.dart';
import 'package:lojavirtualestudo/models/user_model.dart';
import 'package:lojavirtualestudo/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passController = TextEditingController();

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
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                TextFormField(
                  controller: _emailController,
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
                  controller: _passController,
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
                    onPressed: () {
                      if (_emailController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Insira seu e-mail para recuperação"),
                            backgroundColor: Colors.redAccent,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        model.recoverPass(_emailController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Confira seu e-mail"),
                            backgroundColor: Theme.of(context).primaryColor,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
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

                      model.signIn(
                        email: _emailController.text,
                        pass: _passController.text,
                        onSuccess: _onSuccess,
                        onFail: _onFail,
                      );
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
          );
        },
      ),
    );
  }

  void _onSuccess() {
    Navigator.of(context).pop();
  }

  void _onFail() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Falha ao Entrar!"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
