/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Históricos de Cerraduras -> Inicializar Histórico de Cerradura
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarHistoricosCerraduras {
  static init() async {
    int i = 1;
    HistoricoCerradura _historicoCerradura;

    _historicoCerradura = new HistoricoCerradura();
    _historicoCerradura.id = i++;
    _historicoCerradura.cerradura = DEM.listaCerraduras[0];
    _historicoCerradura.fecha = DateTime.now();
    _historicoCerradura.hora = TimeOfDay.now();
    _historicoCerradura.usuario = 0;
    _historicoCerradura.funcion = '';
    _historicoCerradura.notas = '';
    // Guarda usando el API
//    await HistoricosCerraduras.guardar(_historicoCerradura);
    // Guarda usando Firebase Realtime Database
//    await HistoricosCerradurasFB.guardarHistoricoCerradura(historicoCerradura: _historicoCerradura);
    DEM.listaHistoricosCerraduras.add(_historicoCerradura);

  }
}
