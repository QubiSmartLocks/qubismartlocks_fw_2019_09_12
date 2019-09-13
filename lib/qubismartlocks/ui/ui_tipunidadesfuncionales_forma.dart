/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Tipos de Unidades Funcionales
 [Qubi Smart Locks/Qubi Smart Locks/Tipos de Unidades Funcionales]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UITipUnidadesFuncionalesForma extends StatefulWidget {
  static const String ruta = '/ui-tipunidadesfuncionales/forma';

  @override
  _UITipUnidadesFuncionalesFormaState createState() => _UITipUnidadesFuncionalesFormaState();
}

class _UITipUnidadesFuncionalesFormaState extends State<UITipUnidadesFuncionalesForma> {

  _nuevotipounidadfuncional() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UITipoUnidadFuncionalEdicion(registro: TipoUnidadFuncional())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_TIPUNIDADESFUNCIONALES_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_TIPUNIDADESFUNCIONALES_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_TIPUNIDADESFUNCIONALES_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_TIPUNIDADESFUNCIONALES_TITULO],
      onTapAdd: _nuevotipounidadfuncional,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UITipUnidadesFuncionalesLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevotipounidadfuncional),
        ],
      ),
    );
  }
}
