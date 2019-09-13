/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Modelos Foráneos
 [Modelos de Campos/Modelos de Campos/Modelos Foráneos]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIModelosForaneosForma extends StatefulWidget {
  static const String ruta = '/ui-modelosforaneos/forma';

  @override
  _UIModelosForaneosFormaState createState() => _UIModelosForaneosFormaState();
}

class _UIModelosForaneosFormaState extends State<UIModelosForaneosForma> {

  _nuevomodeloforaneo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIModeloForaneoEdicion(registro: ModeloForaneo())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_MODELOSFORANEOS_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_MODELOSFORANEOS_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_MODELOSFORANEOS_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_MODELOSFORANEOS_TITULO],
      onTapAdd: _nuevomodeloforaneo,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIModelosForaneosLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevomodeloforaneo),
        ],
      ),
    );
  }
}
