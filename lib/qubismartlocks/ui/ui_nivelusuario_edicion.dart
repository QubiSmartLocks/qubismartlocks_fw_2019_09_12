// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Niveles de Usuarios
// Edicion para [//Niveles de Usuarios]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UINivelUsuarioEdicion extends StatefulWidget {
  UINivelUsuarioEdicion({Key key, this.registro}) : super(key: key);

  final NivelUsuario registro;

  @override
  _EstadoNivelUsuarioEdicion createState() =>
      _EstadoNivelUsuarioEdicion();
}

class _EstadoNivelUsuarioEdicion extends State<UINivelUsuarioEdicion> {
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
      // al registro de NivelesUsuarios en el widget
      widget.registro.fromMap(DEM.mapaNivelUsuario);

      // Guardar NivelesUsuarios
      Resultado _resultado =
          await NivelesUsuarios.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar NivelesUsuarios
      Resultado _resultado =
          await NivelesUsuarios.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarDenomNivelUsuario(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(NIVELESUSUARIOS.ETIQUETA_DENOMNIVELUSUARIO);
    widget.registro.denomNivelUsuario = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaNivelUsuario = widget.registro.toMap();

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
// Campo: Denominación del Nivel de Usuario. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaNivelUsuario,
              tabla: NIVELESUSUARIOS.ETIQUETA_ENTIDAD,
              campo: NIVELESUSUARIOS.DENOMNIVELUSUARIO,
              denominacion: NIVELESUSUARIOS.ETIQUETA_DENOMNIVELUSUARIO,
              etiqueta: NIVELESUSUARIOS.ETIQUETA_DENOMNIVELUSUARIO,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,

              validatorTexto: _validarDenomNivelUsuario,

            ),
// Campo: Detalle de Niveles. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaNivelUsuario,
              tabla: NIVELESUSUARIOS.ETIQUETA_ENTIDAD,
              campo: NIVELESUSUARIOS.DETNIVELES,
              denominacion: NIVELESUSUARIOS.ETIQUETA_DETNIVELES,
              etiqueta: NIVELESUSUARIOS.ETIQUETA_DETNIVELES,
              componente: 'BDEdicion',
              longitud: 4096,
              decimales: 0,


            ),
              // UICamposObligatorios(),
              UIBotonesGuardarBorrar(guardar: _guardar, borrar: widget.registro.id == 0 ? null : _borrar ),
            ],
          ),
        ),
    );
  }
}
