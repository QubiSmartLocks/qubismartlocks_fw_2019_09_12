/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Zonas en Edificaciones -> Inicializar Zona en Edificación
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarZonasEdificaciones {
  static init() async {
    int i = 1;
    ZonaEdificacion _zonaEdificacion;

    _zonaEdificacion = new ZonaEdificacion();
    _zonaEdificacion.id = i++;
    _zonaEdificacion.edificacion = DEM.listaEdificaciones[0];
    _zonaEdificacion.denomZona = '';
    _zonaEdificacion.identZona = '';
    _zonaEdificacion.personaAdministradora = 0;
    // Guarda usando el API
//    await ZonasEdificaciones.guardar(_zonaEdificacion);
    // Guarda usando Firebase Realtime Database
//    await ZonasEdificacionesFB.guardarZonaEdificacion(zonaEdificacion: _zonaEdificacion);
    DEM.listaZonasEdificaciones.add(_zonaEdificacion);

  }
}
