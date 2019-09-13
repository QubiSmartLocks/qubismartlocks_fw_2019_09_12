// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Propietarios
// Edicion para [Qubi Smart Locks/Qubi Smart Locks/Propietarios]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FPropietariosEdicion extends StatefulWidget {
  FPropietariosEdicion({Key key, this.registro}) : super(key: key);

  final Propietario registro;

  @override
  _EstadoPropietariosEdicion createState() =>
      _EstadoPropietariosEdicion();
}

class _EstadoPropietariosEdicion extends State<FPropietariosEdicion> {
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
      // al registro de Propietarios en el widget
      widget.registro.fromMap(DEM.mapaPropietario);

      // Guardar Propietarios
      Resultado _resultado =
          await Propietarios.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar Propietarios
      Resultado _resultado =
          await Propietarios.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarUsuario(int value) {
    _formaEditada = true;
    widget.registro.usuario = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaPropietario = widget.registro.toMap();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_EDICION],
        title: Text(
          //PROPIETARIOS.ETIQUETA_REGISTRO + Co.TITULO_ABRE +
              ((widget.registro.id == null) || (widget.registro.id == 0))
                  ? Co.VISTA_NUEVO_REGISTRO
                  : widget.registro.nombreCompletoPropietario,
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
// Campo: Nombre Completo del Propietario. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaPropietario,
              tabla: PROPIETARIOS.ETIQUETA_ENTIDAD,
              campo: PROPIETARIOS.NOMBRECOMPLETOPROPIETARIO,
              denominacion: PROPIETARIOS.ETIQUETA_NOMBRECOMPLETOPROPIETARIO,
              etiqueta: PROPIETARIOS.ETIQUETA_NOMBRECOMPLETOPROPIETARIO,
              componente: 'BDEdicion',
              longitud: 60,
              decimales: 0,


            ),
// Campo: Usuario. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaPropietario,
              tabla: PROPIETARIOS.ETIQUETA_ENTIDAD,
              campo: PROPIETARIOS.USUARIO,
              denominacion: PROPIETARIOS.ETIQUETA_USUARIO,
              etiqueta: PROPIETARIOS.ETIQUETA_USUARIO,
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
