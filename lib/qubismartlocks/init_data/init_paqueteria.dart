/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Paquetería -> Inicializar Paquete
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarPaqueteria {
  static init() async {
    int i = 1;
    Paquete _paquete;

    _paquete = new Paquete();
    _paquete.id = i++;
    _paquete.origenPaquete = DEM.listaOrigenesPaquetes[0];
    _paquete.numeroRastreo = '';
    _paquete.destinatario = '';
    _paquete.fechaHoraRecepcion = new DateTime.now();
    _paquete.notaRecepcion = '';
    _paquete.notaDestinatario = '';
    _paquete.fechaHoraEntregado = new DateTime.now();
    _paquete.pasajero = DEM.listaPasajeros[0];
    _paquete.recibidoPasajero = new DateTime.now();
    _paquete.recepcionista = 0;
    _paquete.mensajeenviado = false;
    // Guarda usando el API
//    await Paqueteria.guardar(_paquete);
    // Guarda usando Firebase Realtime Database
//    await PaqueteriaFB.guardarPaquete(paquete: _paquete);
    DEM.listaPaqueteria.add(_paquete);

  }
}
