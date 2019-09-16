/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Unidades Funcionales -> Inicializar Unidad Funcional
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarUnidadesFuncionales {
  static init() async {
    int i = 1;
    UnidadFuncional _unidadFuncional;

    _unidadFuncional = new UnidadFuncional();
    _unidadFuncional.id = i++;
    _unidadFuncional.edificacion = DEM.listaEdificaciones[0];
    _unidadFuncional.zona = DEM.listaZonasEdificaciones[0];
    _unidadFuncional.tipoUnidadFuncional = DEM.listaTipUnidadesFuncionales[0];
    _unidadFuncional.denomUnidadFuncional = '';
    // Guarda usando el API
//    await UnidadesFuncionales.guardar(_unidadFuncional);
    // Guarda usando Firebase Realtime Database
//    await UnidadesFuncionalesFB.guardarUnidadFuncional(unidadFuncional: _unidadFuncional);
    DEM.listaUnidadesFuncionales.add(_unidadFuncional);

  }
}
