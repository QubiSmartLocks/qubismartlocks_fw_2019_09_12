// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Usuarios
// Edicion para [Seguridad/Seguridad/Usuarios]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FUsuariosEdicion extends StatefulWidget {
  FUsuariosEdicion({Key key, this.registro}) : super(key: key);

  final Usuario registro;

  @override
  _EstadoUsuariosEdicion createState() =>
      _EstadoUsuariosEdicion();
}

class _EstadoUsuariosEdicion extends State<FUsuariosEdicion> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _forma = GlobalKey<FormState>();

  bool _autovalidar = false;
  bool _formaEditada = false;

  void _guardar() async {
    final FormState forma = _forma.currentState;
    if (!forma.validate()) {
      _autovalidar = true; // Iniciar validación en cada cambio
      mensaje(_scaffoldKey.currentState, Co.MENSAJE_CORREGIR_ERRORES);
    } else {
      forma.save();

      // Asignar los datos del mapa en Edición en la Sesión
      // al registro de Usuarios en el widget
      widget.registro.fromMap(DEM.mapaUsuario);

      // Guardar Usuarios
      Resultado _resultado =
          await Usuarios.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar Usuarios
      Resultado _resultado =
          await Usuarios.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarNivelUsuario(int value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.nivelUsuario.id = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaUsuario = widget.registro.toMap();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_EDICION],
        title: Text(
          //USUARIOS.ETIQUETA_REGISTRO + Co.TITULO_ABRE +
              ((widget.registro.id == null) || (widget.registro.id == 0))
                  ? Co.VISTA_NUEVO_REGISTRO
                  : widget.registro.nombres,
          //    + Co.TITULO_CIERRA,
          style: estiloTituloPantalla,
        ),
        centerTitle: true,
        primary: true,
      ),
      body: Form(
          key: _forma,
          autovalidate: _autovalidar,
          onWillPop: () async {
            return await advertirDatosInvalidos(
                context, _forma.currentState, _formaEditada);
          },
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
// Campo: Nombres. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaUsuario,
              tabla: USUARIOS.ETIQUETA_ENTIDAD,
              campo: USUARIOS.NOMBRES,
              denominacion: USUARIOS.ETIQUETA_NOMBRES,
              etiqueta: USUARIOS.ETIQUETA_NOMBRES,
              componente: 'BDEdicion',
              longitud: 20,
              decimales: 0,


            ),
// Campo: Apellidos. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaUsuario,
              tabla: USUARIOS.ETIQUETA_ENTIDAD,
              campo: USUARIOS.APELLIDOS,
              denominacion: USUARIOS.ETIQUETA_APELLIDOS,
              etiqueta: USUARIOS.ETIQUETA_APELLIDOS,
              componente: 'BDEdicion',
              longitud: 20,
              decimales: 0,


            ),
// Campo: Correo Electrónico. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaUsuario,
              tabla: USUARIOS.ETIQUETA_ENTIDAD,
              campo: USUARIOS.CORREOELECTRONICO,
              denominacion: USUARIOS.ETIQUETA_CORREOELECTRONICO,
              etiqueta: USUARIOS.ETIQUETA_CORREOELECTRONICO,
              componente: 'BDEdicion',
              longitud: 50,
              decimales: 0,


            ),
// Campo: Celular. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaUsuario,
              tabla: USUARIOS.ETIQUETA_ENTIDAD,
              campo: USUARIOS.CELULAR,
              denominacion: USUARIOS.ETIQUETA_CELULAR,
              etiqueta: USUARIOS.ETIQUETA_CELULAR,
              componente: 'BDEdicion',
              longitud: 11,
              decimales: 0,


            ),
// Campo: Nivel de Usuario. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaUsuario,
              tabla: USUARIOS.ETIQUETA_ENTIDAD,
              campo: USUARIOS.NIVELUSUARIO,
              denominacion: USUARIOS.ETIQUETA_NIVELUSUARIO,
              etiqueta: USUARIOS.ETIQUETA_NIVELUSUARIO,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
              UIBotonesGuardarBorrar(guardar: _guardar, borrar: widget.registro.id == 0 ? null : _borrar ),
            ],
          ),
        ),
    );
  }
}
