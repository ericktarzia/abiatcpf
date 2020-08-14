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
*          File Name        > <!#FN> protocolo.model.dart </#FN>                                                       
*          File Birth       > <!#FB> 2020/07/29 15:11:33.279 </#FB>                                                    *
*          File Mod         > <!#FT> 2020/07/29 15:13:13.551 </#FT>                                                    *
*          License          > <!#LT> BSD-3-Clause-Attribution </#LT>                                                   
*                             <!#LU> https://spdx.org/licenses/BSD-3-Clause-Attribution.html </#LU>                    
*                             <!#LD> This file may not be redistributed in whole or significant part. </#LD>           
*          File Version     > <!#FV> 0.0.0 </#FV>                                                                      
*                                                                                                                      *
******************************************* VSCode Extension: Version Boss *********************************************
</#CR>
*/

class Protocolo {
  var id;
  var usuarioId;
  var cpf;
  var protocolo;
  var rm;

  Protocolo({
    this.id,
    this.usuarioId,
    this.cpf,
    this.protocolo,
    this.rm,
  });

  Protocolo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usuarioId = json['usuario_id'];
    cpf = json['cpf'];
    protocolo = json['protocolo'];
    rm = json['rm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['usuario_id'] = this.usuarioId;
    data['cpf'] = this.cpf;
    data['protocolo'] = this.protocolo;
    data['rm'] = this.rm;
    return data;
  }
}
