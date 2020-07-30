import 'package:abiatcpf/views/consulta.dart';
import 'package:abiatcpf/views/historico.view.dart';
import 'package:abiatcpf/views/home/dashboard.view.dart';
import 'package:abiatcpf/views/home/minhaconta.view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
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
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text("SUPORTE"),
              onTap: () {
                Get.snackbar("EM BREVE", "Em Construção");
              },
            ),
            
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
