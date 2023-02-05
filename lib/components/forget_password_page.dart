import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/components/common/custom_form_button.dart';
import 'package:login_signup/components/common/page_header.dart';
import 'package:login_signup/components/common/page_headerV2.dart';
import 'package:login_signup/components/common/page_heading.dart';
import 'package:login_signup/components/login_page.dart';
import 'package:login_signup/components/common/custom_input_field.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _forgetPasswordFormKey = GlobalKey<FormState>();
  // final _auth = FirebaseAuth.instance;
  late String email;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: [
            const PageHeaderV2(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _forgetPasswordFormKey,
                    child: Column(
                      children: [
                        const PageHeading(
                          title: 'Mot de passe oublié',
                        ),
                        CustomInputField(
                            labelText: 'Email',
                            hintText: 'Votre email ',
                            isDense: true,
                            validator: (textValue) {
                              email = textValue!;
                              if (textValue == null || textValue.isEmpty) {
                                return 'Le champ Email est obligatoire !';
                              }
                              if (!EmailValidator.validate(textValue)) {
                                return 'Veuillez entrer un email valide';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: _handleForgetPassword,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(241, 108, 108, 1)),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 15)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                          child: Text(
                            "Envoyer un code",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()))
                            },
                            child: const Text(
                              'Back to login',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff939393),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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

  void _handleForgetPassword() async {
    // forget passworda
    if (_forgetPasswordFormKey.currentState!.validate()) {
      // await _auth.sendPasswordResetEmail(email: email.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          'Consulter ta boite email',
          style: TextStyle(color: Colors.green),
        )),
      );
    }
  }
}
