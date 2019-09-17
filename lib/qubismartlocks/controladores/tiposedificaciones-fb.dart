/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad TiposEdificaciones -> Tipo de Edificación
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class TiposEdificacionesFB {

  static fb.DatabaseReference drTiposEdificaciones = DEM.db.ref( TIPOSEDIFICACIONES.ENTIDAD );

  static Future guardarTipoEdificacion({TipoEdificacion tipoEdificacion}) async {

    if (tipoEdificacion.key == '') {
      tipoEdificacion.key = drTiposEdificaciones.push().key;
    }
    await drTiposEdificaciones.child(tipoEdificacion.key).update(tipoEdificacion.toJson());
  }

  static Future borrarTipoEdificacion({TipoEdificacion tipoEdificacion}) async {
    await drTiposEdificaciones.child(tipoEdificacion.key).remove();
  }

  static init() async {
    await drTiposEdificaciones.remove();
    await InicializarTiposEdificaciones.init();
  }

  static todos(List<TipoEdificacion> lista) async {
    // Lista de Tipos de Edificaciones
    lista.clear();
    drTiposEdificaciones.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = TipoEdificacion();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
