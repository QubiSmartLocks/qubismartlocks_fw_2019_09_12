import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UIBusquedaReservasBig extends StatefulWidget {
  @override
  _UIBusquedaReservasBigState createState() => _UIBusquedaReservasBigState();
}

class _UIBusquedaReservasBigState extends State<UIBusquedaReservasBig> {
  @override
  Widget build(BuildContext context) {
    App.variables.calcular(context);
   // DEM.contexto = context;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          //appBar: AppBar(title: Text('Pantalla Grande'),),
          body: Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      // Contenedor izquierdo que hace de separador centrador 1
                      Container(
                        //color: Colors.white,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 5 / 100,
                        child: Image.asset('images/ui_locks-eyes.png',
                            fit: BoxFit.cover),
                      ),
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
                                  width: MediaQuery.of(context).size.width *
                                      90 /
                                      100,
                                  child: Image.asset(
                                    'images/ui_background-buildings.png',
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Center(
                              child: Card(
                                elevation: 3,
                                child: Container(
                                  width: 600,
                                  height: 450,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(18)), //ojo
                                  ),
                                  // Image
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(top: 0),
                                      ),
                                      Container(
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 300, top: 0),
                                            ),
                                            Center(
                                              child: Column(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 300, top: 10),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 20),
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
                                                    padding: EdgeInsets.only(
                                                        top: 10,
                                                        left: 30,
                                                        bottom: 0),
//                                          width: 300,
                                                    height: 80,
                                                    child: Text(
                                                      'Búsqueda de reservas',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF283865),
                                                          fontSize: 24,
                                                          fontFamily:
                                                              'Poppins Regular',
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          top: 5, bottom: 10),
                                                      width: 700,
                                                      height: 70,
                                                      child: Column(
                                                        children: <Widget>[
                                                          Text(
                                                              'Podrás ubicar tu reserva mediante cualquiera de estas opciones:',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFF7EB8C0),
                                                                fontFamily:
                                                                    'Poppins Regular',
                                                                fontSize: 14,
//                                                      fontWeight:
//                                                          FontWeight.bold,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left),
                                                          Text(
//                                                              '[apellido NO IMPLEMENTADO] fecha [YYYY-MM-DD o MM-DD] o número de reserva',
                                                              'fecha de llegada [MM-DD o YYYY-MM-DD] o número de reserva',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFF7EB8C0),
                                                                fontFamily:
                                                                    'Poppins Regular',
                                                                fontSize: 14,
//                                                        fontWeight:
//                                                            FontWeight.bold,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left),
                                                        ],
                                                      )),
                                                  UIBusquedaReservasForm(),
                                                ],
                                              ),
                                            ),
                                          ],
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
                      Container(
                        //color: Colors.blue,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 5 / 100,
                        child: Image.asset('images/ui_locks-eyes.png',
                            fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
