/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Pasajeros
 [Qubi Smart Locks/Qubi Smart Locks/Pasajeros]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIPasajerosForma extends StatefulWidget {
  static const String ruta = '/ui-pasajeros/forma';

  @override
  _UIPasajerosFormaState createState() => _UIPasajerosFormaState();
}

class _UIPasajerosFormaState extends State<UIPasajerosForma> {

  _nuevopasajero() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIPasajeroEdicion(registro: Pasajero())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_PASAJEROS_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_PASAJEROS_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_PASAJEROS_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_PASAJEROS_TITULO],
      onTapAdd: _nuevopasajero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIPasajerosLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevopasajero),
        ],
      ),
    );
  }
}
