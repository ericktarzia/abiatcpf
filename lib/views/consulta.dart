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
*          File Mod         > <!#FT> 2020/07/21 18:44:18.809 </#FT>                                                    *
*          License          > <!#LT> BSD-3-Clause-Attribution </#LT>                                                   
*                             <!#LU> https://spdx.org/licenses/BSD-3-Clause-Attribution.html </#LU>                    
*                             <!#LD> This file may not be redistributed in whole or significant part. </#LD>           
*          File Version     > <!#FV> 0.0.0 </#FV>                                                                      
*                                                                                                                      *
******************************************* VSCode Extension: Version Boss *********************************************
</#CR>
*/

import 'package:abiatcpf/controllers/consulta.controller.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class Consulta extends StatefulWidget {
  @override
  _ConsultaState createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String cpf;
  String protocolo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("CAC")),
        ),
        body: SafeArea(
          top: false,
          bottom: false,
          child: form_login(),
        ),
        bottomSheet: Container(
          child: Text(
            'Fornecido gratuitamente por Mário Vigianni',
            style: new TextStyle(
              fontSize: 10,
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
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/logo.png')),
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'CPF ou CNPJ',
                  labelText: 'CPF ou CNPJ (apenas números)',
                ),
                onSaved: (val) => cpf = val,
                keyboardType: TextInputType.number,
              ),
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  hintText: 'Protocolo',
                  labelText: 'Protocolo (apenas números)',
                ),
                keyboardType: TextInputType.number,
                onSaved: (val) => protocolo = val,
              ),
              new Container(
                padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                child: new RaisedButton(
                  child: const Text('Enviar'),
                  onPressed: _submitForm,
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
    resultado();
  }

  Future<AwesomeDialog> resultado() async {
    var controller = new ConsultaController();
    var resultado = await controller.consulta(cpf, protocolo);

    return AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Status Atual',
      desc: (resultado.length > 1)
          ? resultado
          : 'Algo deu errado!\nConfira se digitou corretamente os dados!',
    )..show();
  }
}
