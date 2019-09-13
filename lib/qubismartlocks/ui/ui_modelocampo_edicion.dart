// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Modelos Campos
// Edicion para [//Modelos Campos]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIModeloCampoEdicion extends StatefulWidget {
  UIModeloCampoEdicion({Key key, this.registro}) : super(key: key);

  final ModeloCampo registro;

  @override
  _EstadoModeloCampoEdicion createState() =>
      _EstadoModeloCampoEdicion();
}

class _EstadoModeloCampoEdicion extends State<UIModeloCampoEdicion> {
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
      // al registro de ModelosCampos en el widget
      widget.registro.fromMap(DEM.mapaModeloCampo);

      // Guardar ModelosCampos
      Resultado _resultado =
          await ModelosCampos.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar ModelosCampos
      Resultado _resultado =
          await ModelosCampos.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarDenomModelo(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(MODELOSCAMPOS.ETIQUETA_DENOMMODELO);
    widget.registro.denomModelo = value;
    return null;
  }

  String _validarEntero(int value) {
    _formaEditada = true;
    widget.registro.entero = value;
    return null;
  }

  String _validarLogico(bool value) {
    _formaEditada = true;
    widget.registro.logico = value;
    return null;
  }

  String _validarModeloForaneo(ModeloForaneo value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.modeloForaneo.id = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaModeloCampo = widget.registro.toMap();

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
// Campo: Denominación del Modelo. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaModeloCampo,
              tabla: MODELOSCAMPOS.ETIQUETA_ENTIDAD,
              campo: MODELOSCAMPOS.DENOMMODELO,
              denominacion: MODELOSCAMPOS.ETIQUETA_DENOMMODELO,
              etiqueta: MODELOSCAMPOS.ETIQUETA_DENOMMODELO,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,

              validatorTexto: _validarDenomModelo,

            ),
// Campo: Descripción del Modelo. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaModeloCampo,
              tabla: MODELOSCAMPOS.ETIQUETA_ENTIDAD,
              campo: MODELOSCAMPOS.DESCMODELO,
              denominacion: MODELOSCAMPOS.ETIQUETA_DESCMODELO,
              etiqueta: MODELOSCAMPOS.ETIQUETA_DESCMODELO,
              componente: 'BDEdicion',
              longitud: 4096,
              decimales: 0,


            ),
// Campo: Fecha. Tipo de Componente: BDEdicionFecha
            UICampo(
              datos: DEM.mapaModeloCampo,
              tabla: MODELOSCAMPOS.ETIQUETA_ENTIDAD,
              campo: MODELOSCAMPOS.FECHA,
              denominacion: MODELOSCAMPOS.ETIQUETA_FECHA,
              etiqueta: MODELOSCAMPOS.ETIQUETA_FECHA,
              componente: 'BDEdicionFecha',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Hora. Tipo de Componente: BDEdicionHora
            UICampo(
              datos: DEM.mapaModeloCampo,
              tabla: MODELOSCAMPOS.ETIQUETA_ENTIDAD,
              campo: MODELOSCAMPOS.HORA,
              denominacion: MODELOSCAMPOS.ETIQUETA_HORA,
              etiqueta: MODELOSCAMPOS.ETIQUETA_HORA,
              componente: 'BDEdicionHora',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Entero. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaModeloCampo,
              tabla: MODELOSCAMPOS.ETIQUETA_ENTIDAD,
              campo: MODELOSCAMPOS.ENTERO,
              denominacion: MODELOSCAMPOS.ETIQUETA_ENTERO,
              etiqueta: MODELOSCAMPOS.ETIQUETA_ENTERO,
              componente: 'BDEdicionNumero',
              longitud: 12,
              decimales: 0,


            ),
// Campo: Entero Grande. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaModeloCampo,
              tabla: MODELOSCAMPOS.ETIQUETA_ENTIDAD,
              campo: MODELOSCAMPOS.ENTEROGRANDE,
              denominacion: MODELOSCAMPOS.ETIQUETA_ENTEROGRANDE,
              etiqueta: MODELOSCAMPOS.ETIQUETA_ENTEROGRANDE,
              componente: 'BDEdicionNumero',
              longitud: 12,
              decimales: 0,


            ),
// Campo: Entero Pequeño. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaModeloCampo,
              tabla: MODELOSCAMPOS.ETIQUETA_ENTIDAD,
              campo: MODELOSCAMPOS.ENTEROPEQUEYO,
              denominacion: MODELOSCAMPOS.ETIQUETA_ENTEROPEQUEYO,
              etiqueta: MODELOSCAMPOS.ETIQUETA_ENTEROPEQUEYO,
              componente: 'BDEdicion',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Decimal. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaModeloCampo,
              tabla: MODELOSCAMPOS.ETIQUETA_ENTIDAD,
              campo: MODELOSCAMPOS.DECIMAL,
              denominacion: MODELOSCAMPOS.ETIQUETA_DECIMAL,
              etiqueta: MODELOSCAMPOS.ETIQUETA_DECIMAL,
              componente: 'BDEdicion',
              longitud: 18,
              decimales: 14,


            ),
// Campo: Moneda. Tipo de Componente: BDEdicionMoneda
            UICampo(
              datos: DEM.mapaModeloCampo,
              tabla: MODELOSCAMPOS.ETIQUETA_ENTIDAD,
              campo: MODELOSCAMPOS.MONEDA,
              denominacion: MODELOSCAMPOS.ETIQUETA_MONEDA,
              etiqueta: MODELOSCAMPOS.ETIQUETA_MONEDA,
              componente: 'BDEdicionMoneda',
              longitud: 18,
              decimales: 2,


            ),
// Campo: Lógico. Tipo de Componente: BDChequeo
            UICampo(
              datos: DEM.mapaModeloCampo,
              tabla: MODELOSCAMPOS.ETIQUETA_ENTIDAD,
              campo: MODELOSCAMPOS.LOGICO,
              denominacion: MODELOSCAMPOS.ETIQUETA_LOGICO,
              etiqueta: MODELOSCAMPOS.ETIQUETA_LOGICO,
              componente: 'BDChequeo',
              longitud: 1,
              decimales: 0,


            ),
// Campo: Ubicación GPS. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaModeloCampo,
              tabla: MODELOSCAMPOS.ETIQUETA_ENTIDAD,
              campo: MODELOSCAMPOS.UBICACIONGPS,
              denominacion: MODELOSCAMPOS.ETIQUETA_UBICACIONGPS,
              etiqueta: MODELOSCAMPOS.ETIQUETA_UBICACIONGPS,
              componente: 'BDEdicion',
              longitud: 30,
              decimales: 0,


            ),
// Campo: Imagen. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaModeloCampo,
              tabla: MODELOSCAMPOS.ETIQUETA_ENTIDAD,
              campo: MODELOSCAMPOS.IMAGEN,
              denominacion: MODELOSCAMPOS.ETIQUETA_IMAGEN,
              etiqueta: MODELOSCAMPOS.ETIQUETA_IMAGEN,
              componente: 'BDEdicion',
              longitud: 20,
              decimales: 0,


            ),
// Campo: Modelo Foraneo. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaModeloCampo,
              tabla: MODELOSCAMPOS.ETIQUETA_ENTIDAD,
              campo: MODELOSCAMPOS.MODELOFORANEO,
              denominacion: MODELOSCAMPOS.ETIQUETA_MODELOFORANEO,
              etiqueta: MODELOSCAMPOS.ETIQUETA_MODELOFORANEO,
              componente: 'BDBusquedaCombo',
              longitud: 0,
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
