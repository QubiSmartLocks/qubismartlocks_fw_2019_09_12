/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Logs de Cerraduras -> Inicializar Log de Cerradura
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarLogsCerraduras {
  static init() async {
    int i = 1;
    LogCerradura _logCerradura;

    _logCerradura = new LogCerradura();
    _logCerradura.id = i++;
    _logCerradura.cerradura = DEM.listaCerraduras[0];
    _logCerradura.fecha = DateTime.now();
    _logCerradura.hora = TimeOfDay.now();
    _logCerradura.detLog = '';
    // Guarda usando el API
//    await LogsCerraduras.guardar(_logCerradura);
    // Guarda usando Firebase Realtime Database
//    await LogsCerradurasFB.guardarLogCerradura(logCerradura: _logCerradura);
    DEM.listaLogsCerraduras.add(_logCerradura);

  }
}
