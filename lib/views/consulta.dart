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
*          File Name        > <!#FN> consulta.dart </#FN>                                                              
*          File Birth       > <!#FB> 2020/07/21 18:21:17.987 </#FB>                                                    *
*          File Mod         > <!#FT> 2020/07/24 18:09:38.569 </#FT>                                                    *
*          License          > <!#LT> BSD-3-Clause-Attribution </#LT>                                                   
*                             <!#LU> https://spdx.org/licenses/BSD-3-Clause-Attribution.html </#LU>                    
*                             <!#LD> This file may not be redistributed in whole or significant part. </#LD>           
*          File Version     > <!#FV> 0.0.0 </#FV>                                                                      
*                                                                                                                      *
******************************************* VSCode Extension: Version Boss *********************************************
</#CR>
*/

import 'package:abiatcpf/controllers/consulta.controller.dart';
import 'package:abiatcpf/models/protocolo.model.dart';
import 'package:abiatcpf/views/home/resultado.view.dart';
import 'package:abiatcpf/views/menu/menu.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Consulta extends StatefulWidget {
  @override
  _ConsultaState createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String cpf;
  String protocolo;

  bool _isButtonDisabled;

  @override
  void initState() {
    _isButtonDisabled = false;
  }

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
        body: SafeArea(
          top: false,
          bottom: false,
          child: form_login(),
        ),
        bottomSheet: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Fornecido gratuitamente por Mário Vigianni',
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget form_login() {
    //top: false,
    //  bottom: false,
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Container(
                      child: Text(
                    "CONSULTA A PROTOCOLOS DE PRODUTOS CONTROLADOS DA 2ª RM",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: Text(
                      "(apenas números)",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    )),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Form(
                key: _formKey,
                autovalidate: true,
                child: new ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: 'CPF ou CNPJ',
                          //labelText: 'CPF ou CNPJ',
                        ),
                        onSaved: (val) => cpf = val,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.calendar_today),
                          hintText: 'Protocolo',
                          // labelText: 'Protocolo',
                        ),
                        keyboardType: TextInputType.number,
                        onSaved: (val) => protocolo = val,
                      ),
                    ),
                    new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 50.0),
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
                                    "CONSULTAR",
                                    style: new TextStyle(
                                        color: Colors.white, fontSize: 25),
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
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;

    form.save();
    resultado();
  }

  Future<void> resultado() async {
    Protocolo protocolo = new Protocolo();
    protocolo.cpf = this.cpf;
    protocolo.protocolo = this.protocolo;

    Get.to(Resultado(
      protocolo: protocolo,
    ));

    /*
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SimpleDialog(
              titlePadding: EdgeInsets.all(5),
              title: Column(
                children: <Widget>[
                  Center(
                      child: Text(
                    'PROTOCOLO',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  )),
                  Center(
                    child: Text(
                      protocolo,
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  )
                ],
              ),
              children: <Widget>[
                new Container(
                  child: FutureBuilder(
                      future: controller.consulta(cpf, protocolo),
                      builder: (ctx, item) {
                        switch (item.connectionState) {
                          case ConnectionState.waiting:
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: CircularProgressIndicator()),
                            );
                            break;
                          default:
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                      (item.data != "")
                                          ? item.data
                                          : "Alguma coisa deu errado!",
                                      style: estilo(item.data))),
                            );
                        }
                      }),
                ),
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
              ],
            ),
          );
        });*/
  }

  TextStyle estilo(String texto) {
    var cor;

    switch (texto) {
      case "FINALIZADO":
        cor = Colors.green;
        break;
      case "PROCESSADO":
        cor = Colors.orange;
        break;
      default:
        cor = Colors.red;
    }

    return new TextStyle(color: cor, fontWeight: FontWeight.bold, fontSize: 20);
  }
}
