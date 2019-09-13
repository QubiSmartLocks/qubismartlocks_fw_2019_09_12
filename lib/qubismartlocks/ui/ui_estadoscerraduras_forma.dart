/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Estados de Cerraduras
 [Qubi Smart Locks/Qubi Smart Locks/Estados de Cerraduras]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIEstadosCerradurasForma extends StatefulWidget {
  static const String ruta = '/ui-estadoscerraduras/forma';

  @override
  _UIEstadosCerradurasFormaState createState() => _UIEstadosCerradurasFormaState();
}

class _UIEstadosCerradurasFormaState extends State<UIEstadosCerradurasForma> {

  _nuevoestadocerradura() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIEstadoCerraduraEdicion(registro: EstadoCerradura())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_ESTADOSCERRADURAS_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_ESTADOSCERRADURAS_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_ESTADOSCERRADURAS_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_ESTADOSCERRADURAS_TITULO],
      onTapAdd: _nuevoestadocerradura,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIEstadosCerradurasLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevoestadocerradura),
        ],
      ),
    );
  }
}
