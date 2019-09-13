/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Niveles de Usuarios
 [Seguridad/Seguridad/Niveles de Usuarios]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UINivelesUsuariosForma extends StatefulWidget {
  static const String ruta = '/ui-nivelesusuarios/forma';

  @override
  _UINivelesUsuariosFormaState createState() => _UINivelesUsuariosFormaState();
}

class _UINivelesUsuariosFormaState extends State<UINivelesUsuariosForma> {

  _nuevonivelusuario() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UINivelUsuarioEdicion(registro: NivelUsuario())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_NIVELESUSUARIOS_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_NIVELESUSUARIOS_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_NIVELESUSUARIOS_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_NIVELESUSUARIOS_TITULO],
      onTapAdd: _nuevonivelusuario,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UINivelesUsuariosLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevonivelusuario),
        ],
      ),
    );
  }
}
