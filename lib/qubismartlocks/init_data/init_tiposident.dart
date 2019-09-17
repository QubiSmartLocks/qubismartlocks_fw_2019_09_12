/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Tipos de Identificación -> Inicializar Tipo de Identificación
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarTiposIdent {
  static init() async {
    int i = 1;
    TipoIdent _tipoIdent;

    _tipoIdent = new TipoIdent();
    _tipoIdent.id = i++;
    _tipoIdent.denomTipoIdent = 'Cédula de Ciudadanía';
    // Guarda usando el API
//    await TiposIdent.guardar(_tipoIdent);
    // Guarda usando Firebase Realtime Database
//    await TiposIdentFB.guardarTipoIdent(tipoIdent: _tipoIdent);
    DEM.listaTiposIdent.add(_tipoIdent);

    _tipoIdent = new TipoIdent();
    _tipoIdent.id = i++;
    _tipoIdent.denomTipoIdent = 'Pasaporte';
    // Guarda usando el API
//    await TiposIdent.guardar(_tipoIdent);
    // Guarda usando Firebase Realtime Database
//    await TiposIdentFB.guardarTipoIdent(tipoIdent: _tipoIdent);
    DEM.listaTiposIdent.add(_tipoIdent);

    _tipoIdent = new TipoIdent();
    _tipoIdent.id = i++;
    _tipoIdent.denomTipoIdent = 'Cédula de Extranjería';
    // Guarda usando el API
//    await TiposIdent.guardar(_tipoIdent);
    // Guarda usando Firebase Realtime Database
//    await TiposIdentFB.guardarTipoIdent(tipoIdent: _tipoIdent);
    DEM.listaTiposIdent.add(_tipoIdent);

  }
}
