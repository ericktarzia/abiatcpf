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
*          File Name        > <!#FN> cadastrar.view.dart </#FN>                                                        
*          File Birth       > <!#FB> 2020/07/24 13:18:04.031 </#FB>                                                    *
*          File Mod         > <!#FT> 2020/07/24 18:09:06.431 </#FT>                                                    *
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
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class Cadastrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormCadastro(),
    );
  }
}

class FormCadastro extends StatefulWidget {
  @override
  _FormCadastroState createState() => _FormCadastroState();
}

class _FormCadastroState extends State<FormCadastro> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  var nome;
  var email;
  var telefone;
  var estado;
  var senha;

  bool _isButtonDisabled;

  @override
  void initState() {
    _isButtonDisabled = false;
  }

  var _currencies = [
    "AC",
    "AL",
    "AP",
    "AM",
    "BA",
    "CE",
    "ES",
    "GO",
    "MA",
    "MT",
    "MS",
    "MG",
    "PA",
    "PB",
    "PR",
    "PE",
    "PI",
    "RJ",
    "RN",
    "RS",
    "RO",
    "RR",
    "SC",
    "SP",
    "SE",
    "TO",
    "DF"
  ];

  var _currentSelectedValue;

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
                  icon: const Icon(Icons.person),
                  hintText: 'Nome',
                  labelText: 'Nome',
                ),
                onSaved: (val) => nome = val,
                keyboardType: TextInputType.text,
              ),
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
                decoration: const InputDecoration(
                  icon: const Icon(Icons.phone),
                  hintText: 'Telefone',
                  labelText: 'Telefone',
                ),
                keyboardType: TextInputType.phone,
                onSaved: (val) => telefone = val,
              ),
              /*
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.location_city),
                  hintText: 'Estado',
                  labelText: 'estado',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (val) => estado = val,
              ),
*/
              /**
               * 
               */

              Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        icon: const Icon(Icons.location_city),
                        hintText: 'Estado',
                        labelText: 'Estado',
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(5.0),
                        // ),
                      ),
                      isEmpty: _currentSelectedValue == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _currentSelectedValue,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              _currentSelectedValue = newValue;
                              state.didChange(newValue);

                              estado = newValue;
                            });
                          },
                          items: _currencies.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),

              /**
               * 
               */

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
                              "CADASTRAR",
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

  void _submitForm() {
    final FormState form = _formKey.currentState;

    form.save();
    (nome != '' &&
            email != '' &&
            telefone != '' &&
            senha != '' &&
            estado != '' &&
            estado != null)
        ? salvar()
        : showErro();
  }

  Future<void> salvar() async {
    var repo = new UsuarioRepositorie();
    setState(() {
      _isButtonDisabled = true;
    });

    Usuario user = await repo.cadastrar(nome, email, estado, senha, telefone);

    if (user != null) {
      OneSignal.shared.setExternalUserId(user.toString());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } else {
      Get.snackbar("Algo deu Errado", "Talvez este email já esteja cadastrado!",snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.amber);
      setState(() {
        _isButtonDisabled = false;
      });
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
                Center(child: Text("Todos os campos são obrigatórios!"))
              ],
            ),
          );
        });
  }
}
