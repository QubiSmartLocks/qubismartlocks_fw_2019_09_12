import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UILoginBackgroundImage extends StatelessWidget {
  UILoginBackgroundImage({this.ancho, this.opacidad});

  double ancho;
  double opacidad;

  @override
  Widget build(BuildContext context) {

    if (ancho == null) {
      ancho = MediaQuery.of(context).size.width;
    }
    if (opacidad == null) {
      opacidad = 1;
    }
    return Container(
      height: MediaQuery.of(context).size.height,
      width: ancho,
      child: Opacity(
        opacity: opacidad,
        child: Image.asset(
          AppRes.appResMap[Co.BACKGROUND_LOGIN],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
