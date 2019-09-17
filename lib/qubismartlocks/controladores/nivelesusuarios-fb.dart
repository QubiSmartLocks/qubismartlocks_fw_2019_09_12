/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad NivelesUsuarios -> Nivel de Usuario
   [Qubi Smart Locks/Seguridad]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class NivelesUsuariosFB {

  static fb.DatabaseReference drNivelesUsuarios = DEM.db.ref( NIVELESUSUARIOS.ENTIDAD );

  static Future guardarNivelUsuario({NivelUsuario nivelUsuario}) async {

    if (nivelUsuario.key == '') {
      nivelUsuario.key = drNivelesUsuarios.push().key;
    }
    await drNivelesUsuarios.child(nivelUsuario.key).update(nivelUsuario.toJson());
  }

  static Future borrarNivelUsuario({NivelUsuario nivelUsuario}) async {
    await drNivelesUsuarios.child(nivelUsuario.key).remove();
  }

  static init() async {
    await drNivelesUsuarios.remove();
    await InicializarNivelesUsuarios.init();
  }

  static todos(List<NivelUsuario> lista) async {
    // Lista de Niveles de Usuarios
    lista.clear();
    drNivelesUsuarios.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = NivelUsuario();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
