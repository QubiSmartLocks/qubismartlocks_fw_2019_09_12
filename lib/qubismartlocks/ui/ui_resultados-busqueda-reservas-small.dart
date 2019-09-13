import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UIResultadosBusquedaReservasSmall extends StatefulWidget {
  UIResultadosBusquedaReservasSmall(this.listaReservaciones);

  final List<Reservacion> listaReservaciones;

  @override
  _UIResultadosBusquedaReservasSmallState createState() => _UIResultadosBusquedaReservasSmallState();
}

class _UIResultadosBusquedaReservasSmallState extends State<UIResultadosBusquedaReservasSmall> {

  _volver() async {}

  @override
  Widget build(BuildContext context) {
    App.variables.calcular(context);

    List<Reservacion> lista = widget.listaReservaciones;

    if (lista == null) {
      lista = List<Reservacion>();
    }
//
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
          // Contenedor izquierdo que hace de separador centrador 1
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
                                ),)
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

          // Contenedor derecho que hace de separador centrador 3
//          UISideMargin(
//            child: Image.asset('images/ui_locks-eyes.png', fit: BoxFit.cover),
//          ),
        ],
      ),
    );
  }
//
//  @override
//  Widget build(BuildContext context) {
//    return LayoutBuilder(
//        builder: (BuildContext context, BoxConstraints constraints) {
//          return Scaffold(
//            //appBar: AppBar(title: Text('Reservas'),),
//            body: Center(
//              child: Container(
//                  child: Column(
//                    children: <Widget>[
//                      Row(
//                        children: <Widget>[
//                          // Contenedor para movil
//                          Container(
//                            color: Colors.white,
//                            height: MediaQuery.of(context).size.height,
//                            width: MediaQuery.of(context).size.width,
//                            child: Stack(
//                              children: <Widget>[
//                                Align(
//                                  alignment: Alignment.bottomCenter,
//                                  child: Container(
//                                      height: 400,
//                                      width:
//                                      MediaQuery.of(context).size.width * 90 / 100,
//                                      child: Image.asset(
//                                        'images/ui_background-buildings.png',
//                                        fit: BoxFit.cover,
//                                      )),
//                                ),
//                                Center(
//                                  child: Card(
//                                    elevation: 3,
//                                    child: Container(
//                                      width: 425,
//                                      height: 400,
//                                      decoration: BoxDecoration(
//                                        borderRadius:
//                                        BorderRadius.all(Radius.circular(18)), //ojo
//                                      ),
//                                      // Image
//                                      child: Column(
//                                        children: <Widget>[
//                                          Padding(
//                                            padding: EdgeInsets.only(top: 0),
//                                          ),
//                                          Container(
//                                              child: Column(children: <Widget>[
//                                                Padding(
//                                                  padding:
//                                                  EdgeInsets.only(right: 300, top: 0),
//                                                ),
//                                                Center(
//                                                  child: Column(children: <Widget>[
//                                                    Padding(
//                                                      padding: EdgeInsets.only(
//                                                          right: 300, top: 10),
//                                                    ),
//                                                    Container(
//                                                      padding: EdgeInsets.only(top: 20),
//                                                      width: 80,
//                                                      height: 80,
//                                                      //color: Colors.black,
//                                                      child: Image.asset(
//                                                        'images/qubi_08.png',
//                                                      ),
//                                                    ),
//                                                    Container(
//                                                      width: 300,
//                                                      height: 60,
//                                                      child: Text(
//                                                        'Resultados de tu búsqueda',
//                                                        style: TextStyle(
//                                                            color: Color(0xFF283865),
//                                                            fontSize: 20,
//                                                            fontFamily: 'Poppins',
//                                                            fontWeight: FontWeight.bold),
//                                                      ),
//                                                    ),
//                                                    Container(
//                                                      padding: EdgeInsets.only(top: 5),
//                                                      height: 35,
//                                                      width: 300,
//                                                      child: TextFormField(
//                                                        cursorColor: Colors.black,
//                                                        decoration: InputDecoration(
//                                                          border: InputBorder.none,
//                                                          labelText: 'Escribe aquí',
//                                                          labelStyle: TextStyle(
//                                                              fontSize: 12,
//                                                              fontFamily: 'Poppins',
//                                                              color: Color(0xFF7EB8C0)),
//                                                          fillColor: Colors.white,
//                                                        ),
//                                                        style: TextStyle(
//                                                            color: Colors.black,
//                                                            fontSize: 12,
//                                                            fontFamily: 'Poppins',
//                                                            fontWeight: FontWeight.w300),
//                                                      ),
//                                                      decoration: BoxDecoration(
//                                                        borderRadius:
//                                                        BorderRadius.circular(20),
//                                                        color: Color(0xFFF1F0F0),
//                                                      ),
//                                                    ),
//                                                    Container(
//                                                      padding: EdgeInsets.only(top: 10),
//                                                      width: 100,
//                                                      decoration: BoxDecoration(
//                                                        borderRadius:
//                                                        BorderRadius.circular(50),
//                                                      ),
//                                                      child: FlatButton(
//                                                        shape: RoundedRectangleBorder(
//                                                            borderRadius:
//                                                            BorderRadius.circular(8)),
//                                                        child: Text(
//                                                          'Volver',
//                                                          style: TextStyle(
//                                                              color: Colors.white,
//                                                              fontSize: 14,
//                                                              fontFamily: 'Poppins',
//                                                              fontWeight: FontWeight.w300),
//                                                        ),
//                                                        onPressed: () {},
//                                                        color: Color(0xFF7EB8C0),
//                                                      ),
//                                                    )
//                                                  ]),
//                                                ),
//                                              ])),
//                                        ],
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                        ],
//                      ),
//                    ],
//                  )),
//            ),
//          );
//        });
//  }
}
