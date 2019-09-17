/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad UnidadesFuncionales -> Unidad Funcional
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class UnidadesFuncionalesFB {

  static fb.DatabaseReference drUnidadesFuncionales = DEM.db.ref( UNIDADESFUNCIONALES.ENTIDAD );

  static Future guardarUnidadFuncional({UnidadFuncional unidadFuncional}) async {

    if (unidadFuncional.key == '') {
      unidadFuncional.key = drUnidadesFuncionales.push().key;
    }
    await drUnidadesFuncionales.child(unidadFuncional.key).update(unidadFuncional.toJson());
  }

  static Future borrarUnidadFuncional({UnidadFuncional unidadFuncional}) async {
    await drUnidadesFuncionales.child(unidadFuncional.key).remove();
  }

  static init() async {
    await drUnidadesFuncionales.remove();
    await InicializarUnidadesFuncionales.init();
  }

  static todos(List<UnidadFuncional> lista) async {
    // Lista de Unidades Funcionales
    lista.clear();
    drUnidadesFuncionales.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = UnidadFuncional();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
