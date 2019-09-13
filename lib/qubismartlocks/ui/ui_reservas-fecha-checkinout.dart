import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIReservasFechaCheckInOut extends StatefulWidget {
  UIReservasFechaCheckInOut(
      {this.in_out, this.fecha, this.ancho = 40, this.alto = 40});

  final String in_out;
  final DateTime fecha;
  final double ancho;
  final double alto;

  @override
  _UIReservasFechaCheckInOutState createState() =>
      _UIReservasFechaCheckInOutState();
}

class _UIReservasFechaCheckInOutState extends State<UIReservasFechaCheckInOut> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
//        UISeparadorLineaVertical(),
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: widget.ancho,
              height: widget.alto,
              child: Image.asset('images/ui_candado-' +
                  (widget.in_out == 'in' ? 'abierto' : 'cerrado') +
                  '-azul-claro.png'),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                MostrarFecha(widget.fecha),
                style: AppRes.appResMap[Co.ESTILO_LISTA_1RA_LINEA],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                'Check ' + widget.in_out,
                style: AppRes.appResMap[Co.ESTILO_LISTA_2DA_LINEA],
              ),
            )
          ],
        ),
      ],
    );
  }
}
