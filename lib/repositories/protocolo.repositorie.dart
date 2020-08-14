import 'dart:convert';

import 'package:abiatcpf/models/protocolo.model.dart';
import 'package:abiatcpf/util/shared.dart';
import 'package:http/http.dart' as http;
import '../configs.dart';

class ProtocoloRepositorie {
  Shared shared = new Shared();

  Future<void> cadastrar(Protocolo protocolo) async {
    var usuarioId = await shared.usuarioId();
    var url =
        "$urlBase/salvarProtocolo?cpf=${protocolo.cpf}&protocolo=${protocolo.protocolo}&rm=${protocolo.rm}&usuario_id=$usuarioId";
    print("url: $url");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      Protocolo protocolo = Protocolo.fromJson(json.decode(response.body));
      print("protocolo: ${protocolo.toString()}");
      // return protocolo;
    }
  }

  Future<List<Protocolo>> lista() async {
    var usuarioId = await shared.usuarioId();
    var url = "$urlBase/pegarProtocolos?user_id=$usuarioId";
    print(url);

    final response = await http.get(url);
    var lista = <Protocolo>[];

    if (response.statusCode == 200) {
      final prots = jsonDecode(response.body);
      for (Map protocolo in prots) {
        lista.add(new Protocolo.fromJson(protocolo));
        // print(protocolo.toString());
      }
      print(lista.toString());
      return lista;
    }
  }

  Future<void> apagarProtocolo(Protocolo protocolo) async {
    var url = "$urlBase/apagarProtocolo?id=${protocolo.id}";
    print(url);

    final response = await http.get(url);
    
  }
}
