/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad RoomTypes -> Room Type
   [Qubi Smart Locks/Clock PMS (Api Reservaciones)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class RoomTypesFB {

  static fb.DatabaseReference drRoomTypes = DEM.db.ref( ROOMTYPES.ENTIDAD );

  static Future guardarRoomType({RoomType roomType}) async {

    if (roomType.key == '') {
      roomType.key = drRoomTypes.push().key;
    }
    await drRoomTypes.child(roomType.key).update(roomType.toJson());
  }

  static Future borrarRoomType({RoomType roomType}) async {
    await drRoomTypes.child(roomType.key).remove();
  }

  static init() async {
    await drRoomTypes.remove();
    await InicializarRoomTypes.init();
  }

  static todos(List<RoomType> lista) async {
    // Lista de Room Types
    lista.clear();
    drRoomTypes.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = RoomType();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
