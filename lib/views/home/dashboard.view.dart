import 'package:abiatcpf/views/historico.view.dart';
import 'package:abiatcpf/views/home/minhaconta.view.dart';
import 'package:abiatcpf/views/menu/menu.dart';
import 'package:flutter/material.dart';
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
            'Fornecido gratuitamente por Mário Vigianni',
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
          crossAxisCount: 2,
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
            InkWell(
              onTap: (){
                Get.snackbar("EM BREVE", "Em Construção");
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
            ),
          ],
        ),
      ),
    );
  }
}
