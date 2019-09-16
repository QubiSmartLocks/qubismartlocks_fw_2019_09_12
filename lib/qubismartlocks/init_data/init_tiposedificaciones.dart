/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Tipos de Edificaciones -> Inicializar Tipo de Edificación
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarTiposEdificaciones {
  static init() async {
    int i = 1;
    TipoEdificacion _tipoEdificacion;

    _tipoEdificacion = new TipoEdificacion();
    _tipoEdificacion.id = i++;
    _tipoEdificacion.denomTipoEdificacion = '';
    _tipoEdificacion.descTipoEdificacion = '';
    _tipoEdificacion.seZonifica = false;
    _tipoEdificacion.tieneMultiplesUnidadesFuncionales = false;
    // Guarda usando el API
//    await TiposEdificaciones.guardar(_tipoEdificacion);
    // Guarda usando Firebase Realtime Database
//    await TiposEdificacionesFB.guardarTipoEdificacion(tipoEdificacion: _tipoEdificacion);
    DEM.listaTiposEdificaciones.add(_tipoEdificacion);

  }
}
