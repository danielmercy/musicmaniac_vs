import 'package:flutter/material.dart';
import 'package:musicmaniac/pages/home.dart';
import 'package:musicmaniac/providers/auth.provider.dart';
import 'package:musicmaniac/utils/validators.dart';
import 'package:musicmaniac/widgets/account_role.dart';
import 'package:musicmaniac/widgets/loading_dialog.dart';
import 'package:provider/provider.dart';
import './button.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _isPassVisible = false;
  bool _isCPassVisible = false;
  bool autoValidate = false;
  String role;

  bool btnDisabled;
  bool btnLoading;
  bool isLoading = false;

  TextEditingController _cachedPassword;
  TextEditingController _email;
  TextEditingController _pass;
  TextEditingController _cpass;
  TextEditingController _role;
  TextEditingController _firstname;
  TextEditingController _lastname;
  TextEditingController _username;
  TextEditingController _phone;
  TextEditingController _genre;
  TextEditingController _state;
  TextEditingController _addr;
  TextEditingController _zip;


  @override
  void initState() {
    super.initState();
    btnDisabled = false;
    btnLoading = false;

    _cachedPassword = TextEditingController();
    _email = TextEditingController();
    _pass = TextEditingController();
    _cpass = TextEditingController();
    _role = TextEditingController();
    _firstname = TextEditingController();
    _lastname = TextEditingController();
    _username = TextEditingController();
    _phone = TextEditingController();
    _genre = TextEditingController();
    _state = TextEditingController();
    _addr = TextEditingController();
    _zip = TextEditingController();

  }

  @override
  void dispose() {
    _cachedPassword.dispose();
    _email.dispose();
    _pass.dispose();
    _cpass.dispose();
    _role.dispose();
    _firstname.dispose();
    _lastname.dispose();
    _username.dispose();
    _phone.dispose();
    _genre.dispose();
    _state.dispose();
    _addr.dispose();
    _zip.dispose();
    super.dispose();
  }

  final textStyle = TextStyle(
      color: Colors.black, letterSpacing: 1, fontWeight: FontWeight.w500);

  void togglePassVisibility() {
    setState(() {
      _isPassVisible = !_isPassVisible;
    });
  }

  void toggleCPassVisibility() {
    setState(() {
      _isCPassVisible = !_isCPassVisible;
    });
  }

  void register(AuthProvider auth, BuildContext context) async {
    _formKey.currentState.validate();
    setState(() {
      btnDisabled = true;
      isLoading = true; 
      btnLoading = true; 
      autoValidate = true;
    });
    final Map<String, dynamic> user = {
        "firstname": _firstname.text.trim(),
        "lastname": _lastname.text.trim(),
        "username": _username.text.trim(),
        "email": _email.text.trim(),
        "genre": _genre.text.trim(),
        "phone": _phone.text.trim(),
        "password": _cpass.text.trim(),
        "role": role.toLowerCase(),
        "address": {
          'addr': _addr.text.trim(),
          'state': _state.text.trim(),
          'zip': _zip.text.trim(),
        },
    };
    print(user);
    var currentUser;
    try {
      currentUser = await auth.signUp(user);
    } catch (e) {
      print(e);
    } finally {
      if(currentUser != null && currentUser.toString().isNotEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        setState(() {
          btnDisabled = false;
          isLoading = false;
          btnLoading = false; 
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final AuthProvider auth = Provider.of<AuthProvider>(context);
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
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: AccountRoles(
                  onPress: (e) => {
                    role = e.title
                  },
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _firstname,
                style: textStyle,
                autofocus: false,
                autovalidate: autoValidate,
                validator: Validators.nameValidator,
                decoration: InputDecoration(
                    labelText: 'Firstname',
                    hintStyle: TextStyle(color: Colors.grey),
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _lastname,
                style: textStyle,
                autovalidate: autoValidate,
                validator: Validators.nameValidator,
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Lastname',
                  hintStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _username,
                style: textStyle,
                autovalidate: autoValidate,
                validator: Validators.nameValidator,
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                style: textStyle,
                autovalidate: autoValidate,
                validator: Validators.emailValidator,
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _cachedPassword,
                style: textStyle,
                autovalidate: autoValidate,
                validator: Validators.passwordValidator,
                autofocus: false,
                obscureText: !_isPassVisible,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  prefixIcon: IconButton(
                    icon: _isPassVisible
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () => togglePassVisibility(),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _cpass,
                style: textStyle,
                autovalidate: autoValidate,
                validator: (value) {
                  return Validators.confirmPasswordValidator(
                      value, _cachedPassword.text);
                },
                autofocus: false,
                obscureText: !_isCPassVisible,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  prefixIcon: IconButton(
                    icon: _isCPassVisible
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () => toggleCPassVisibility(),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: _phone,
                style: textStyle,
                autovalidate: autoValidate,
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _addr,
                style: textStyle,
                autofocus: false,
                autovalidate: autoValidate,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Address',
                  hintStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _state,
                style: textStyle,
                autofocus: false,
                autovalidate: autoValidate,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'State',
                  hintStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _zip,
                style: textStyle,
                autofocus: false,
                autovalidate: autoValidate,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Zip Code',
                  hintStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _genre,
                style: textStyle,
                autovalidate: autoValidate,
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Music Genre',
                  hintStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonWidget(
                text: 'Sign Up',
                isLoading: btnLoading,
                disabled: btnDisabled,
                color: ButtonStyles.PRIMARY,
                mode: ButtonStyles.FLAT,
                onPressed: () {
                  register(auth, context);
                },
              )
            ],
          ),
        ),
      );
    }
  }
}
