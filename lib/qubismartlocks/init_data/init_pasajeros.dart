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
    _pasajero.nombres = 'Jorge';
    _pasajero.apellidos = 'Pelaez';
    _pasajero.tipoIdent = DEM.listaTiposIdent[0];
    _pasajero.docIdent = '1134356';
    _pasajero.telefono = '300 5557686';
    _pasajero.correoElectronico = 'jpelaez@email.com';
    _pasajero.llaveElectronica = false;
    // Guarda usando el API
//    await Pasajeros.guardar(_pasajero);
    // Guarda usando Firebase Realtime Database
//    await PasajerosFB.guardarPasajero(pasajero: _pasajero);
    DEM.listaPasajeros.add(_pasajero);
    _pasajero = new Pasajero();
    _pasajero.id = i++;
    _pasajero.reservacion = 0;
    _pasajero.nombres = 'Juan Jaime';
    _pasajero.apellidos = 'González';
    _pasajero.tipoIdent = DEM.listaTiposIdent[0];
    _pasajero.docIdent = '79756484';
    _pasajero.telefono = '300 55564538';
    _pasajero.correoElectronico = 'jjgonzalez@email.com';
    _pasajero.llaveElectronica = false;
    // Guarda usando el API
//    await Pasajeros.guardar(_pasajero);
    // Guarda usando Firebase Realtime Database
//    await PasajerosFB.guardarPasajero(pasajero: _pasajero);
    DEM.listaPasajeros.add(_pasajero);

    _pasajero = new Pasajero();
    _pasajero.id = i++;
    _pasajero.reservacion = 0;
    _pasajero.nombres = 'Manuela';
    _pasajero.apellidos = 'Johns';
    _pasajero.tipoIdent = DEM.listaTiposIdent[1];
    _pasajero.docIdent = '64578';
    _pasajero.telefono = '300 5559768';
    _pasajero.correoElectronico = 'manuela@email.com';
    _pasajero.llaveElectronica = false;
    // Guarda usando el API
//    await Pasajeros.guardar(_pasajero);
    // Guarda usando Firebase Realtime Database
//    await PasajerosFB.guardarPasajero(pasajero: _pasajero);
    DEM.listaPasajeros.add(_pasajero);

    _pasajero = new Pasajero();
    _pasajero.id = i++;
    _pasajero.reservacion = 0;
    _pasajero.nombres = 'Sandra';
    _pasajero.apellidos = 'Torres';
    _pasajero.tipoIdent = DEM.listaTiposIdent[2];
    _pasajero.docIdent = '87980';
    _pasajero.telefono = '300 9786931';
    _pasajero.correoElectronico = 'storres@email.com';
    _pasajero.llaveElectronica = false;
    // Guarda usando el API
//    await Pasajeros.guardar(_pasajero);
    // Guarda usando Firebase Realtime Database
//    await PasajerosFB.guardarPasajero(pasajero: _pasajero);
    DEM.listaPasajeros.add(_pasajero);

    _pasajero = new Pasajero();
    _pasajero.id = i++;
    _pasajero.reservacion = 0;
    _pasajero.nombres = 'Heriberto';
    _pasajero.apellidos = 'Lizcano';
    _pasajero.tipoIdent = DEM.listaTiposIdent[0];
    _pasajero.docIdent = '35462889';
    _pasajero.telefono = '300 55598097';
    _pasajero.correoElectronico = 'jpelaez@email.com';
    _pasajero.llaveElectronica = false;
    // Guarda usando el API
//    await Pasajeros.guardar(_pasajero);
    // Guarda usando Firebase Realtime Database
//    await PasajerosFB.guardarPasajero(pasajero: _pasajero);
    DEM.listaPasajeros.add(_pasajero);
  }
}
