/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Edificaciones -> Edificación
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class EdificacionesFB {

  static fb.DatabaseReference drEdificaciones = DEM.db.ref( EDIFICACIONES.ENTIDAD );

  static Future guardarEdificacion({Edificacion edificacion}) async {

    if (edificacion.key == '') {
      edificacion.key = drEdificaciones.push().key;
    }
    await drEdificaciones.child(edificacion.key).update(edificacion.toJson());
  }

  static Future borrarEdificacion({Edificacion edificacion}) async {
    await drEdificaciones.child(edificacion.key).remove();
  }

  static init() async {
    await drEdificaciones.remove();
    await InicializarEdificaciones.init();
  }

  static todos(List<Edificacion> lista) async {
    // Lista de Edificaciones
    lista.clear();
    drEdificaciones.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = Edificacion();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
