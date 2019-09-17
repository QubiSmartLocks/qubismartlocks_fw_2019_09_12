/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad ModelosForaneos -> Modelo Foráneo
   [Qubi Smart Locks/Modelos de Campos]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class ModelosForaneosFB {

  static fb.DatabaseReference drModelosForaneos = DEM.db.ref( MODELOSFORANEOS.ENTIDAD );

  static Future guardarModeloForaneo({ModeloForaneo modeloForaneo}) async {

    if (modeloForaneo.key == '') {
      modeloForaneo.key = drModelosForaneos.push().key;
    }
    await drModelosForaneos.child(modeloForaneo.key).update(modeloForaneo.toJson());
  }

  static Future borrarModeloForaneo({ModeloForaneo modeloForaneo}) async {
    await drModelosForaneos.child(modeloForaneo.key).remove();
  }

  static init() async {
    await drModelosForaneos.remove();
    await InicializarModelosForaneos.init();
  }

  static todos(List<ModeloForaneo> lista) async {
    // Lista de Modelos Foráneos
    lista.clear();
    drModelosForaneos.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = ModeloForaneo();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
