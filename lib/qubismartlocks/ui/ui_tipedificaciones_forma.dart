/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Tipos de Edificaciones
 [Qubi Smart Locks/Qubi Smart Locks/Tipos de Edificaciones]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UITipEdificacionesForma extends StatefulWidget {
  static const String ruta = '/ui-tipedificaciones/forma';

  @override
  _UITipEdificacionesFormaState createState() => _UITipEdificacionesFormaState();
}

class _UITipEdificacionesFormaState extends State<UITipEdificacionesForma> {

  _nuevotipoedificacion() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UITipoEdificacionEdicion(registro: TipoEdificacion())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_TIPOSEDIFICACIONES_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_TIPOSEDIFICACIONES_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_TIPOSEDIFICACIONES_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_TIPOSEDIFICACIONES_TITULO],
      onTapAdd: _nuevotipoedificacion,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UITiposEdificacionesLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevotipoedificacion),
        ],
      ),
    );
  }
}
