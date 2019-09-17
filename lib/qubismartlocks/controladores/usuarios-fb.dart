/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Usuarios -> Usuario
   [Qubi Smart Locks/Seguridad]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class UsuariosFB {

  static fb.DatabaseReference drUsuarios = DEM.db.ref( USUARIOS.ENTIDAD );

  static Future guardarUsuario({Usuario usuario}) async {

    if (usuario.key == '') {
      usuario.key = drUsuarios.push().key;
    }
    await drUsuarios.child(usuario.key).update(usuario.toJson());
  }

  static Future borrarUsuario({Usuario usuario}) async {
    await drUsuarios.child(usuario.key).remove();
  }

  static init() async {
    await drUsuarios.remove();
    await InicializarUsuarios.init();
  }

  static todos(List<Usuario> lista) async {
    // Lista de Usuarios
    lista.clear();
    drUsuarios.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = Usuario();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
