import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parkcaching_v3/screen/menu_screen.dart';
import 'package:parkcaching_v3/screen/signup.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SizedBox(
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/Images/background_login.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                    color: Colors.black54,
                    colorBlendMode: BlendMode.darken,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.75,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.3),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/Images/logo.png',
                          width: 200,
                          height: 200,
                        ),
                        Text(
                          'Acceso',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              label: Text(
                                'Correo electronico',
                                style: TextStyle(color: Colors.white),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _email = value;
                              });
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              label: Text(
                                'Contraseña',
                                style: TextStyle(color: Colors.white),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _password = value;
                              });
                            },
                            obscureText: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          margin: EdgeInsets.only(left: 25, right: 25, top: 25),
                          child: ElevatedButton(
                            onPressed: signIn,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            child: Text(
                              'INICIAR SESION',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 25,
                              height: 1,
                              color: Colors.white,
                              margin: EdgeInsets.only(
                                  left: 25, right: 25, top: 25, bottom: 15),
                            ),
                            Text('No tienes cuenta?',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17)),
                            Container(
                              width: 25,
                              height: 1,
                              color: Colors.white,
                              margin: EdgeInsets.only(
                                  left: 25, right: 25, top: 25, bottom: 15),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            child: Text(
                              'REGISTRARSE',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  void signIn() async {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState?.save();
    if (_email.isNotEmpty && _password.isNotEmpty) {
      if (!_isValidEmail(_email)) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Por favor, ingrese un correo electrónico válido.'),
              actions: [
                ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        return;
      }

      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuScreen()),
        );
      } catch (e) {
        String errorMessage;
        if (e is FirebaseAuthException) {
          switch (e.code) {
            case 'user-not-found':
              errorMessage = 'Usuario no encontrado.';
              break;
            case 'wrong-password':
              errorMessage = 'Contraseña incorrecta.';
              break;
            default:
              errorMessage = 'Error de autenticación. Por favor, intente de nuevo.';
          }
        } else {
          errorMessage = 'Ocurrió un error. Por favor, intente de nuevo.';
        }

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(errorMessage),
              actions: [
                ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Por favor, complete todos los campos.'),
            actions: [
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

bool _isValidEmail(String email) {
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  return emailRegex.hasMatch(email);
}

}