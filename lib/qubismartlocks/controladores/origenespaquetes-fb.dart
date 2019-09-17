/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad OrigenesPaquetes -> Orígen de Paquete
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class OrigenesPaquetesFB {

  static fb.DatabaseReference drOrigenesPaquetes = DEM.db.ref( ORIGENESPAQUETES.ENTIDAD );

  static Future guardarOrigenPaquete({OrigenPaquete origenPaquete}) async {

    if (origenPaquete.key == '') {
      origenPaquete.key = drOrigenesPaquetes.push().key;
    }
    await drOrigenesPaquetes.child(origenPaquete.key).update(origenPaquete.toJson());
  }

  static Future borrarOrigenPaquete({OrigenPaquete origenPaquete}) async {
    await drOrigenesPaquetes.child(origenPaquete.key).remove();
  }

  static init() async {
    await drOrigenesPaquetes.remove();
    await InicializarOrigenesPaquetes.init();
  }

  static todos(List<OrigenPaquete> lista) async {
    // Lista de Orígenes de Paquetes
    lista.clear();
    drOrigenesPaquetes.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = OrigenPaquete();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
