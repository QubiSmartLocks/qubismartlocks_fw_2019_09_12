/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Estados de Cerraduras -> Inicializar Estado de Cerradura
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarEstadosCerraduras {
  static init() async {
    int i = 1;
    EstadoCerradura _estadoCerradura;

    _estadoCerradura = new EstadoCerradura();
    _estadoCerradura.id = i++;
    _estadoCerradura.denomEstadoCerradura = '';
    _estadoCerradura.activa = false;
    // Guarda usando el API
//    await EstadosCerraduras.guardar(_estadoCerradura);
    // Guarda usando Firebase Realtime Database
//    await EstadosCerradurasFB.guardarEstadoCerradura(estadoCerradura: _estadoCerradura);
    DEM.listaEstadosCerraduras.add(_estadoCerradura);

  }
}
