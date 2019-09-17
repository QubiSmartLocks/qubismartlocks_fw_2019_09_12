/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Pasajeros -> Pasajero
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class PasajerosFB {

  static fb.DatabaseReference drPasajeros = DEM.db.ref( PASAJEROS.ENTIDAD );

  static Future guardarPasajero({Pasajero pasajero}) async {

    if (pasajero.key == '') {
      pasajero.key = drPasajeros.push().key;
    }
    await drPasajeros.child(pasajero.key).update(pasajero.toJson());
  }

  static Future borrarPasajero({Pasajero pasajero}) async {
    await drPasajeros.child(pasajero.key).remove();
  }

  static init() async {
    await drPasajeros.remove();
    await InicializarPasajeros.init();
  }

  static todos(List<Pasajero> lista) async {
    // Lista de Pasajeros
    lista.clear();
    drPasajeros.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = Pasajero();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
