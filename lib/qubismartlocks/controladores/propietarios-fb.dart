/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Propietarios -> Propietario
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class PropietariosFB {

  static fb.DatabaseReference drPropietarios = DEM.db.ref( PROPIETARIOS.ENTIDAD );

  static Future guardarPropietario({Propietario propietario}) async {

    if (propietario.key == '') {
      propietario.key = drPropietarios.push().key;
    }
    await drPropietarios.child(propietario.key).update(propietario.toJson());
  }

  static Future borrarPropietario({Propietario propietario}) async {
    await drPropietarios.child(propietario.key).remove();
  }

  static init() async {
    await drPropietarios.remove();
    await InicializarPropietarios.init();
  }

  static todos(List<Propietario> lista) async {
    // Lista de Propietarios
    lista.clear();
    drPropietarios.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = Propietario();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
