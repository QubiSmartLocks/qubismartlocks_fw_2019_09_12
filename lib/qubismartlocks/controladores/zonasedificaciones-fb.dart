/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad ZonasEdificaciones -> Zona en Edificación
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class ZonasEdificacionesFB {

  static fb.DatabaseReference drZonasEdificaciones = DEM.db.ref( ZONASEDIFICACIONES.ENTIDAD );

  static Future guardarZonaEdificacion({ZonaEdificacion zonaEdificacion}) async {

    if (zonaEdificacion.key == '') {
      zonaEdificacion.key = drZonasEdificaciones.push().key;
    }
    await drZonasEdificaciones.child(zonaEdificacion.key).update(zonaEdificacion.toJson());
  }

  static Future borrarZonaEdificacion({ZonaEdificacion zonaEdificacion}) async {
    await drZonasEdificaciones.child(zonaEdificacion.key).remove();
  }

  static init() async {
    await drZonasEdificaciones.remove();
    await InicializarZonasEdificaciones.init();
  }

  static todos(List<ZonaEdificacion> lista) async {
    // Lista de Zonas en Edificaciones
    lista.clear();
    drZonasEdificaciones.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = ZonaEdificacion();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
