/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Tipos de Unidades Funcionales -> Inicializar Tipo de Unidad Funcional
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarTipUnidadesFuncionales {
  static init() async {
    int i = 1;
    TipoUnidadFuncional _tipoUnidadFuncional;

    _tipoUnidadFuncional = new TipoUnidadFuncional();
    _tipoUnidadFuncional.id = i++;
    _tipoUnidadFuncional.denomTipoUnidadFuncional = '';
    _tipoUnidadFuncional.maximoCerradurasAsignadas = 0;
    // Guarda usando el API
//    await TipUnidadesFuncionales.guardar(_tipoUnidadFuncional);
    // Guarda usando Firebase Realtime Database
//    await TipUnidadesFuncionalesFB.guardarTipoUnidadFuncional(tipoUnidadFuncional: _tipoUnidadFuncional);
    DEM.listaTipUnidadesFuncionales.add(_tipoUnidadFuncional);

  }
}
