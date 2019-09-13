/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Históricos de Cerraduras
 [Qubi Smart Locks/Qubi Smart Locks/Históricos de Cerraduras]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIHistoricosCerradurasForma extends StatefulWidget {
  static const String ruta = '/ui-historicoscerraduras/forma';

  @override
  _UIHistoricosCerradurasFormaState createState() => _UIHistoricosCerradurasFormaState();
}

class _UIHistoricosCerradurasFormaState extends State<UIHistoricosCerradurasForma> {

  _nuevohistoricocerradura() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIHistoricoCerraduraEdicion(registro: HistoricoCerradura())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_HISTORICOSCERRADURAS_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_HISTORICOSCERRADURAS_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_HISTORICOSCERRADURAS_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_HISTORICOSCERRADURAS_TITULO],
      onTapAdd: _nuevohistoricocerradura,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIHistoricosCerradurasLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevohistoricocerradura),
        ],
      ),
    );
  }
}
