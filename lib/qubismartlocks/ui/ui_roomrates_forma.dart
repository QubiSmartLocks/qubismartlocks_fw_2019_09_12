/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Room Rates
 [Clock PMS (Api Reservaciones)/Clock PMS (Api Reservaciones)/Room Rates]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIRoomRatesForma extends StatefulWidget {
  static const String ruta = '/ui-roomrates/forma';

  @override
  _UIRoomRatesFormaState createState() => _UIRoomRatesFormaState();
}

class _UIRoomRatesFormaState extends State<UIRoomRatesForma> {

  _nuevoroomrate() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIRoomRateEdicion(registro: RoomRate())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_ROOMRATES_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_ROOMRATES_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_ROOMRATES_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_ROOMRATES_TITULO],
      onTapAdd: _nuevoroomrate,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIRoomRatesLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevoroomrate),
        ],
      ),
    );
  }
}
