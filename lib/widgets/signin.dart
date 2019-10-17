import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musicmaniac/stores/user/user.dart';
import 'package:musicmaniac/utils/validators.dart';
import 'package:musicmaniac/widgets/customTextField.dart';
import 'package:musicmaniac/widgets/loading_dialog.dart';
import 'package:musicmaniac/widgets/logger.dart';
import './button.dart';

class SignIn extends StatefulWidget {

  UserStore _store = UserStore();

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isPassVisible = false;
  bool autoValidate = false;
  bool buttonDisabled = false;
  bool isLoading = false;

  String _email;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey();

  void togglePassVisibility() {
    setState(() {
      _isPassVisible = !_isPassVisible;
    });
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    setState(() {
      autoValidate = true;
    });
    if (form.validate()) {
      form.save();
      return true;
    } else
      return false;
  }

  void validateForm(BuildContext context) async {
    if (validateAndSave()) {
      try {
        setState(() {
          isLoading = true; 
        });
        await widget._store.login(_email, _password);
      } catch (e) {
        setState(() {
          isLoading = false; 
        });
        Logger.error(code: e.code, context: context);
        print(e.code);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // Observer(
    //   builder: (_) {
    //     if(widget._store.state == LoadingState.Loading)
    //       return Center(child: CircularProgressIndicator(),);
    //     else
    //   }
    // )
    if(isLoading) {
      return LoadingDialog();
    } else {
      return Material(
        elevation: 0,
        color: Colors.transparent,
        child: Form(
          key: _formKey,
          autovalidate: autoValidate,
          child: Column(
            children: <Widget>[
              Text("Welcome back",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                onSaved: (input) {
                  _email = input;
                },
                autovalidate: autoValidate,
                autofocus: false,
                validator: Validators.emailValidator,
                icon: Icon(Icons.email),
                hint: "Email",
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                onSaved: (input) {
                  _password = input;
                },
                obsecure: !_isPassVisible,
                autofocus: false,
                autovalidate: autoValidate,
                validator: Validators.passwordValidator,
                icon: IconButton(
                  icon: _isPassVisible
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onPressed: () {
                    togglePassVisibility();
                  },
                ),
                hint: "Password",
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 20,
              ),
              ButtonWidget(
                text: 'Login',
                color: ButtonStyles.ACCENT,
                mode: ButtonStyles.FLAT,
                disabled: buttonDisabled,
                onPressed: () async {
                  validateForm(context);
                },
              )
            ],
          ),
        ),
      );
    }
  }
}
