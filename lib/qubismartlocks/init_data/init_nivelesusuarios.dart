/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Niveles de Usuarios -> Inicializar Nivel de Usuario
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarNivelesUsuarios {
  static init() async {
    int i = 1;
    NivelUsuario _nivelUsuario;

    _nivelUsuario = new NivelUsuario();
    _nivelUsuario.id = i++;
    _nivelUsuario.denomNivelUsuario = '';
    _nivelUsuario.detNiveles = '';
    // Guarda usando el API
//    await NivelesUsuarios.guardar(_nivelUsuario);
    // Guarda usando Firebase Realtime Database
//    await NivelesUsuariosFB.guardarNivelUsuario(nivelUsuario: _nivelUsuario);
    DEM.listaNivelesUsuarios.add(_nivelUsuario);

  }
}
