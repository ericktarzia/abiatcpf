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

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class ConsultaController {
  final String url = 'http://protocolosfpc.2rm.eb.mil.br/consulta_processo.php';

  Future<String> consulta(String cpf, String protocolo) async {
    var response = await http.post(url,
        body: {'txt_cpf_cnpj': '$cpf', 'txt_protocolo': '$protocolo'});
    print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    //var document = parse.HtmlParser(response.body);

    var document = parse(response.body);
    var res = document.getElementsByClassName('badge-pill');

    return (res[0].innerHtml);
  }
}
