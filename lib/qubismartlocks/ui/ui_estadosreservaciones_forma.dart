/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Estados de Reservaciones
 [Qubi Smart Locks/Qubi Smart Locks/Estados de Reservaciones]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIEstadosReservacionesForma extends StatefulWidget {
  static const String ruta = '/ui-estadosreservaciones/forma';

  @override
  _UIEstadosReservacionesFormaState createState() => _UIEstadosReservacionesFormaState();
}

class _UIEstadosReservacionesFormaState extends State<UIEstadosReservacionesForma> {

  _nuevoestadoreservacion() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIEstadoReservacionEdicion(registro: EstadoReservacion())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_ESTADOSRESERVACIONES_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_ESTADOSRESERVACIONES_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_ESTADOSRESERVACIONES_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_ESTADOSRESERVACIONES_TITULO],
      onTapAdd: _nuevoestadoreservacion,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIEstadosReservacionesLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevoestadoreservacion),
        ],
      ),
    );
  }
}
