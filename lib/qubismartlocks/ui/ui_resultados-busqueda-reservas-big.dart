import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UIResultadosBusquedaReservasBig extends StatefulWidget {
  UIResultadosBusquedaReservasBig(this.listaReservaciones);

  final List<Reservacion> listaReservaciones;

  @override
  _UIResultadosBusquedaReservasBigState createState() =>
      _UIResultadosBusquedaReservasBigState();
}

class _UIResultadosBusquedaReservasBigState
    extends State<UIResultadosBusquedaReservasBig> {
  _volver() async {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    App.variables.calcular(context);

    List<Reservacion> lista = widget.listaReservaciones;

    if (lista == null) {
      lista = List<Reservacion>();
    }

//    if (lista.length == 0) {
//      Reservacion reservacion = Reservacion(
//          number: '1234567',
//          guest_first_name: 'Éber',
//          guest_last_name: 'Hernández',
//          adults: 3,
//          children: 8,
//          departure: DateTime.now().add(Duration(days: 10)),
//          created_at: DateTime.now().subtract(Duration(days: 3)),
//          updated_at: DateTime.now().subtract(Duration(days: 1)),
//          arrival: DateTime.now());
//      lista.add(reservacion);
//      lista.add(reservacion);
//      lista.add(reservacion);
//    }

    return Scaffold(
      body: Row(
        children: <Widget>[
          UILaterales(),
//          // Contenedor izquierdo que hace de separador centrador 1
//          UISideMargin(
//            child: Image.asset('images/ui_locks-eyes.png', fit: BoxFit.cover),
//          ),
          // Contenedor que muestra la imagen hoteles movil 2
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 90 / 100,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width * 90 / 100,
                      child: Image.asset(
                        'images/ui_background-buildings.png',
                        fit: BoxFit.cover,
                      )),
                ),
                Center(
                  child: Card(
                    elevation: 3,
                    child: Container(
                      width: 700,
                      height: 550,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(18)), //ojo
                      ),
                      // Image
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            width: 80,
                            height: 80,
                            //color: Colors.black,
                            child: Image.asset(
                              'images/ui_lupa.png',
                              //width: 40,
                              //height: 20,
                            ),
                          ),
                          Container(
//                                          width: 300,
//                                          height: 80,
                            child: Text(
                              'Resultados de tu búsqueda',
                              style: AppRes.appResMap[Co.ESTILO_TITULO],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 250,
                              width: 550,
                              child: lista.length > 0
                                  ? Scrollbar(
                                      child: ListView(
                                        children: lista.map((reservacion) {
                                          return UIResultadosBusquedasReservasCard(
                                              reservacion: reservacion);
                                        }).toList(),
                                      ),
                                    )
                                  : Center(
                                      child: UIEtiqueta(
                                          'NO SE ENCONTRARON RESERVACIONES'),
                                    ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30, bottom: 30),
                            child: UIBoton(
                              'Volver',
                              _volver,
                              ancho: 150,
                              margenes: EdgeInsets.all(0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          UILaterales(),
          // Contenedor derecho que hace de separador centrador 3
//          UISideMargin(
//            child: Image.asset('images/ui_locks-eyes.png', fit: BoxFit.cover),
//          ),
        ],
      ),
    );
  }
}
