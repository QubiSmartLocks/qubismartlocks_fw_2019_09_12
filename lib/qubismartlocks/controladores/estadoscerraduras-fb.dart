/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad EstadosCerraduras -> Estado de Cerradura
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class EstadosCerradurasFB {

  static fb.DatabaseReference drEstadosCerraduras = DEM.db.ref( ESTADOSCERRADURAS.ENTIDAD );

  static Future guardarEstadoCerradura({EstadoCerradura estadoCerradura}) async {

    if (estadoCerradura.key == '') {
      estadoCerradura.key = drEstadosCerraduras.push().key;
    }
    await drEstadosCerraduras.child(estadoCerradura.key).update(estadoCerradura.toJson());
  }

  static Future borrarEstadoCerradura({EstadoCerradura estadoCerradura}) async {
    await drEstadosCerraduras.child(estadoCerradura.key).remove();
  }

  static init() async {
    await drEstadosCerraduras.remove();
    await InicializarEstadosCerraduras.init();
  }

  static todos(List<EstadoCerradura> lista) async {
    // Lista de Estados de Cerraduras
    lista.clear();
    drEstadosCerraduras.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = EstadoCerradura();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
