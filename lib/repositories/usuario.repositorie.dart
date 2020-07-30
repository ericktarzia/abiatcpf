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
*          File Name        > <!#FN> usuario.repositorie.dart </#FN>                                                   
*          File Birth       > <!#FB> 2020/07/24 13:05:15.060 </#FB>                                                    *
*          File Mod         > <!#FT> 2020/07/24 18:08:51.628 </#FT>                                                    *
*          License          > <!#LT> BSD-3-Clause-Attribution </#LT>                                                   
*                             <!#LU> https://spdx.org/licenses/BSD-3-Clause-Attribution.html </#LU>                    
*                             <!#LD> This file may not be redistributed in whole or significant part. </#LD>           
*          File Version     > <!#FV> 0.0.0 </#FV>                                                                      
*                                                                                                                      *
******************************************* VSCode Extension: Version Boss *********************************************
</#CR>
*/

import 'dart:convert';

import 'package:abiatcpf/models/usuario.model.dart';
import 'package:abiatcpf/configs.dart';
import 'package:abiatcpf/util/shared.dart';
import 'package:http/http.dart' as http;

Shared shared = new Shared();

class UsuarioRepositorie {
  Shared shared = new Shared();

  Future<Usuario> cadastrar(
      var nome, var email, var estado, var senha, var telefone) async {
    var url =
        "$urlBase/salvarUsuario?nome=$nome&email=$email&estado=$estado&senha=$senha&telefone=$telefone";

    final response = await http.get(url);

    if (response.statusCode == 200) {
      Usuario usuario = Usuario.fromJson(json.decode(response.body));

      await shared.salvarUsuario(usuario.id);

      return usuario;
    } else {
      return null;
    }
  }

  Future<Usuario> login(var email, var senha) async {
    var url = "$urlBase/login?email=$email&senha=$senha";

    final response = await http.get(url);

    if (response.statusCode == 200 && response.body != 'null') {
      Usuario usuario = Usuario.fromJson(json.decode(response.body));
      await shared.salvarUsuario(usuario.id);
      return usuario;
    } else {
      return null;
    }
  }

  Future<Usuario> usuario() async {
    var usuarioId = await shared.usuarioId();
    var url = "$urlBase/usuario?id=$usuarioId";

    final response = await http.get(url);

    if (response.statusCode == 200 && response.body != 'null') {
      Usuario usuario = Usuario.fromJson(json.decode(response.body));

      return usuario;
    } else {
      return null;
    }
  }

  Future<Usuario> atualizar(
      var nome, var senha, var email, var estado, var telefone) async {
        var usuarioId = await shared.usuarioId();
    var url =
        "$urlBase/atualizarUsuario?nome=$nome&email=$email&estado=$estado&telefone=$telefone&id=$usuarioId&senha=$senha";
        print(url);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      Usuario usuario = Usuario.fromJson(json.decode(response.body));

      return usuario;
    } else {
      return null;
    }
  }
}
