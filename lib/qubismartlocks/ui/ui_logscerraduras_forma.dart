/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Logs de Cerraduras
 [Qubi Smart Locks/Qubi Smart Locks/Logs de Cerraduras]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UILogsCerradurasForma extends StatefulWidget {
  static const String ruta = '/ui-logscerraduras/forma';

  @override
  _UILogsCerradurasFormaState createState() => _UILogsCerradurasFormaState();
}

class _UILogsCerradurasFormaState extends State<UILogsCerradurasForma> {

  _nuevologcerradura() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UILogCerraduraEdicion(registro: LogCerradura())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_LOGSCERRADURAS_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_LOGSCERRADURAS_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_LOGSCERRADURAS_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_LOGSCERRADURAS_TITULO],
      onTapAdd: _nuevologcerradura,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UILogsCerradurasLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevologcerradura),
        ],
      ),
    );
  }
}
