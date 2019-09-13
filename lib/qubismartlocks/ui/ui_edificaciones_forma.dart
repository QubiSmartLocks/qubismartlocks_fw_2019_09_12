/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Edificaciones
 [Qubi Smart Locks/Qubi Smart Locks/Edificaciones]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIEdificacionesForma extends StatefulWidget {
  static const String ruta = '/ui-edificaciones/forma';

  @override
  _UIEdificacionesFormaState createState() => _UIEdificacionesFormaState();
}

class _UIEdificacionesFormaState extends State<UIEdificacionesForma> {

  _nuevoedificacion() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIEdificacionEdicion(registro: Edificacion())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_EDIFICACIONES_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_EDIFICACIONES_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_EDIFICACIONES_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_EDIFICACIONES_TITULO],
      onTapAdd: _nuevoedificacion,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIEdificacionesLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevoedificacion),
        ],
      ),
    );
  }
}
