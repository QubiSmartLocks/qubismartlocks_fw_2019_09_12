/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad HistoricosCerraduras -> Histórico de Cerradura
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class HistoricosCerradurasFB {

  static fb.DatabaseReference drHistoricosCerraduras = DEM.db.ref( HISTORICOSCERRADURAS.ENTIDAD );

  static Future guardarHistoricoCerradura({HistoricoCerradura historicoCerradura}) async {

    if (historicoCerradura.key == '') {
      historicoCerradura.key = drHistoricosCerraduras.push().key;
    }
    await drHistoricosCerraduras.child(historicoCerradura.key).update(historicoCerradura.toJson());
  }

  static Future borrarHistoricoCerradura({HistoricoCerradura historicoCerradura}) async {
    await drHistoricosCerraduras.child(historicoCerradura.key).remove();
  }

  static init() async {
    await drHistoricosCerraduras.remove();
    await InicializarHistoricosCerraduras.init();
  }

  static todos(List<HistoricoCerradura> lista) async {
    // Lista de Históricos de Cerraduras
    lista.clear();
    drHistoricosCerraduras.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = HistoricoCerradura();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
