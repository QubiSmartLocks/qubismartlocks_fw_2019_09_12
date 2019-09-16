/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Usuarios -> Inicializar Usuario
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarUsuarios {
  static init() async {
    int i = 1;
    Usuario _usuario;

    _usuario = new Usuario();
    _usuario.id = i++;
    _usuario.nombres = '';
    _usuario.apellidos = '';
    _usuario.correoElectronico = '';
    _usuario.celular = '';
    _usuario.nivelUsuario = DEM.listaNivelesUsuarios[0];
    // Guarda usando el API
//    await Usuarios.guardar(_usuario);
    // Guarda usando Firebase Realtime Database
//    await UsuariosFB.guardarUsuario(usuario: _usuario);
    DEM.listaUsuarios.add(_usuario);

  }
}
