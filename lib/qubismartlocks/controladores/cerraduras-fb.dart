/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Cerraduras -> Cerradura
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class CerradurasFB {

  static fb.DatabaseReference drCerraduras = DEM.db.ref( CERRADURAS.ENTIDAD );

  static Future guardarCerradura({Cerradura cerradura}) async {

    if (cerradura.key == '') {
      cerradura.key = drCerraduras.push().key;
    }
    await drCerraduras.child(cerradura.key).update(cerradura.toJson());
  }

  static Future borrarCerradura({Cerradura cerradura}) async {
    await drCerraduras.child(cerradura.key).remove();
  }

  static init() async {
    await drCerraduras.remove();
    await InicializarCerraduras.init();
  }

  static todos(List<Cerradura> lista) async {
    // Lista de Cerraduras
    lista.clear();
    drCerraduras.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = Cerradura();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
