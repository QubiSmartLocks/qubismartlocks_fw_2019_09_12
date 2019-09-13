/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Usuarios
 [Seguridad/Seguridad/Usuarios]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIUsuariosForma extends StatefulWidget {
  static const String ruta = '/ui-usuarios/forma';

  @override
  _UIUsuariosFormaState createState() => _UIUsuariosFormaState();
}

class _UIUsuariosFormaState extends State<UIUsuariosForma> {

  _nuevousuario() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIUsuarioEdicion(registro: Usuario())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_USUARIOS_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_USUARIOS_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_USUARIOS_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_USUARIOS_TITULO],
      onTapAdd: _nuevousuario,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIUsuariosLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevousuario),
        ],
      ),
    );
  }
}
