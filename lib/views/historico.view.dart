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
*          File Name        > <!#FN> historico.view.dart </#FN>                                                        
*          File Birth       > <!#FB> 2020/07/29 17:30:25.655 </#FB>                                                    *
*          File Mod         > <!#FT> 2020/07/29 18:03:57.425 </#FT>                                                    *
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
import 'package:abiatcpf/repositories/protocolo.repositorie.dart';
import 'package:abiatcpf/views/home/resultado.view.dart';
import 'package:abiatcpf/views/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ProtocoloRepositorie repo = new ProtocoloRepositorie();
ConsultaController cc = new ConsultaController();
BuildContext ctx;

class Historico extends StatefulWidget {
  @override
  _HistoricoState createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  @override
  Widget build(BuildContext context) {
    ctx = context;
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
      body: Conteudo(),
    );
  }
}

class Conteudo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
            flex: 1,
            child: Center(
              child: Text(
                'deslize algum item para remover',
                style: TextStyle(color: Colors.grey),
              ),
            )),
        Flexible(
          flex: 9,
          child: FutureBuilder(
              future: repo.lista(),
              builder: (context, snap) {
                switch (snap.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                    break;
                  default:
                    return Container(
                      child: ListView.builder(
                          itemCount: snap.data.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            Protocolo protocolo = snap.data[index];
                            return item(protocolo);
                          }),
                    );
                }
              }),
        ),
      ],
    );
  }

  Widget item(Protocolo protocolo) {
    return Dismissible(
      key: Key(protocolo.protocolo),
      onDismissed: (direction) async {
        repo.apagarProtocolo(protocolo);
      },
      child: Card(
        child: ListTile(
            title: Text('CPF ${protocolo.cpf}'),
            subtitle: Text(protocolo.protocolo + " RM: ${protocolo.rm}ª"),
            trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                onPressed: () => Get.to(Resultado(
                      protocolo: protocolo,
                    )))),
      ),
    );
  }

  Future<void> resultado(Protocolo protocolo, BuildContext context) async {
    var controller = new ConsultaController();

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
                      protocolo.protocolo,
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  )
                ],
              ),
              children: <Widget>[
                new Container(
                  child: FutureBuilder(
                      future: controller.consulta(protocolo),
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
                                  child: Text((item.data != "")
                                      ? item.data
                                      : "Alguma coisa deu errado!")),
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
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
