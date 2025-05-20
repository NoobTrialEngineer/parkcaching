import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parkcaching_v3/screen/login.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password, _passwordConfirm, _name;

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
                  'assets/Images/background_signup.jpg',
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
                        'Registro',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            label: Text(
                              'Nombre',
                              style: TextStyle(color: Colors.white),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          onChanged: (value) => {
                            setState(() {
                              _name = value;
                            })
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            label: Text(
                              'Correo electrónico',
                              style: TextStyle(color: Colors.white),
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          onChanged: (value) => {
                            setState(() {
                              _email = value;
                            })
                          },
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
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          onChanged: (value) => {
                            setState(() {
                              _password = value;
                            })
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            label: Text(
                              'Confirmar contraseña',
                              style: TextStyle(color: Colors.white),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          onChanged: (value) => {
                            setState(() {
                              _passwordConfirm = value;
                            })
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        margin: EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: ElevatedButton(
                          onPressed: signUp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: Text(
                            'REGISTRARSE',
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
                              left: 25,
                              right: 25,
                              top: 25,
                              bottom: 15,
                            ),
                          ),
                          Text(
                            '¿Ya tienes una cuenta?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          Container(
                            width: 25,
                            height: 1,
                            color: Colors.white,
                            margin: EdgeInsets.only(
                              left: 25,
                              right: 25,
                              top: 25,
                              bottom: 15,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        margin: EdgeInsets.only(left: 25, right: 25, top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: Text(
                            'INICIAR SESIÓN',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      if (_email.isNotEmpty &&
          _password.isNotEmpty &&
          _passwordConfirm.isNotEmpty) {
        if (!_isValidEmail(_email)) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content:
                    Text('Por favor, ingrese un correo electrónico válido.'),
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

        if (_password != _passwordConfirm) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('Las contraseñas no coinciden.'),
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
          UserCredential userCredential =
              await _auth.createUserWithEmailAndPassword(
            email: _email,
            password: _password,
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        } catch (e) {
          String errorMessage;
          if (e is FirebaseAuthException) {
            switch (e.code) {
              case 'email-already-in-use':
                errorMessage = 'El correo electrónico ya está en uso.';
                break;
              case 'weak-password':
                errorMessage = 'La contraseña es demasiado débil.';
                break;
              default:
                errorMessage =
                    'Error de autenticación. Por favor, intente de nuevo.';
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
