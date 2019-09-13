/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Zonas en Edificaciones
 [Qubi Smart Locks/Qubi Smart Locks/Zonas en Edificaciones]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIZonasEdificacionesForma extends StatefulWidget {
  static const String ruta = '/ui-zonasedificaciones/forma';

  @override
  _UIZonasEdificacionesFormaState createState() => _UIZonasEdificacionesFormaState();
}

class _UIZonasEdificacionesFormaState extends State<UIZonasEdificacionesForma> {

  _nuevozonaedificacion() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIZonaEdificacionEdicion(registro: ZonaEdificacion())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_ZONASEDIFICACIONES_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_ZONASEDIFICACIONES_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_ZONASEDIFICACIONES_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_ZONASEDIFICACIONES_TITULO],
      onTapAdd: _nuevozonaedificacion,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIZonasEdificacionesLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevozonaedificacion),
        ],
      ),
    );
  }
}
