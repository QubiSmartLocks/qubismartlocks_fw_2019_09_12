/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Rooms -> Inicializar Room
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarRooms {
  static init() async {
    int i = 1;
    Room _room;

    _room = new Room();
    _room.pkid = 0;
    _room.id = i++;
    _room.name = '';
    _room.room_type_id = 0;
    _room.housekeeping_warning = '';
    _room.housekeeping_status = '';
    _room.description = '';
    _room.sort_order = 0;
    _room.location_id = 0;
    // Guarda usando el API
//    await Rooms.guardar(_room);
    // Guarda usando Firebase Realtime Database
//    await RoomsFB.guardarRoom(room: _room);
    DEM.listaRooms.add(_room);

  }
}
