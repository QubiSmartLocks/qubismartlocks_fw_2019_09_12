/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad LogsCerraduras -> Log de Cerradura
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class LogsCerradurasFB {

  static fb.DatabaseReference drLogsCerraduras = DEM.db.ref( LOGSCERRADURAS.ENTIDAD );

  static Future guardarLogCerradura({LogCerradura logCerradura}) async {

    if (logCerradura.key == '') {
      logCerradura.key = drLogsCerraduras.push().key;
    }
    await drLogsCerraduras.child(logCerradura.key).update(logCerradura.toJson());
  }

  static Future borrarLogCerradura({LogCerradura logCerradura}) async {
    await drLogsCerraduras.child(logCerradura.key).remove();
  }

  static init() async {
    await drLogsCerraduras.remove();
    await InicializarLogsCerraduras.init();
  }

  static todos(List<LogCerradura> lista) async {
    // Lista de Logs de Cerraduras
    lista.clear();
    drLogsCerraduras.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = LogCerradura();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
