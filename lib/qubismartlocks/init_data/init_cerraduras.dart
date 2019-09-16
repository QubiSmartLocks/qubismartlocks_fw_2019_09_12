/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Cerraduras -> Inicializar Cerradura
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarCerraduras {
  static init() async {
    int i = 1;
    Cerradura _cerradura;

    _cerradura = new Cerradura();
    _cerradura.id = i++;
    _cerradura.marca = DEM.listaMarcasCerraduras[0];
    _cerradura.modelo = DEM.listaModelosCerraduras[0];
    _cerradura.denomCerradura = '';
    _cerradura.serial = '';
    _cerradura.unidadFuncional = DEM.listaUnidadesFuncionales[0];
    _cerradura.estadoCerradura = DEM.listaEstadosCerraduras[0];
    // Guarda usando el API
//    await Cerraduras.guardar(_cerradura);
    // Guarda usando Firebase Realtime Database
//    await CerradurasFB.guardarCerradura(cerradura: _cerradura);
    DEM.listaCerraduras.add(_cerradura);

  }
}
