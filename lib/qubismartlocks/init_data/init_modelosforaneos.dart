/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelos Foráneos -> Inicializar Modelo Foráneo
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarModelosForaneos {
  static init() async {
    int i = 1;
    ModeloForaneo _modeloForaneo;

    _modeloForaneo = new ModeloForaneo();
    _modeloForaneo.id = i++;
    _modeloForaneo.denomModeloForaneo = '';
    _modeloForaneo.descModeloForaneo = '';
    // Guarda usando el API
//    await ModelosForaneos.guardar(_modeloForaneo);
    // Guarda usando Firebase Realtime Database
//    await ModelosForaneosFB.guardarModeloForaneo(modeloForaneo: _modeloForaneo);
    DEM.listaModelosForaneos.add(_modeloForaneo);

  }
}
