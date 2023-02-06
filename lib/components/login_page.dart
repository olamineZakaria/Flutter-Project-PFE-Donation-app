import 'package:flutter/material.dart';
import 'package:login_signup/Welcom.dart';
import 'package:login_signup/components/common/custom_input_field.dart';
import 'package:login_signup/components/common/page_header.dart';
import 'package:login_signup/components/forget_password_page.dart';
import 'package:login_signup/components/signup_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:login_signup/components/common/page_heading.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signup/components/common/custom_form_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _loginFormKey = GlobalKey<FormState>();
  // final _auth = FirebaseAuth.instance;
  // late String email;
  // late String password;
//  bool showspinner = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // add MOdal progress HUd fpr spinner
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: [
            const PageHeader(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(221, 230, 252, 1),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                    //  bottom: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    //      key: _loginFormKey,
                    child: Column(
                      children: [
                        const PageHeading(
                          title: 'Se connecter',
                        ),
                        CustomInputField(
                            labelText: 'Email',
                            hintText: 'Nom d' 'utilisateur,Email',
                            validator: (textValue) {
                              //  email = textValue!;
                              if (textValue == null || textValue.isEmpty) {
                                return 'Email est requis !';
                              }
                              if (!EmailValidator.validate(textValue)) {
                                return 'Veuillez entrer un email valide';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomInputField(
                          labelText: 'Mot de passe',
                          hintText: 'Mot de passe',
                          obscureText: true,
                          suffixIcon: true,
                          validator: (textValue) {
                            //   password = textValue!;
                            if (textValue == null || textValue.isEmpty) {
                              return 'Mot de passe requis!';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: size.width * 0.80,
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgetPasswordPage()))
                            },
                            child: const Text(
                              'Mot de passe oublié ! ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: _handleLoginUser,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(241, 108, 108, 1)),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 70, vertical: 15)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                          child: Text(
                            "connexion",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Pas encore inscrit ?',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 58, 57, 57),
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignupPage()))
                                },
                                child: const Text(
                                  ' inscrire',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: () {
                            // signup;
                          },
                          child: const Text(
                            ' à propos de nous',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLoginUser() async {
    if (_loginFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          'Envoi de données ...',
          style: TextStyle(color: Colors.green),
        )),
      );
    }
    // if (_loginFormKey.currentState!.validate()) {
    //   setState(() {
    //     showspinner = true;
    //   });
    //   try {
    //     final user = await _auth.signInWithEmailAndPassword(
    //         email: email, password: password);
    //     if (user != null) {
    //       Navigator.push(context,
    //           MaterialPageRoute(builder: (context) => const SignupPage()));
    //       setState(() {
    //         showspinner = false;
    //       });
    //     }
    //   } catch (e) {}
    // }
  }
}
