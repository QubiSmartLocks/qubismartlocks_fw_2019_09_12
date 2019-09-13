/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Propietarios
 [Qubi Smart Locks/Qubi Smart Locks/Propietarios]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIPropietariosForma extends StatefulWidget {
  static const String ruta = '/ui-propietarios/forma';

  @override
  _UIPropietariosFormaState createState() => _UIPropietariosFormaState();
}

class _UIPropietariosFormaState extends State<UIPropietariosForma> {

  _nuevopropietario() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIPropietarioEdicion(registro: Propietario())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_PROPIETARIOS_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_PROPIETARIOS_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_PROPIETARIOS_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_PROPIETARIOS_TITULO],
      onTapAdd: _nuevopropietario,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIPropietariosLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevopropietario),
        ],
      ),
    );
  }
}
