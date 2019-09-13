/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Tipos de Identificación
 [Qubi Smart Locks/Qubi Smart Locks/Tipos de Identificación]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UITipIdentForma extends StatefulWidget {
  static const String ruta = '/ui-tipident/forma';

  @override
  _UITipIdentFormaState createState() => _UITipIdentFormaState();
}

class _UITipIdentFormaState extends State<UITipIdentForma> {

  _nuevotipoident() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UITipoIdentEdicion(registro: TipoIdent())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_TIPOSIDENT_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_TIPOSIDENT_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_TIPOSIDENT_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_TIPOSIDENT_TITULO],
      onTapAdd: _nuevotipoident,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UITiposIdentLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevotipoident),
        ],
      ),
    );
  }
}
