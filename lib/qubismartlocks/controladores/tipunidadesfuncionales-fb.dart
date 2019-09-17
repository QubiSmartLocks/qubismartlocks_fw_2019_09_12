/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad TipUnidadesFuncionales -> Tipo de Unidad Funcional
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class TipUnidadesFuncionalesFB {

  static fb.DatabaseReference drTipUnidadesFuncionales = DEM.db.ref( TIPUNIDADESFUNCIONALES.ENTIDAD );

  static Future guardarTipoUnidadFuncional({TipoUnidadFuncional tipoUnidadFuncional}) async {

    if (tipoUnidadFuncional.key == '') {
      tipoUnidadFuncional.key = drTipUnidadesFuncionales.push().key;
    }
    await drTipUnidadesFuncionales.child(tipoUnidadFuncional.key).update(tipoUnidadFuncional.toJson());
  }

  static Future borrarTipoUnidadFuncional({TipoUnidadFuncional tipoUnidadFuncional}) async {
    await drTipUnidadesFuncionales.child(tipoUnidadFuncional.key).remove();
  }

  static init() async {
    await drTipUnidadesFuncionales.remove();
    await InicializarTipUnidadesFuncionales.init();
  }

  static todos(List<TipoUnidadFuncional> lista) async {
    // Lista de Tipos de Unidades Funcionales
    lista.clear();
    drTipUnidadesFuncionales.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = TipoUnidadFuncional();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
