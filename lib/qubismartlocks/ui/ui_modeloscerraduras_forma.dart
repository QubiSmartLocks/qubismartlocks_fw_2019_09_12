/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Modelos de Cerraduras
 [Qubi Smart Locks/Qubi Smart Locks/Modelos de Cerraduras]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIModelosCerradurasForma extends StatefulWidget {
  static const String ruta = '/ui-modeloscerraduras/forma';

  @override
  _UIModelosCerradurasFormaState createState() => _UIModelosCerradurasFormaState();
}

class _UIModelosCerradurasFormaState extends State<UIModelosCerradurasForma> {

  _nuevomodelocerradura() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIModeloCerraduraEdicion(registro: ModeloCerradura())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_MODELOSCERRADURAS_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_MODELOSCERRADURAS_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_MODELOSCERRADURAS_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_MODELOSCERRADURAS_TITULO],
      onTapAdd: _nuevomodelocerradura,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIModelosCerradurasLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevomodelocerradura),
        ],
      ),
    );
  }
}
