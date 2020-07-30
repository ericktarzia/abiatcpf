import 'package:abiatcpf/models/usuario.model.dart';
import 'package:abiatcpf/repositories/usuario.repositorie.dart';
import 'package:abiatcpf/views/historico.view.dart';
import 'package:abiatcpf/views/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard.view.dart';

UsuarioRepositorie _repositorie = new UsuarioRepositorie();

class MinhaConta extends StatefulWidget {
  @override
  _MinhaContaState createState() => _MinhaContaState();
}

class _MinhaContaState extends State<MinhaConta> {
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: AppBar(
          backgroundColor: Colors.black,
          flexibleSpace: Image.asset(
            'assets/CAC.png',
            height: 400,
          ),
        ),
      ),
      drawer: MenuLateral(),
      body: FutureBuilder(
        future: _repositorie.usuario(),
        builder: (ctx, snap) {
          switch (snap.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              break;
            default:
              if (snap.hasData) {
                return formulario(snap.data);
              } else {
                return Center(
                  child: Text('Algo deu errado!'),
                );
              }
          }
        },
      ),
    );
  }

  Widget formulario(Usuario usuario) {
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
                initialValue: usuario.nome,
              ),
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.email),
                  hintText: 'Email',
                  labelText: 'email',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (val) => email = val,
                initialValue: usuario.email,
              ),
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.phone),
                  hintText: 'Telefone',
                  labelText: 'Telefone',
                ),
                keyboardType: TextInputType.phone,
                onSaved: (val) => telefone = val,
                initialValue: usuario.telefone,
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        icon: const Icon(Icons.location_city),
                        hintText: 'Estado',
                        labelText: 'Estado',
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
                  hintText: 'Deixe em branco para não alterar',
                  labelText: 'Senha (Deixe em branco para não alterar)',
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
                              "ATUALIZAR",
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

    Usuario user = await repo.atualizar(nome, senha, email, estado, telefone);

    (user != null)
        ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          )
        : Get.snackbar("Algo deu Errado", "Tente mais Tarde");
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
