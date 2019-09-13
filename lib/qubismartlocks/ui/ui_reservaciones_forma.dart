/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Reservaciones
 [Qubi Smart Locks/Qubi Smart Locks/Reservaciones]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIReservacionesForma extends StatefulWidget {
  static const String ruta = '/ui-reservaciones/forma';

  @override
  _UIReservacionesFormaState createState() => _UIReservacionesFormaState();
}

class _UIReservacionesFormaState extends State<UIReservacionesForma> {

  _nuevoreservacion() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIReservacionEdicion(registro: Reservacion())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_RESERVACIONES_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_RESERVACIONES_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_RESERVACIONES_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_RESERVACIONES_TITULO],
      onTapAdd: _nuevoreservacion,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIReservacionesLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevoreservacion),
        ],
      ),
    );
  }
}
