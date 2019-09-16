/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Pasajeros -> Inicializar Pasajero
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarPasajeros {
  static init() async {
    int i = 1;
    Pasajero _pasajero;

    _pasajero = new Pasajero();
    _pasajero.id = i++;
    _pasajero.reservacion = 0;
    _pasajero.nombres = '';
    _pasajero.apellidos = '';
    _pasajero.tipoIdent = DEM.listaTiposIdent[0];
    _pasajero.docIdent = '';
    _pasajero.telefono = '';
    _pasajero.correoElectronico = '';
    _pasajero.llaveElectronica = false;
    // Guarda usando el API
//    await Pasajeros.guardar(_pasajero);
    // Guarda usando Firebase Realtime Database
//    await PasajerosFB.guardarPasajero(pasajero: _pasajero);
    DEM.listaPasajeros.add(_pasajero);

  }
}
