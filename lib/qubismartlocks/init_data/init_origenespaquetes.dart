/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Orígenes de Paquetes -> Inicializar Orígen de Paquete
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarOrigenesPaquetes {
  static init() async {
    int i = 1;
    OrigenPaquete _origenPaquete;

    _origenPaquete = new OrigenPaquete();
    _origenPaquete.id = i++;
    _origenPaquete.denomOrigenPaquete = 'Ups';
    // Guarda usando el API
//    await OrigenesPaquetes.guardar(_origenPaquete);
    // Guarda usando Firebase Realtime Database
//    await OrigenesPaquetesFB.guardarOrigenPaquete(origenPaquete: _origenPaquete);
    DEM.listaOrigenesPaquetes.add(_origenPaquete);

    _origenPaquete = new OrigenPaquete();
    _origenPaquete.id = i++;
    _origenPaquete.denomOrigenPaquete = 'DHL';
    // Guarda usando el API
//    await OrigenesPaquetes.guardar(_origenPaquete);
    // Guarda usando Firebase Realtime Database
//    await OrigenesPaquetesFB.guardarOrigenPaquete(origenPaquete: _origenPaquete);
    DEM.listaOrigenesPaquetes.add(_origenPaquete);

    _origenPaquete = new OrigenPaquete();
    _origenPaquete.id = i++;
    _origenPaquete.denomOrigenPaquete = 'FedEx';
    // Guarda usando el API
//    await OrigenesPaquetes.guardar(_origenPaquete);
    // Guarda usando Firebase Realtime Database
//    await OrigenesPaquetesFB.guardarOrigenPaquete(origenPaquete: _origenPaquete);
    DEM.listaOrigenesPaquetes.add(_origenPaquete);

    _origenPaquete = new OrigenPaquete();
    _origenPaquete.id = i++;
    _origenPaquete.denomOrigenPaquete = 'US Post Office';
    // Guarda usando el API
//    await OrigenesPaquetes.guardar(_origenPaquete);
    // Guarda usando Firebase Realtime Database
//    await OrigenesPaquetesFB.guardarOrigenPaquete(origenPaquete: _origenPaquete);
    DEM.listaOrigenesPaquetes.add(_origenPaquete);


    _origenPaquete = new OrigenPaquete();
    _origenPaquete.id = i++;
    _origenPaquete.denomOrigenPaquete = 'MRW';
    // Guarda usando el API
//    await OrigenesPaquetes.guardar(_origenPaquete);
    // Guarda usando Firebase Realtime Database
//    await OrigenesPaquetesFB.guardarOrigenPaquete(origenPaquete: _origenPaquete);
    DEM.listaOrigenesPaquetes.add(_origenPaquete);
  }
}
