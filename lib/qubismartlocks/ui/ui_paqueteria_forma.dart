/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Paquetería
 [Qubi Smart Locks/Qubi Smart Locks/Paquetería]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIPaqueteriaForma extends StatefulWidget {
  static const String ruta = '/ui-paqueteria/forma';

  @override
  _UIPaqueteriaFormaState createState() => _UIPaqueteriaFormaState();
}

class _UIPaqueteriaFormaState extends State<UIPaqueteriaForma> {

  _nuevopaquete() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIPaqueteEdicion(registro: Paquete())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_PAQUETERIA_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_PAQUETERIA_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_PAQUETERIA_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_PAQUETERIA_TITULO],
      onTapAdd: _nuevopaquete,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIPaqueteriaLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevopaquete),
        ],
      ),
    );
  }
}
