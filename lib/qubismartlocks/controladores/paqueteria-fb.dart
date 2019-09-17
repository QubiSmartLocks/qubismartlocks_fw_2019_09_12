/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Paqueteria -> Paquete
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class PaqueteriaFB {

  static fb.DatabaseReference drPaqueteria = DEM.db.ref( PAQUETERIA.ENTIDAD );

  static Future guardarPaquete({Paquete paquete}) async {

    if (paquete.key == '') {
      paquete.key = drPaqueteria.push().key;
    }
    await drPaqueteria.child(paquete.key).update(paquete.toJson());
  }

  static Future borrarPaquete({Paquete paquete}) async {
    await drPaqueteria.child(paquete.key).remove();
  }

  static init() async {
    await drPaqueteria.remove();
    await InicializarPaqueteria.init();
  }

  static todos(List<Paquete> lista) async {
    // Lista de Paquetería
    lista.clear();
    drPaqueteria.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = Paquete();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
