/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Bookings
 [Clock PMS (Api Reservaciones)/Clock PMS (Api Reservaciones)/Bookings]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIBookingsForma extends StatefulWidget {
  static const String ruta = '/ui-bookings/forma';

  @override
  _UIBookingsFormaState createState() => _UIBookingsFormaState();
}

class _UIBookingsFormaState extends State<UIBookingsForma> {

  _nuevobooking() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIBookingEdicion(registro: Booking())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_BOOKINGS_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_BOOKINGS_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_BOOKINGS_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_BOOKINGS_TITULO],
      onTapAdd: _nuevobooking,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIBookingsLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevobooking),
        ],
      ),
    );
  }
}
