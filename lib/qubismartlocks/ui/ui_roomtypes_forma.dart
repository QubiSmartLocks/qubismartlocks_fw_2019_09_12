/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Room Types
 [Clock PMS (Api Reservaciones)/Clock PMS (Api Reservaciones)/Room Types]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIRoomTypesForma extends StatefulWidget {
  static const String ruta = '/ui-roomtypes/forma';

  @override
  _UIRoomTypesFormaState createState() => _UIRoomTypesFormaState();
}

class _UIRoomTypesFormaState extends State<UIRoomTypesForma> {

  _nuevoroomtype() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIRoomTypeEdicion(registro: RoomType())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_ROOMTYPES_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_ROOMTYPES_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_ROOMTYPES_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_ROOMTYPES_TITULO],
      onTapAdd: _nuevoroomtype,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIRoomTypesLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevoroomtype),
        ],
      ),
    );
  }
}
