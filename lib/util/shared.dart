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
*          File Name        > <!#FN> shared.dart </#FN>                                                                
*          File Birth       > <!#FB> 2020/07/29 15:35:20.618 </#FB>                                                    *
*          File Mod         > <!#FT> 2020/07/29 15:35:33.561 </#FT>                                                    *
*          License          > <!#LT> BSD-3-Clause-Attribution </#LT>                                                   
*                             <!#LU> https://spdx.org/licenses/BSD-3-Clause-Attribution.html </#LU>                    
*                             <!#LD> This file may not be redistributed in whole or significant part. </#LD>           
*          File Version     > <!#FV> 0.0.0 </#FV>                                                                      
*                                                                                                                      *
******************************************* VSCode Extension: Version Boss *********************************************
</#CR>
*/

import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  SharedPreferences prefs;

  Future<void> salvarUsuario(var usuarioId) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setInt("usuarioId", usuarioId);
  }

  Future<int> usuarioId() async{
     prefs = await SharedPreferences.getInstance();
     var usuarioId = prefs.getInt("usuarioId");
     return usuarioId; 
  }
}
