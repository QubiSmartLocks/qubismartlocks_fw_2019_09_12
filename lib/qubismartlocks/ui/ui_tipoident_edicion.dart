// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Tipos de Identificación
// Edicion para [//Tipos de Identificación]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UITipoIdentEdicion extends StatefulWidget {
  UITipoIdentEdicion({Key key, this.registro}) : super(key: key);

  final TipoIdent registro;

  @override
  _EstadoTipoIdentEdicion createState() =>
      _EstadoTipoIdentEdicion();
}

class _EstadoTipoIdentEdicion extends State<UITipoIdentEdicion> {
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
      // al registro de TiposIdent en el widget
      widget.registro.fromMap(DEM.mapaTipoIdent);

      // Guardar TiposIdent
      Resultado _resultado =
          await TiposIdent.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar TiposIdent
      Resultado _resultado =
          await TiposIdent.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarDenomTipoIdent(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(TIPOSIDENT.ETIQUETA_DENOMTIPOIDENT);
    widget.registro.denomTipoIdent = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaTipoIdent = widget.registro.toMap();

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
// Campo: Denominación del Tipo de Identificación. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaTipoIdent,
              tabla: TIPOSIDENT.ETIQUETA_ENTIDAD,
              campo: TIPOSIDENT.DENOMTIPOIDENT,
              denominacion: TIPOSIDENT.ETIQUETA_DENOMTIPOIDENT,
              etiqueta: TIPOSIDENT.ETIQUETA_DENOMTIPOIDENT,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,

              validatorTexto: _validarDenomTipoIdent,

            ),
              // UICamposObligatorios(),
              UIBotonesGuardarBorrar(guardar: _guardar, borrar: widget.registro.id == 0 ? null : _borrar ),
            ],
          ),
        ),
    );
  }
}
