/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Modelos Campos
 [Modelos de Campos/Modelos de Campos/Modelos Campos]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIModelosCamposForma extends StatefulWidget {
  static const String ruta = '/ui-modeloscampos/forma';

  @override
  _UIModelosCamposFormaState createState() => _UIModelosCamposFormaState();
}

class _UIModelosCamposFormaState extends State<UIModelosCamposForma> {

  _nuevomodelocampo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIModeloCampoEdicion(registro: ModeloCampo())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_MODELOSCAMPOS_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_MODELOSCAMPOS_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_MODELOSCAMPOS_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_MODELOSCAMPOS_TITULO],
      onTapAdd: _nuevomodelocampo,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIModelosCamposLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevomodelocampo),
        ],
      ),
    );
  }
}
