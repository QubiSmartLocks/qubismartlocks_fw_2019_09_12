/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Rooms -> Room
   [Qubi Smart Locks/Clock PMS (Api Reservaciones)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class RoomsFB {

  static fb.DatabaseReference drRooms = DEM.db.ref( ROOMS.ENTIDAD );

  static Future guardarRoom({Room room}) async {

    if (room.key == '') {
      room.key = drRooms.push().key;
    }
    await drRooms.child(room.key).update(room.toJson());
  }

  static Future borrarRoom({Room room}) async {
    await drRooms.child(room.key).remove();
  }

  static init() async {
    await drRooms.remove();
    await InicializarRooms.init();
  }

  static todos(List<Room> lista) async {
    // Lista de Rooms
    lista.clear();
    drRooms.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = Room();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
