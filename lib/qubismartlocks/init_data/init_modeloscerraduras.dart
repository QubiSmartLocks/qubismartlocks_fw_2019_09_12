/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelos de Cerraduras -> Inicializar Modelo de Cerradura
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarModelosCerraduras {
  static init() async {
    int i = 1;
    ModeloCerradura _modeloCerradura;

    _modeloCerradura = new ModeloCerradura();
    _modeloCerradura.id = i++;
    _modeloCerradura.marca = DEM.listaMarcasCerraduras[0];
    _modeloCerradura.denomModelo = '';
    _modeloCerradura.descModelo = '';
    // Guarda usando el API
//    await ModelosCerraduras.guardar(_modeloCerradura);
    // Guarda usando Firebase Realtime Database
//    await ModelosCerradurasFB.guardarModeloCerradura(modeloCerradura: _modeloCerradura);
    DEM.listaModelosCerraduras.add(_modeloCerradura);

  }
}
