// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Orígenes de Paquetes
// Edicion para [Qubi Smart Locks/Qubi Smart Locks/Orígenes de Paquetes]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FOrigenesPaquetesEdicion extends StatefulWidget {
  FOrigenesPaquetesEdicion({Key key, this.registro}) : super(key: key);

  final OrigenPaquete registro;

  @override
  _EstadoOrigenesPaquetesEdicion createState() =>
      _EstadoOrigenesPaquetesEdicion();
}

class _EstadoOrigenesPaquetesEdicion extends State<FOrigenesPaquetesEdicion> {
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
      // al registro de OrigenesPaquetes en el widget
      widget.registro.fromMap(DEM.mapaOrigenPaquete);

      // Guardar OrigenesPaquetes
      Resultado _resultado =
          await OrigenesPaquetes.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar OrigenesPaquetes
      Resultado _resultado =
          await OrigenesPaquetes.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarDenomOrigenPaquete(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(ORIGENESPAQUETES.ETIQUETA_DENOMORIGENPAQUETE);
    widget.registro.denomOrigenPaquete = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaOrigenPaquete = widget.registro.toMap();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_EDICION],
        title: Text(
          //ORIGENESPAQUETES.ETIQUETA_REGISTRO + Co.TITULO_ABRE +
              ((widget.registro.id == null) || (widget.registro.id == 0))
                  ? Co.VISTA_NUEVO_REGISTRO
                  : widget.registro.denomOrigenPaquete,
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
// Campo: Denominación del Orígen de Paquete. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaOrigenPaquete,
              tabla: ORIGENESPAQUETES.ETIQUETA_ENTIDAD,
              campo: ORIGENESPAQUETES.DENOMORIGENPAQUETE,
              denominacion: ORIGENESPAQUETES.ETIQUETA_DENOMORIGENPAQUETE,
              etiqueta: ORIGENESPAQUETES.ETIQUETA_DENOMORIGENPAQUETE,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,

              validatorTexto: _validarDenomOrigenPaquete,

            ),
              // UICamposObligatorios(),
              UIBotonesGuardarBorrar(guardar: _guardar, borrar: widget.registro.id == 0 ? null : _borrar ),
            ],
          ),
        ),
    );
  }
}
