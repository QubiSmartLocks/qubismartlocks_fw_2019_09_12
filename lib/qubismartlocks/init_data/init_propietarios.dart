/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Propietarios -> Inicializar Propietario
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarPropietarios {
  static init() async {
    int i = 1;
    Propietario _propietario;

    _propietario = new Propietario();
    _propietario.id = i++;
    _propietario.nombreCompletoPropietario = '';
    _propietario.usuario = 0;
    // Guarda usando el API
//    await Propietarios.guardar(_propietario);
    // Guarda usando Firebase Realtime Database
//    await PropietariosFB.guardarPropietario(propietario: _propietario);
    DEM.listaPropietarios.add(_propietario);

  }
}
