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
*          File Name        > <!#FN> menu.dart </#FN>                                                                  
*          File Birth       > <!#FB> 2020/07/29 17:07:04.747 </#FB>                                                    *
*          File Mod         > <!#FT> 2020/07/31 11:05:10.680 </#FT>                                                    *
*          License          > <!#LT> BSD-3-Clause-Attribution </#LT>                                                   
*                             <!#LU> https://spdx.org/licenses/BSD-3-Clause-Attribution.html </#LU>                    
*                             <!#LD> This file may not be redistributed in whole or significant part. </#LD>           
*          File Version     > <!#FV> 0.0.0 </#FV>                                                                      
*                                                                                                                      *
******************************************* VSCode Extension: Version Boss *********************************************
</#CR>
*/


import 'package:abiatcpf/views/consulta.dart';
import 'package:abiatcpf/views/historico.view.dart';
import 'package:abiatcpf/views/home/dashboard.view.dart';
import 'package:abiatcpf/views/home/minhaconta.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:package_info/package_info.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: <Widget>[
      DrawerHeader(
        child: Center(child: Text('CAC')),
        decoration: BoxDecoration(
          color: Colors.black38,
        ),
      ),
      Expanded(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.home),
              title: Text("INÍCIO"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("CONSULTAR"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Consulta()));
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("HISTÓRICO"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Historico()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text("MINHA CONTA"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MinhaConta()));
              },
            ),
            /*
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text("SUPORTE"),
              onTap: () async {
                 
                await FlutterOpenWhatsapp.sendSingleMessage("5511940074794", "Suporte CAC");
              },
            ),
            */
            
            /*
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("SAIR"),
              onTap: () {
                logout();
              },
            ),
            */
          ],
        ),
      ),
      Container(
        color: Colors.black,
        width: double.infinity,
        height: 0.1,
      ),
      FutureBuilder(
        future: versao(),
        builder: (context, item) {
          switch (item.connectionState) {
            case ConnectionState.waiting:
              return LinearProgressIndicator();
              break;
            default:
              return item.data;
          }
        },
      )
    ]));
  }

  Future<Widget> versao() async {
    String name;
    String version;
    String build;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    name = packageInfo.appName;
    String packageName = packageInfo.packageName;
    version = packageInfo.version;
    build = packageInfo.buildNumber;

    return Center(
      child: Text("$name : v:$version+$build"),
    );
  }
}
