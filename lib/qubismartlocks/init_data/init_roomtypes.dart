/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Room Types -> Inicializar Room Type
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarRoomTypes {
  static init() async {
    int i = 1;
    RoomType _roomType;

    _roomType = new RoomType();
    _roomType.pkid = 0;
    _roomType.id = i++;
    _roomType.name = '';
    _roomType.location_id = 0;
    // Guarda usando el API
//    await RoomTypes.guardar(_roomType);
    // Guarda usando Firebase Realtime Database
//    await RoomTypesFB.guardarRoomType(roomType: _roomType);
    DEM.listaRoomTypes.add(_roomType);

  }
}
