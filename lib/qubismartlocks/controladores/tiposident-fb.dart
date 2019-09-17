/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad TiposIdent -> Tipo de Identificación
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class TiposIdentFB {

  static fb.DatabaseReference drTiposIdent = DEM.db.ref( TIPOSIDENT.ENTIDAD );

  static Future guardarTipoIdent({TipoIdent tipoIdent}) async {

    if (tipoIdent.key == '') {
      tipoIdent.key = drTiposIdent.push().key;
    }
    await drTiposIdent.child(tipoIdent.key).update(tipoIdent.toJson());
  }

  static Future borrarTipoIdent({TipoIdent tipoIdent}) async {
    await drTiposIdent.child(tipoIdent.key).remove();
  }

  static init() async {
    await drTiposIdent.remove();
    await InicializarTiposIdent.init();
  }

  static todos(List<TipoIdent> lista) async {
    // Lista de Tipos de Identificación
    lista.clear();
    drTiposIdent.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = TipoIdent();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
