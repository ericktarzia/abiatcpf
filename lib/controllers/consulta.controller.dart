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
*          File Name        > <!#FN> consulta.controller.dart </#FN>                                                   
*          File Birth       > <!#FB> 2020/07/20 18:51:57.150 </#FB>                                                    *
*          File Mod         > <!#FT> 2020/07/21 18:42:41.813 </#FT>                                                    *
*          License          > <!#LT> BSD-3-Clause-Attribution </#LT>                                                   
*                             <!#LU> https://spdx.org/licenses/BSD-3-Clause-Attribution.html </#LU>                    
*                             <!#LD> This file may not be redistributed in whole or significant part. </#LD>           
*          File Version     > <!#FV> 0.0.0 </#FV>                                                                      
*                                                                                                                      *
******************************************* VSCode Extension: Version Boss *********************************************
</#CR>
*/

import 'package:abiatcpf/models/protocolo.model.dart';
import 'package:abiatcpf/repositories/protocolo.repositorie.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class ConsultaController {
  Future<String> consulta(Protocolo protocolo) async {
    var url;
    var response;
    var document;
    var res;
    if (protocolo.rm == '2') {
      url = 'http://protocolosfpc.2rm.eb.mil.br/consulta_processo.php';
      response = await http.post(url, body: {
        'txt_cpf_cnpj': '${protocolo.cpf}',
        'txt_protocolo': '${protocolo.protocolo}'
      });
      document = parse(response.body);
      //res = document.getElementsByClassName('container');
      res = document.querySelectorAll('div');
    }

    if (protocolo.rm == '11') {
      url =
          //'http://www.11rm.eb.mil.br/sgp/processo.php?id=${protocolo.protocolo}&idt=${protocolo.cpf}';
           'http://www.11rm.eb.mil.br/sgp/ReciboSgpInteressado.php?inc=1&id=${protocolo.protocolo}&idt=${protocolo.cpf}';
      response = await http.get(url);
      document =  parse(response.body);
      
      res = document.querySelectorAll('div');
      //res = document.getBody();
     // print("URL: $url");
    }

   
    //print('Response status: ${response.body}');

    /**
     * salvar o protocolo
     */
    ProtocoloRepositorie pr = new ProtocoloRepositorie();
    pr.cadastrar(protocolo);

    //if(protocolo.rm == '11'){
      print("DOCUMENT" + document.toString());
    //  return document.BodyElement();
    
    return (res[0].innerHtml);
    //return  response.body;
  }
}
