/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Rooms
 [Clock PMS (Api Reservaciones)/Clock PMS (Api Reservaciones)/Rooms]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIRoomsForma extends StatefulWidget {
  static const String ruta = '/ui-rooms/forma';

  @override
  _UIRoomsFormaState createState() => _UIRoomsFormaState();
}

class _UIRoomsFormaState extends State<UIRoomsForma> {

  _nuevoroom() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIRoomEdicion(registro: Room())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_ROOMS_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_ROOMS_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_ROOMS_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_ROOMS_TITULO],
      onTapAdd: _nuevoroom,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIRoomsLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevoroom),
        ],
      ),
    );
  }
}
