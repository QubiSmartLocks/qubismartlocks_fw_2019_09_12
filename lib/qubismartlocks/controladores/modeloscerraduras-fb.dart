/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad ModelosCerraduras -> Modelo de Cerradura
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class ModelosCerradurasFB {

  static fb.DatabaseReference drModelosCerraduras = DEM.db.ref( MODELOSCERRADURAS.ENTIDAD );

  static Future guardarModeloCerradura({ModeloCerradura modeloCerradura}) async {

    if (modeloCerradura.key == '') {
      modeloCerradura.key = drModelosCerraduras.push().key;
    }
    await drModelosCerraduras.child(modeloCerradura.key).update(modeloCerradura.toJson());
  }

  static Future borrarModeloCerradura({ModeloCerradura modeloCerradura}) async {
    await drModelosCerraduras.child(modeloCerradura.key).remove();
  }

  static init() async {
    await drModelosCerraduras.remove();
    await InicializarModelosCerraduras.init();
  }

  static todos(List<ModeloCerradura> lista) async {
    // Lista de Modelos de Cerraduras
    lista.clear();
    drModelosCerraduras.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = ModeloCerradura();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
