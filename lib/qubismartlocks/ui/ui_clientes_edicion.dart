// Proyecto: Qubi Smart Locks
// Version: 0.0.2
// Autor: Abner Hernández
// Unidad: Edicion de Clientes
// Edicion para [Qubi Smart Locks/Qubi Smart Locks/Clientes]

import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UIClientesEdicion extends StatefulWidget {
  UIClientesEdicion({Key key, this.registro}) : super(key: key);

  final Cliente registro;

  @override
  _EstadoClientesEdicion createState() => _EstadoClientesEdicion();
}

class _EstadoClientesEdicion extends State<UIClientesEdicion> {
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
      Resultado _resultado = await Clientes.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar Clientes
    Resultado _resultado = await Clientes.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarTipoIdent(int value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.tipoIdent.id = value;
    return null;
  }

  String _validarDocIdent(String value) {
    _formaEditada = true;
    if (value.isEmpty) return campoObligatorio(CLIENTES.ETIQUETA_DOCIDENT);
    widget.registro.docIdent = value;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var anchoC = 800.0;
    DEM.mapaCliente = widget.registro.toMap();

    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  UILaterales(),
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * .9,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width * .9,
                            child: Image.asset(
                              AppRes.appResMap[Co.BACKGROUND_SCREEN],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Center(
                          child: Card(
                            color: AppRes.appResMap[Co.FONDO_1],
                            elevation: 3,
                            child: Container(
                              width: anchoC,
                              height: 500,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                              ),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 25, bottom: 15),
                                      width: 80,
                                      height: 80,
                                      child: Container(
                                        child: Image.asset(
                                            'images/web_qubi_pasajeros.png'),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      child: Text(
                                        'Clientes',
                                        style:
                                            AppRes.appResMap[Co.ESTILO_TITULO],
                                      ),
                                    ),
                                    //--
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 10, left: 10, right: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: // Campo: Tipo de Identificación. Tipo de Componente: BDBusquedaCombo
                                                UICosa(),
//                                                Expanded(
//                                                  child: UICampo(
//                                                    ancho: 350,
//                                                    alto: 45,
//                                                    datos: DEM.mapaCliente,
//                                                    tabla: CLIENTES.ETIQUETA_ENTIDAD,
//                                                    campo: CLIENTES.TIPOIDENT,
//                                                    denominacion: CLIENTES.ETIQUETA_TIPOIDENT,
//                                                    etiqueta: CLIENTES.ETIQUETA_TIPOIDENT,
//                                                    componente: 'BDBusquedaCombo',
//                                                    longitud: 0,
//                                                    decimales: 0,
//                                                  ),
//                                                ),,
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: UICampo(
                                              ancho: 350,
                                              alto: 45,
                                              datos: DEM.mapaCliente,
                                              tabla: CLIENTES.ETIQUETA_ENTIDAD,
                                              campo: CLIENTES.DOCIDENT,
                                              denominacion:
                                                  CLIENTES.ETIQUETA_DOCIDENT,
                                              etiqueta:
                                                  CLIENTES.ETIQUETA_DOCIDENT,
                                              componente: 'BDEdicion',
                                              longitud: 12,
                                              decimales: 0,
                                              //validatorTexto: _validarDocIdent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 10, left: 10, right: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: UICampo(
                                              ancho: 350,
                                              alto: 45,
                                              datos: DEM.mapaCliente,
                                              tabla: CLIENTES.ETIQUETA_ENTIDAD,
                                              campo: CLIENTES.TELEFONO,
                                              denominacion:
                                                  CLIENTES.ETIQUETA_TELEFONO,
                                              etiqueta:
                                                  CLIENTES.ETIQUETA_TELEFONO,
                                              componente: 'BDEdicion',
                                              longitud: 15,
                                              decimales: 0,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: UICampo(
                                              ancho: 350,
                                              alto: 45,
                                              datos: DEM.mapaCliente,
                                              tabla: CLIENTES.ETIQUETA_ENTIDAD,
                                              campo: CLIENTES.CORREOELECTRONICO,
                                              denominacion: CLIENTES
                                                  .ETIQUETA_CORREOELECTRONICO,
                                              etiqueta: CLIENTES
                                                  .ETIQUETA_CORREOELECTRONICO,
                                              componente: 'BDEdicion',
                                              longitud: 50,
                                              decimales: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    //--
                                    Container(
                                      // var anchoC = 800.0;
                                      width: anchoC - 50,
                                      child: UIBGB(
                                          guardar: _guardar,
                                          borrar: widget.registro.id == 0
                                              ? null
                                              : _borrar),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  UILaterales(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
