/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Edificaciones -> Inicializar Edificación
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarEdificaciones {
  static init() async {
    int i = 1;
    Edificacion _edificacion;

    _edificacion = new Edificacion();
    _edificacion.id = i++;
    _edificacion.denomEdificacion = '';
    _edificacion.tipoEdificacion = DEM.listaTiposEdificaciones[0];
    _edificacion.direccion = '';
    _edificacion.ubicacionGPS = '';
    _edificacion.personaAdministradora = 0;
    _edificacion.propietario = DEM.listaPropietarios[0];
    // Guarda usando el API
//    await Edificaciones.guardar(_edificacion);
    // Guarda usando Firebase Realtime Database
//    await EdificacionesFB.guardarEdificacion(edificacion: _edificacion);
    DEM.listaEdificaciones.add(_edificacion);

  }
}
