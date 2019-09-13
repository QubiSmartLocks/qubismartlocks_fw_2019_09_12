import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UILoginForm extends StatefulWidget {
  @override
  _UILoginFormState createState() => _UILoginFormState();
}

class _UILoginFormState extends State<UILoginForm> {
  final GlobalKey<FormState> _forma = GlobalKey<FormState>();

  String mensajeError = '';
  bool enLogin = false;

  bool _autovalidar = false;
  bool _formaEditada = false;

  Future<bool> _advertir() async {
    return await advertirDatosInvalidos(
        context, _forma.currentState, _formaEditada);
  }

  void _login() async {
    setState(() {
      enLogin = true;
    });
//    print('En LOGIN');
    final FormState forma = _forma.currentState;
    /*if (!forma.validate()) {
      _autovalidar = true; // Iniciar validación en cada cambio
      mensaje(DEM.anyScaffoldKey.currentState, Co.MENSAJE_CORREGIR_ERRORES);
    } else {
      forma.save();

      // Asignar los datos del mapa en Edición en la Sesión
      // al registro de Marcas en el widget
//      widget.registro.fromMap(DEM.mapaMarca);

      // Guardar Marcas
//      Marcas.guardarMarca(marca: null);
//      Navigator.of(DEM.scaffoldKey.currentContext).pop();
//      print('...haciendo el POST para LOGIN');
      try {
        Resultado resultado = await DEM.api.postRegistro(
        //    'login', DEM.mapaSesionUsuario);
        Map mensaje = resultado.objeto;
        if (resultado.estado == Co.OK) {
//          print('Todo bien???');
//          print(mensaje);
          DEM.mapaUsuario = mensaje['usuario'];
          DEM.usuario.fromMap(DEM.mapaUsuario);
//          print(DEM.usuario.nombreCompleto);
//          Mensaje(context, 'Bienvenid@ '+DEM.usuario.nombreCompleto);
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UIBusquedaReservas())).then((_){
            setState(() {});
          });
        } else {
          mensajeError = mensaje['mensaje'];
        //  MensajeError(context, mensajeError);
          setState(() {
            enLogin = false;
          });
        }
      }catch(e) {
        print('Error capturado en LOGIN ???');
        print(e);
      }
//      print('En LOGIN de nuevo');
//      print(resultado.mensaje);
//      print(resultado.estado);
//      print(resultado.objeto);
      setState(() {
        enLogin = false;
      });
    }*/
  }

  String _validarUsuario(String value) {
  /*  _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(SESIONESUSUARIOS.ETIQUETA_USUARIO);

    DEM.mapaSesionUsuario[SESIONESUSUARIOS.USUARIO] = value;
    return null;*/
  }

  String _validarID(String value) {
 /*   _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(SESIONESUSUARIOS.ETIQUETA_CONTRASEYA);

    DEM.mapaSesionUsuario[SESIONESUSUARIOS.CONTRASEYA] = value;
    return null;*/
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _forma,
      autovalidate: _autovalidar,
//      onWillPop: _advertir,
      child: Center(
        child: Container(
          color: Colors.blue,
          width: App.variables.calculeAnchoResponsive(context, .4, .8, .8, .8),
          margin: EdgeInsets.only(
              top: 0,
              left:
                  App.variables.calculeAnchoResponsive(context, 0, .1, .1, .1)),
          height: 400,  // TODO: Estaba en una función en app-variables: AltoFormaLogin() ???
          child: ListView(
//            itemExtent: 110,

            children: <Widget>[
              Center(
//                child: UICampo(
//                  //datos: DEM.mapaSesionUsuario,
//                  //tabla: SESIONESUSUARIOS.ENTIDAD,
//                  //campo: SESIONESUSUARIOS.USUARIO,
//                  //denominacion: SESIONESUSUARIOS.ETIQUETA_USUARIO,
//                  //etiqueta: SESIONESUSUARIOS.ETIQUETA_USUARIO,
//                  componente: Co.COMPONENTE_BD_EDICION_TEXTO,
//                  longitud: 50,
//                  validatorTexto: _validarUsuario,
//                  ancho: App.variables
//                      .calculeAnchoResponsive(context, .35, .75, .75, .75),
//                ),
//              ),
//              Center(
//                child: UICampo(
//                  //datos: DEM.mapaSesionUsuario,
//                  //tabla: SESIONESUSUARIOS.ENTIDAD,
//                  //campo: SESIONESUSUARIOS.CONTRASEYA,
//                  //denominacion: SESIONESUSUARIOS.ETIQUETA_CONTRASEYA,
//                  //etiqueta: SESIONESUSUARIOS.ETIQUETA_CONTRASEYA,
//                  componente: Co.COMPONENTE_BD_EDICION_TEXTO,
//                  longitud: 50,
//                  validatorTexto: _validarID,
//                  contraseya: true,
//                  ancho: App.variables
//                      .calculeAnchoResponsive(context, .35, .75, .75, .75),
//                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: UIBoton(
                  'Ingresar',
                  enLogin ? null : _login,
                  alto: 30,
                  ancho: 150,
                  margenes: EdgeInsets.only(top: 0, right: 90),
                ),
              ),
//              Center(
//                child: ,
//              )
            ],
          ),
        ),
      ),
    );
  }
}