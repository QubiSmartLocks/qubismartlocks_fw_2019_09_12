import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UIBusquedaReservasForm extends StatefulWidget {
  @override
  _UIBusquedaReservasFormState createState() => _UIBusquedaReservasFormState();
}

class _UIBusquedaReservasFormState extends State<UIBusquedaReservasForm> {
  final GlobalKey<FormState> _forma = GlobalKey<FormState>();

  final _controller = TextEditingController();

  String mensajeError = '';
  bool enLogin = false;

  bool _autovalidar = false;
  bool _formaEditada = false;

  bool enBuscar = false;

  _buscar() async {
    if (DEM.mapaBusquedaReservas['buscar'] == '') {
      return;
    }
    print('Solicitando a getOnly...');

    Resultado resultado;
    String buscar = DEM.mapaBusquedaReservas['buscar'];
//    if (buscar.contains('-') | buscar.contains('/')) {
//      resultado = await Reservaciones.getOnly(DEM.listaReservaciones, 'fecha/'+buscar);
//    } else {
//      resultado = await Reservaciones.getOnly(DEM.listaReservaciones, 'numero/'+buscar);
//    }
//    print('...resultado en _buscar...');
//    print(resultado.estado);
//    print(resultado.mensaje);
//    print(resultado.objeto);
//    DEM.listaReservaciones.forEach((rr) {
//      print(rr.number);
//      print(rr.guest_last_name);
//      print(rr.guest_first_name);
//    });
    setState(() {
      enBuscar = true;
    });
//    if (DEM.listaReservaciones.length == 0) {
//      MensajeError(context, 'No se ha encontrado una Reservación con el número '+DEM.mapaBusquedaReservas['buscar']);
//      return;
//    }
//    print('*******************************************************************');
//    print('*******************************************************************');
//    print('*******************************************************************');
//    print('Navegando a Resultados Busqueda Reservas');
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UIResultadosBusquedaReservas())).then((_){
      setState(() {});
    });
//    print('Regresando de Resultados Busqueda Reservas');
//    print('*******************************************************************');
//    print('*******************************************************************');
//    print('*******************************************************************');

//    Mensaje(DEM.contexto, 'Buscando ' + DEM.mapaBusquedaReservas['buscar']);
    setState(() {
      enBuscar = false;
    });
  }

  String _validarBusqueda(String value) {
    enBuscar = false;
    _formaEditada = true;
//    if (value.isEmpty)
//      return campoObligatorio(SESIONESUSUARIOS.ETIQUETA_USUARIO);

    DEM.mapaBusquedaReservas['buscar'] = value;
//    setState(() {});
    return null;
  }

  _inicializar() async {
    _controller.addListener(() {
//      print(_controller.value.text);
      DEM.mapaBusquedaReservas['buscar'] = _controller.value.text;
//        _controller.selection.start
//      final text = _controller.text.toUpperCase();
//      _controller.value = _controller.value.copyWith(
//        text: text,
//        selection:
//            TextSelection(baseOffset: text.length, extentOffset: text.length),
//        composing: TextRange.empty,
//      );
    });
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _inicializar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

//    DEM.contexto = context;

    return Form(
      key: _forma,
      autovalidate: _autovalidar,
      child: Column(
        children: <Widget>[
          Center(
            child: UICampo(
              datos: DEM.mapaBusquedaReservas,
              tabla: '',
              campo: 'buscar',
              denominacion: '',
              etiqueta: 'Escribe aquí tu búsqueda',
              mostrarEtiqueta: false,
//                                            ayuda: 'Escribe aquí',
              componente: Co.COMPONENTE_BD_EDICION_TEXTO,
              longitud: 50,
              validatorTexto: _validarBusqueda,
              ancho: 400,
              autovalidar: true,
              controlador: _controller,
            ),
          ),
          UIBoton(
            'Buscar',
            enBuscar
                ? null
                : _buscar,
            alto: 30,
            ancho: 150,
            margenes: EdgeInsets.only(top: 0, right: 0),
          ),
        ],
      ),
    );
  }
}
