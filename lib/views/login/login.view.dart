/*
<!#CR>
************************************************************************************************************************
*                                                    Copyrigths ©                                                      *
* -------------------------------------------------------------------------------------------------------------------- *
*          Authors Names    > Erick Tarzia                                                                             *
*          Authors Email    > ericktarzia@gmail.com                                                                    *
*          Authors Websites > https://www.facebook.com/ericktarzia/                                                    *
*          Authors Socials  > https://www.facebook.com/ericktarzia/                                                    *
*          Company Email    > ericktarzia@gmail.com                                                                    *
*          Credits          > Pahe Bleasby                                                                             *
* -------------------------------------------------------------------------------------------------------------------- *
*                                           File and License Informations                                              *
* -------------------------------------------------------------------------------------------------------------------- *
*          File Name        > <!#FN> login.view.dart </#FN>                                                            
*          File Birth       > <!#FB> 2020/07/24 17:08:47.599 </#FB>                                                    *
*          File Mod         > <!#FT> 2020/07/24 18:09:14.763 </#FT>                                                    *
*          License          > <!#LT> BSD-3-Clause-Attribution </#LT>                                                   
*                             <!#LU> https://spdx.org/licenses/BSD-3-Clause-Attribution.html </#LU>                    
*                             <!#LD> This file may not be redistributed in whole or significant part. </#LD>           
*          File Version     > <!#FV> 0.0.0 </#FV>                                                                      
*                                                                                                                      *
******************************************* VSCode Extension: Version Boss *********************************************
</#CR>
*/

import 'package:abiatcpf/models/usuario.model.dart';
import 'package:abiatcpf/repositories/usuario.repositorie.dart';

import 'package:abiatcpf/views/home/dashboard.view.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: form_login(),
    );
  }
}

class form_login extends StatefulWidget {
  @override
  _form_loginState createState() => _form_loginState();
}

class _form_loginState extends State<form_login> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  var email;
  var senha;

  bool _isButtonDisabled;

  @override
  void initState() {
    _isButtonDisabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.email),
                  hintText: 'Email',
                  labelText: 'email',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (val) => email = val,
              ),
              new TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.remove_red_eye),
                  hintText: 'Senha',
                  labelText: 'Senha',
                ),
                keyboardType: TextInputType.visiblePassword,
                onSaved: (val) => senha = val,
              ),
              new Container(
                padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                child: new RaisedButton(
                  color: Colors.black,
                  child: Center(
                    child: _isButtonDisabled
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "LOGIN",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                  ),
                  onPressed: _isButtonDisabled ? null : _submitForm,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    final FormState form = _formKey.currentState;

    form.save();
    (email != '' && senha != '') ? login() : showErro();
  }

  Future<void> login() async {
    setState(() {
      _isButtonDisabled = true;
    });
    var repo = new UsuarioRepositorie();
    Usuario user = await repo.login(email, senha);
    if (user != null) {
      OneSignal.shared.setExternalUserId(user.toString());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } else {
      showErro();
    }
  }

  void showErro() {
    showDialog(
        // barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SimpleDialog(
              titlePadding: EdgeInsets.all(5),
              title: Center(
                  child: Text(
                'ERRO',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              )),
              children: <Widget>[
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.lightGreenAccent,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      //borderRadius: 5,
                      color: Colors.green,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new SimpleDialogOption(
                        child: new Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            _isButtonDisabled = false;
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
                Center(child: Text("Dados não encontrados!"))
              ],
            ),
          );
        });
  }
}
