/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Unidades Funcionales
 [Qubi Smart Locks/Qubi Smart Locks/Unidades Funcionales]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIUnidadesFuncionalesForma extends StatefulWidget {
  static const String ruta = '/ui-unidadesfuncionales/forma';

  @override
  _UIUnidadesFuncionalesFormaState createState() => _UIUnidadesFuncionalesFormaState();
}

class _UIUnidadesFuncionalesFormaState extends State<UIUnidadesFuncionalesForma> {

  _nuevounidadfuncional() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIUnidadFuncionalEdicion(registro: UnidadFuncional())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_UNIDADESFUNCIONALES_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_UNIDADESFUNCIONALES_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_UNIDADESFUNCIONALES_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_UNIDADESFUNCIONALES_TITULO],
      onTapAdd: _nuevounidadfuncional,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIUnidadesFuncionalesLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevounidadfuncional),
        ],
      ),
    );
  }
}
