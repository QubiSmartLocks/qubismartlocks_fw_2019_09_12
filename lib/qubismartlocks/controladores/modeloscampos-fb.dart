/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad ModelosCampos -> Modelo Campo
   [Qubi Smart Locks/Modelos de Campos]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class ModelosCamposFB {

  static fb.DatabaseReference drModelosCampos = DEM.db.ref( MODELOSCAMPOS.ENTIDAD );

  static Future guardarModeloCampo({ModeloCampo modeloCampo}) async {

    if (modeloCampo.key == '') {
      modeloCampo.key = drModelosCampos.push().key;
    }
    await drModelosCampos.child(modeloCampo.key).update(modeloCampo.toJson());
  }

  static Future borrarModeloCampo({ModeloCampo modeloCampo}) async {
    await drModelosCampos.child(modeloCampo.key).remove();
  }

  static init() async {
    await drModelosCampos.remove();
    await InicializarModelosCampos.init();
  }

  static todos(List<ModeloCampo> lista) async {
    // Lista de Modelos Campos
    lista.clear();
    drModelosCampos.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = ModeloCampo();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
