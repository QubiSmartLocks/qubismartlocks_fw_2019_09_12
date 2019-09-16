/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Room Rates -> Inicializar Room Rate
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarRoomRates {
  static init() async {
    int i = 1;
    RoomRate _roomRate;

    _roomRate = new RoomRate();
    _roomRate.pkid = 0;
    _roomRate.id = i++;
    _roomRate.name = '';
    _roomRate.room_type_id = 0;
    _roomRate.housekeeping_warning = '';
    _roomRate.housekeeping_status = '';
    _roomRate.description = '';
    _roomRate.sort_order = 0;
    _roomRate.location_id = 0;
    // Guarda usando el API
//    await RoomRates.guardar(_roomRate);
    // Guarda usando Firebase Realtime Database
//    await RoomRatesFB.guardarRoomRate(roomRate: _roomRate);
    DEM.listaRoomRates.add(_roomRate);

  }
}
