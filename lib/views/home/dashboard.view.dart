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
*          File Name        > <!#FN> dashboard.view.dart </#FN>                                                        
*          File Birth       > <!#FB> 2020/07/30 11:19:14.070 </#FB>                                                    *
*          File Mod         > <!#FT> 2020/07/31 11:01:17.270 </#FT>                                                    *
*          License          > <!#LT> BSD-3-Clause-Attribution </#LT>                                                   
*                             <!#LU> https://spdx.org/licenses/BSD-3-Clause-Attribution.html </#LU>                    
*                             <!#LD> This file may not be redistributed in whole or significant part. </#LD>           
*          File Version     > <!#FV> 0.0.0 </#FV>                                                                      
*                                                                                                                      *
******************************************* VSCode Extension: Version Boss *********************************************
</#CR>
*/


import 'package:abiatcpf/views/historico.view.dart';
import 'package:abiatcpf/views/home/minhaconta.view.dart';
import 'package:abiatcpf/views/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:get/get.dart';

import '../consulta.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
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
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Este APP é fornecido gratuitamente pelo Dr. MARIO VIGGIANI NETO. Não substitui e não dispensa a consulta aos sites oficiais das SFPC\'s do Exército.',
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 10,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          shrinkWrap: false,
          crossAxisCount: 3,
          children: <Widget>[
            InkWell(
              onTap: () {
                Get.to(Historico());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          'assets/icones/cadastrar.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    )),
                    Center(
                      child: Text("HISTÓRICO"),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(Consulta());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          'assets/icones/consultar.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    )),
                    Center(
                      child: Text("CONSULTAR"),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(MinhaConta());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          'assets/icones/minhaconta.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    )),
                    Center(
                      child: Text("MINHA CONTA"),
                    ),
                  ],
                ),
              ),
            ),
            /*
            InkWell(
              onTap: () async {
               await FlutterOpenWhatsapp.sendSingleMessage("5511940074794", "Suporte CAC");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          'assets/icones/suporte.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    )),
                    Center(
                      child: Text("SUPORTE"),
                    ),
                  ],
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
