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
*          File Name        > <!#FN> resultado.view.dart </#FN>                                                        
*          File Birth       > <!#FB> 2020/07/30 16:01:34.521 </#FB>                                                    *
*          File Mod         > <!#FT> 2020/07/30 17:26:17.781 </#FT>                                                    *
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

import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

ConsultaController controller = new ConsultaController();

class Resultado extends StatelessWidget {
  Resultado({Key key, this.protocolo}) : super(key: key);
  final Protocolo protocolo;

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
      //drawer: MenuLateral(),
      body: pesquisar(),
    );
  }

  Widget pesquisar() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    "CPF ${protocolo.cpf}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${protocolo.protocolo}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 8,
            child: FutureBuilder(
                future: controller.consulta(protocolo.cpf, protocolo.protocolo),
                builder: (ctx, snap) {
                  switch (snap.connectionState) {
                    case ConnectionState.waiting:
                      return Center(child: LinearProgressIndicator());
                      break;
                    default:
                      if (snap.data != "") {
                        return Container(
                            child: new HtmlView(
                          data: snap.data,

                          scrollable:
                              true, //false to use MarksownBody and true to use Marksown
                        ));
                      } else {
                        return Container(
                            child: Text("ALGUMA COISA DEU ERRADO"));
                      }
                  }
                }),
          ),
        ],
      ),
    );
  }
}
