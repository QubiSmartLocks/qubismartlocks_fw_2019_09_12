/*
 Proyecto: Qubi Smart Locks
 Version: 0.0.2
 Autor: Abner Hernández
 Unidad: UI Reservaciones
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UIReservaciones extends StatefulWidget {
  static const String ruta = '/ui_reservaciones';

  @override
  _UIReservacionesState createState() => _UIReservacionesState();
}

class _UIReservacionesState extends State<UIReservaciones> {
  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: .7,
      factorAncho: .7,
      icono: 'images/web_qubi_pasajeros.png',
      titulo: RESERVACIONES.ETIQUETA_ENTIDAD,
      child: Column(
        children: <Widget>[
          // Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          UIReservacionesLista(),
          // Aqui el Widget de los Botones
        ],
      ),
    );
  }
}
