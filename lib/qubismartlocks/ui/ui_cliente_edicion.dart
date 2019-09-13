// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Clientes
// Edicion para [//Clientes]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIClienteEdicion extends StatefulWidget {
  UIClienteEdicion({Key key, this.registro}) : super(key: key);

  final Cliente registro;

  @override
  _EstadoClienteEdicion createState() =>
      _EstadoClienteEdicion();
}

class _EstadoClienteEdicion extends State<UIClienteEdicion> {
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
      // al registro de Clientes en el widget
      widget.registro.fromMap(DEM.mapaCliente);

      // Guardar Clientes
      Resultado _resultado =
          await Clientes.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar Clientes
      Resultado _resultado =
          await Clientes.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarTipoIdent(TipoIdent value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.tipoIdent.id = value;
    return null;
  }

  String _validarDocIdent(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(CLIENTES.ETIQUETA_DOCIDENT);
    widget.registro.docIdent = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaCliente = widget.registro.toMap();

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
// Campo: Nombres. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaCliente,
              tabla: CLIENTES.ETIQUETA_ENTIDAD,
              campo: CLIENTES.NOMBRES,
              denominacion: CLIENTES.ETIQUETA_NOMBRES,
              etiqueta: CLIENTES.ETIQUETA_NOMBRES,
              componente: 'BDEdicion',
              longitud: 60,
              decimales: 0,


            ),
// Campo: Apellidos. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaCliente,
              tabla: CLIENTES.ETIQUETA_ENTIDAD,
              campo: CLIENTES.APELLIDOS,
              denominacion: CLIENTES.ETIQUETA_APELLIDOS,
              etiqueta: CLIENTES.ETIQUETA_APELLIDOS,
              componente: 'BDEdicion',
              longitud: 60,
              decimales: 0,


            ),
// Campo: Tipo de Identificación. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaCliente,
              tabla: CLIENTES.ETIQUETA_ENTIDAD,
              campo: CLIENTES.TIPOIDENT,
              denominacion: CLIENTES.ETIQUETA_TIPOIDENT,
              etiqueta: CLIENTES.ETIQUETA_TIPOIDENT,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Documento de Identificación. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaCliente,
              tabla: CLIENTES.ETIQUETA_ENTIDAD,
              campo: CLIENTES.DOCIDENT,
              denominacion: CLIENTES.ETIQUETA_DOCIDENT,
              etiqueta: CLIENTES.ETIQUETA_DOCIDENT,
              componente: 'BDEdicion',
              longitud: 12,
              decimales: 0,

              validatorTexto: _validarDocIdent,

            ),
// Campo: Teléfono. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaCliente,
              tabla: CLIENTES.ETIQUETA_ENTIDAD,
              campo: CLIENTES.TELEFONO,
              denominacion: CLIENTES.ETIQUETA_TELEFONO,
              etiqueta: CLIENTES.ETIQUETA_TELEFONO,
              componente: 'BDEdicion',
              longitud: 15,
              decimales: 0,


            ),
// Campo: Correo Electrónico. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaCliente,
              tabla: CLIENTES.ETIQUETA_ENTIDAD,
              campo: CLIENTES.CORREOELECTRONICO,
              denominacion: CLIENTES.ETIQUETA_CORREOELECTRONICO,
              etiqueta: CLIENTES.ETIQUETA_CORREOELECTRONICO,
              componente: 'BDEdicion',
              longitud: 50,
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
