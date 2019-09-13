// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: iniciar-sesion.dart
// Iniciar Sesion

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class IniciarSesion extends StatefulWidget {
  @override
  _IniciarSesionState createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {

  void sesionIniciada() async {
//    print('Sesión iniciada como '+Sesion.usuarioFire.correoelectronico);
  }

  void usuarioNuevo() async {
//    print('Usuario NUEVO '+Sesion.usuarioFire.correoelectronico);

// Inicializar Datos básicos para funcionamiento preliminar
//    DEM.usuarioFire2Usuario(Sesion.usuarioFire);
//    DEM.usuario.es = 'EsGestor'; // TODO: por defecto ??? Debería ser Socio???
//    await Usuarios.guardarUsuario(usuario: DEM.usuario);

//    DEM.gestor.key = DEM.usuario.key;
//    await Personas.guardarPersona(persona: DEM.gestor);

  }

  @override
  void initState() {
    DEM.cerrarSesionEnMemoria();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.variables.calcular(context);

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
//
        UIBackground(),
//
//        UIIniciarSesion(usuarioRegistrado: usuarioNuevo, sesionIniciada: sesionIniciada,),
//
      ],
    );
  }
}
