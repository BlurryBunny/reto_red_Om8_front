import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reto_red_om8/config_screen.dart';
import 'package:reto_red_om8/screens/home/home_screen.dart';
import 'package:reto_red_om8/screens/register/components/inputForm.dart';

import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmPassword;
  String? name;
  final _userEmail = TextEditingController();
  final _userPassword = TextEditingController();
  final _userName = TextEditingController();

  final List<String> errors = [];

  bool loading = false;
  DateTime? dob;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _userName.dispose();
    _userEmail.dispose();
    _userPassword.dispose();
    super.dispose();
  }

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var children2 = [
      buildEmailFormField(),
      SizedBox(
        height: getProportionateScreenHeight(10),
      ),
      buildPasswordFormField(),
      SizedBox(
        height: getProportionateScreenHeight(10),
      ),
      buildConfirmPasswordFormField(),
      SizedBox(
        height: getProportionateScreenHeight(10),
      ),
      FormError(errors: errors),
      SizedBox(
        height: getProportionateScreenHeight(10),
      ),
      InputForm(
          hint_txt: 'Pepito',
          label_txt: 'Nombre',
          validator_txt: 'El nombre es requerido',
          controller_input: _userName,
          type_input: 'text'),
      SizedBox(
        height: getProportionateScreenHeight(60),
      ),
      DefaultButton(
          text: "Registrarse",
          press: () {
            if (_formKey.currentState!.validate()) {
              signUp(
                _userEmail,
                _userPassword,
                _userName,
              );
            }
          })
    ];

    // return the widget form
    return Form(
      key: _formKey,
      child: Column(
        children: children2,
      ),
    );
  }

  Future signUp(
    TextEditingController userEmailController,
    TextEditingController userPasswordController,
    TextEditingController userName,
  ) async {
    // Try to create a new user
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userEmailController.text.trim(),
              password: userPasswordController.text.trim());

      // if all right then create the instance of user

      // Create the Json data
      final json = {
        'email': userEmailController.text.trim(),
        'password': userPasswordController.text.trim(),
        'name': userName.text.trim(),
      };

      // Log in bedo save data
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmailController.text.trim(),
          password: userPasswordController.text.trim());

      // set data
      FirebaseFirestore.instance.collection('users').add(json);
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, HomeScreen.routeNavigator);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  bool passwordConfirmed() {
    if (password == confirmPassword) {
      return true;
    }
    return false;
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue ?? "",
      onChanged: (value) {
        if (password == confirmPassword) {
          removeError(error: kMatchPassError);
        }
        confirmPassword = value;
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        } else if (password != confirmPassword) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Confirmar contraseña",
        hintText: "Confirma tu contraseña",
        errorStyle: TextStyle(height: 0.0),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: Icon(
            Icons.password,
          ),
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: _userPassword,
      onSaved: (newValue) => password = newValue ?? "",
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Contraseña",
        hintText: "Ingresa tu contraseña",
        errorStyle: TextStyle(height: 0.0),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: Icon(
            Icons.password,
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: _userEmail,
        onSaved: (newValue) => email = newValue ?? "",
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kEmailNullError);
          } else if (emailValidatorRegExp.hasMatch(value)) {
            removeError(error: kInvalidEmailError);
          }
          return;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kEmailNullError);
            return "";
          } else if (!emailValidatorRegExp.hasMatch(value)) {
            addError(error: kInvalidEmailError);
            return "";
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: "Correo electrónico",
          hintText: "Ingresa tu correo electrónico",
          errorStyle: TextStyle(height: 0.0),
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Icon(
              Icons.email,
            ),
          ),
        ));
  }
}
