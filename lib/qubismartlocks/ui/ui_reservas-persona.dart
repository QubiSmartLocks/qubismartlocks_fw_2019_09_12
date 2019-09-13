import 'package:flutter_web/material.dart';

class UIReservasPersona extends StatefulWidget {
  UIReservasPersona(
      {this.texto, this.cantidad, this.ancho, this.alto, this.margin});

  final String texto;
  final int cantidad;
  final double ancho;
  final double alto;
  final EdgeInsets margin;

//  (texto: 'Adultos', cantidad: reservacion.adults, ancho: 70, alto: 100,),
  @override
  _UIReservasPersonaState createState() => _UIReservasPersonaState();
}

class _UIReservasPersonaState extends State<UIReservasPersona> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: widget.margin,
        width: widget.ancho,
        height: widget.alto,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
//                        mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: widget.ancho,
                  height: widget.alto - 20,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: widget.ancho,
                        height: widget.alto - 20,
                        child: Image.asset(
                          'images/ui_person.png',
                        scale: .5,
//                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: widget.ancho,
                  height: widget.alto - 20,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Color(0xFF7EB8C0),
                          radius: 10,
                          child: (Text(
                              widget.cantidad.toString(),
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white))),
                        ),
                      ]),
                ),
              ],
            ),
            Text(
              widget.texto,
              style: TextStyle(
                color: Color(0xFF7EB8C0),
                fontFamily: 'Poppins',
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
