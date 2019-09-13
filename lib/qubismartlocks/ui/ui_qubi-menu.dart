import 'package:qubismartlocks_fw/qubismartlocks.dart';

String palabraMasLarga = '';

double tamayoFuente;

class UIQubiMenu extends StatefulWidget {
  UIQubiMenu({this.opciones});

  final List<OpcionQubi> opciones;

  @override
  _UIQubiMenuState createState() => _UIQubiMenuState();
}

class _UIQubiMenuState extends State<UIQubiMenu> {
  @override
  Widget build(BuildContext context) {
    CD.iniciar(context);
    double ladoMayor = CD.minimo * 0.7;
    double ladoMenor = ladoMayor / 3;
    double margenMayor = CD.minimo * 0.15;
    double margenMenor = ladoMenor * 0.05;

    widget.opciones.forEach((opcion) {
      if (opcion.texto.length > palabraMasLarga.length) {
        palabraMasLarga = opcion.texto;
      }
    });
    tamayoFuente = calculoTamayoFuente(
        palabraMasLarga,
        (AppRes.appResMap[Co.DECORACION_CAMPO_MENU] as TextStyle),
        5,
        ladoMenor - margenMenor * 2);

    return Container(
      height: ladoMayor,
      width: ladoMayor,
      margin: EdgeInsets.only(
          top: margenMayor,
          right: margenMayor,
          left: CD.ancho - ladoMayor - margenMayor * 2),
//      color: Colors.green.withOpacity(0.3),
      child: GridView.count(
        crossAxisCount: 3,
        children: widget.opciones.map((opcion) {
          return UIQubiOpcionMenu(opcion: opcion, fontSize: tamayoFuente);
        }).toList(),
      ),
    );
  }
}

class UIQubiOpcionMenu extends StatefulWidget {
  UIQubiOpcionMenu({
    this.opcion,
    this.fontSize,
  });

  final OpcionQubi opcion;
  final double fontSize;

  @override
  _UIQubiOpcionMenuState createState() => _UIQubiOpcionMenuState();
}

class _UIQubiOpcionMenuState extends State<UIQubiOpcionMenu> {
  final List<Alignment> listaAlineacion = [
    Alignment.bottomRight,
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.centerRight,
    Alignment.center,
    Alignment.centerLeft,
    Alignment.topRight,
    Alignment.topCenter,
    Alignment.topLeft,
  ];

  @override
  Widget build(BuildContext context) {
    CD.iniciar(context);
    double ladoMayor = CD.minimo * 0.7;
    double ladoMenor = ladoMayor / 3;
    double margenMenor = ladoMenor * 0.05;

    return widget.opcion.ruta.isEmpty
        ? Container(
            height: ladoMenor - margenMenor * 2,
            width: ladoMenor - margenMenor * 2,
            margin: EdgeInsets.all(margenMenor),
            color: widget.opcion.color,
//            child: Text(
//              tamayoFuente.toString(),
////              (ladoMenor - margenMenor * 2).toString(),
//                style: (AppRes.appResMap[Co.DECORACION_CAMPO_MENU] as TextStyle)
//                    .copyWith(fontSize: widget.fontSize),
//            ),
          )
        : GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, widget.opcion.ruta);
            },
            child: Container(
              height: ladoMenor - margenMenor * 2,
              width: ladoMenor - margenMenor * 2,
              margin: EdgeInsets.all(margenMenor),
              color: widget.opcion.color,
              alignment: listaAlineacion[widget.opcion.orden - 1],
              child: Text(
                widget.opcion.texto,
                style: (AppRes.appResMap[Co.DECORACION_CAMPO_MENU] as TextStyle)
                    .copyWith(fontSize: widget.fontSize),
//                    .copyWith(fontSize: calculoTamayoFuente(widget.opcion.texto, (AppRes.appResMap[Co.DECORACION_CAMPO_MENU] as TextStyle), 30, (ladoMenor - margenMenor * 2))),
              ),
            ),
          );
  }
}

double calculoTamayoFuente(
    String text, TextStyle style, double startFontSize, double maxWidth) {
  final textPainter = TextPainter(textDirection: TextDirection.ltr);

  var currentFontSize = startFontSize;

  for (var i = 0; i < 100; i++) {
    // limit max iterations to 100
    final nextFontSize = currentFontSize + 1;
    final nextTextStyle = style.copyWith(fontSize: nextFontSize);
    textPainter.text = TextSpan(text: text, style: nextTextStyle);
    textPainter.layout();
    if (textPainter.width >= maxWidth) {
      break;
    } else {
      currentFontSize = nextFontSize;
      // continue iteration
    }
  }

  return currentFontSize;
}

Map<String, double> calculoAltoAnchoTextoEnFuente(
    String text, TextStyle style) {
  final textPainter = TextPainter(textDirection: TextDirection.ltr);

  textPainter.text = TextSpan(text: text, style: style);
  textPainter.layout();
  return {'width': textPainter.width, 'height': textPainter.height};
}
