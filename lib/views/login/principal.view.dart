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
*          File Name        > <!#FN> principal.view.dart </#FN>                                                        
*          File Birth       > <!#FB> 2020/07/24 17:21:24.749 </#FB>                                                    *
*          File Mod         > <!#FT> 2020/07/24 18:09:19.881 </#FT>                                                    *
*          License          > <!#LT> BSD-3-Clause-Attribution </#LT>                                                   
*                             <!#LU> https://spdx.org/licenses/BSD-3-Clause-Attribution.html </#LU>                    
*                             <!#LD> This file may not be redistributed in whole or significant part. </#LD>           
*          File Version     > <!#FV> 0.0.0 </#FV>                                                                      
*                                                                                                                      *
******************************************* VSCode Extension: Version Boss *********************************************
</#CR>
*/

import 'package:abiatcpf/util/shared.dart';
import 'package:abiatcpf/views/consulta.dart';
import 'package:abiatcpf/views/home/dashboard.view.dart';
import 'package:abiatcpf/views/login/cadastrar.view.dart';
import 'package:abiatcpf/views/login/login.view.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    testar(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.0),
          child: AppBar(
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.lock),
              )
            ],
            //title: Center(child: Text("C A C")),
            backgroundColor: Colors.black,

            flexibleSpace: Image.asset(
              'assets/CAC.png',
              height: 400,
            ),

            bottom: TabBar(
              tabs: <Widget>[
                Text("LOGIN"),
                Text("CADASTRAR"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[new Login(), new Cadastrar()],
        ),
      ),
    );
  }

  void testar(BuildContext context) async {
    Shared shared = new Shared();
    var user = await shared.usuarioId();
    print("user $user");
    OneSignal.shared.setExternalUserId(user.toString());
    if (await shared.usuarioId() != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }
}
