/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Marcas de Cerraduras -> Inicializar Marca de Cerradura
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarMarcasCerraduras {
  static init() async {
    int i = 1;
    MarcaCerradura _marcaCerradura;

    _marcaCerradura = new MarcaCerradura();
    _marcaCerradura.id = i++;
    _marcaCerradura.denomMarcaCerradura = '';
    _marcaCerradura.descMarcaCerradura = '';
    // Guarda usando el API
//    await MarcasCerraduras.guardar(_marcaCerradura);
    // Guarda usando Firebase Realtime Database
//    await MarcasCerradurasFB.guardarMarcaCerradura(marcaCerradura: _marcaCerradura);
    DEM.listaMarcasCerraduras.add(_marcaCerradura);

  }
}
