// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Propietarios
// Edicion para [//Propietarios]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIPropietarioEdicion extends StatefulWidget {
  UIPropietarioEdicion({Key key, this.registro}) : super(key: key);

  final Propietario registro;

  @override
  _EstadoPropietarioEdicion createState() =>
      _EstadoPropietarioEdicion();
}

class _EstadoPropietarioEdicion extends State<UIPropietarioEdicion> {
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

    return Container(
    width: CD.ancho *.5,
        height: CD.alto * .5,
        child: Form(
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
