import 'package:flutter_web/material.dart';


class UIBusquedaReservasSmall extends StatelessWidget {
  const UIBusquedaReservasSmall({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Scaffold(
            //appBar: AppBar(title: Text('Reservas'),),
            body: Center(
              child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          // Contenedor para movil
                          Container(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                      height: 400,
                                      width:
                                      MediaQuery.of(context).size.width * 90 / 100,
                                      child: Image.asset(
                                        'images/ui_background-buildings.png',
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Center(
                                  child: Card(
                                    elevation: 3,
                                    child: Container(
                                      width: 425,
                                      height: 400,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(18)), //ojo
                                      ),
                                      // Image
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(top: 0),
                                          ),
                                          Container(
                                              child: Column(children: <Widget>[
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(right: 300, top: 0),
                                                ),
                                                Center(
                                                  child: Column(children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 300, top: 10),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(top: 20),
                                                      width: 80,
                                                      height: 80,
                                                      //color: Colors.black,
                                                      child: Image.asset(
                                                        'images/ui_lupa.png',
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 10, left: 30, bottom: 0),
                                                      width: 300,
                                                      height: 60,
                                                      child: Text(
                                                        'Búsqueda de reservas',
                                                        style: TextStyle(
                                                            color: Color(0xFF283865),
                                                            fontSize: 20,
                                                            fontFamily: 'Poppins Regular',
                                                            fontWeight: FontWeight.bold),
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
                                                                    color:
                                                                    Color(0xFF7EB8C0),
                                                                    fontFamily:
                                                                    'Poppins Regular',
                                                                    fontSize: 12,
                                                                    fontWeight:
                                                                    FontWeight.bold),
                                                                textAlign: TextAlign.left),
                                                            Text(
                                                                'nombre, apellido, número de reserva, usuario, fecha de checkin.',
                                                                style: TextStyle(
                                                                    color:
                                                                    Color(0xFF7EB8C0),
                                                                    fontFamily:
                                                                    'Poppins Regular',
                                                                    fontSize: 12,
                                                                    fontWeight:
                                                                    FontWeight.bold),
                                                                textAlign: TextAlign.left),
                                                          ],
                                                        )),
                                                    Container(
                                                      padding: EdgeInsets.only(top: 5),
                                                      height: 35,
                                                      width: 300,
                                                      child: TextFormField(
                                                        cursorColor: Colors.black,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          labelText: 'Escribe aquí',
                                                          labelStyle: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily: 'Poppins Regular',
                                                              color: Color(0xFF7EB8C0)),
                                                          fillColor: Colors.white,
                                                        ),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12,
                                                            fontFamily: 'Poppins Regular',
                                                            fontWeight: FontWeight.w300),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(20),
                                                        color: Color(0xFFF1F0F0),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(top: 10),
                                                      width: 150,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(50),
                                                      ),
                                                      child: FlatButton(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(8)),
                                                        child: Text(
                                                          'Buscar',
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 18,
                                                              fontFamily: 'Poppins Regular',
                                                              fontWeight: FontWeight.w300),
                                                        ),
                                                        onPressed: () {},
                                                        color: Color(0xFF7EB8C0),
                                                      ),
                                                    )
                                                  ]),
                                                ),
                                              ])),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          );
        });
  }
}
