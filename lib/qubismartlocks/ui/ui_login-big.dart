import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UILoginBig extends StatelessWidget {
  const UILoginBig({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Contenedor izquierdo que hace de separador centrador
        UILaterales(),
        // Contenedor que muestra la imagen hoteles movil
        UILoginBackgroundImage(
          ancho: MediaQuery.of(context).size.width * .4,
        ),
        // Contenedor que muestra nombre, logo, login y botón
        Container(
          width: App.variables.calculeAnchoResponsive(context, .4, .8, .8, .8),
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              UILoginLogo(),
              UILoginForm(),
              SizedBox(height: 30,),
            ],
          ),
        ),
        // Contenedor derecho que hace de separador centrador
        UILaterales(),
      ],
    );
  }
}
