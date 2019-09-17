/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: splash.dart
 Pantalla de la aplicacion cuando aun no se ha iniciado sesión, tal vez porque no hay internet
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CD.iniciar(context);
    return new Material(
      type: MaterialType.transparency,
      child: Container(
        child: Center(
          child: Text(
            'Esperando conexión...',
            style: estiloEtiquetaEdicion,
          ),
        ),
      ),
    );
  }
}
