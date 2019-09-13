import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UIPasajerosList extends StatefulWidget {
  UIPasajerosList(this.listaPasajeros);

  final List<Pasajero> listaPasajeros;

  @override
  _UIPasajerosListState createState() => _UIPasajerosListState();
}

class _UIPasajerosListState extends State<UIPasajerosList> {
  _volver() async {
    DEM.listaPasajeros.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    App.variables.calcular(context);

    List<Pasajero> lista = widget.listaPasajeros;

    if (lista == null) {
      lista = List<Pasajero>();
    }

    if (lista.length == 0) {
      Pasajero pasajero = Pasajero(
        nombres: 'Gustavo Adolfo',
        apellidos: 'Beckles Godoy',
        //doc: '567-512-832-1',
        telefono: '+567291322',
        //email: 'abnershr@gmail.com',
      );
      lista.add(pasajero);
      lista.add(pasajero);
      lista.add(pasajero);
    }

    return Container(
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
                width: MediaQuery.of(context).size.width * 60 / 100,
                height: 550,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18)), //ojo
                ),
                // Image
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 100,
                      height: 100,
                      //color: Colors.black,
                      child: Image.asset(
                        'images/QUBI-15.png',
                        //width: 40,
                        //height: 20,
                      ),
                    ),
                    Container(
//                                          width: 300,
//                                          height: 80,
                      child: Text(
                        'Detalle de Pasajeros',
                        style: AppRes.appResMap[Co.ESTILO_TITULO],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 250,
//                        width: 550,
                        child: lista.length > 0
                            ? Scrollbar(
                                child: ListView(
                                  padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .03,
                                    right:
                                        MediaQuery.of(context).size.width * .03,
                                  ),
//                                  children: lista.map((pasajero) {
//                                    return UIPasajerosCard(pasajero: pasajero);
//                                  }).toList(),
                                ),
                              )
                            : Center(
                                child: UIEtiqueta(
                                    'NO SE HAN REGISTRADO PASAJEROS'),
                              ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 30, bottom: 30),
                          child: UIBoton(
                            'Volver',
                            _volver,
                            ancho: 150,
                            margenes: EdgeInsets.all(0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30, bottom: 30),
                          child: GestureDetector(
                            onTap: () {
                              DEM.listaPasajeros.add(
                                  Pasajero(reservacion: DEM.reservacion.id));
                              setState(() {

                              });
                            },
                            child: Row(
                              children: <Widget>[
                                Text('Agregar Pasajero',
                                style: AppRes.appResMap[Co.ESTILO_ETIQUETA],),
                                Icon(Icons.add_circle, color: AppRes.appResMap[Co.COLOR_ETIQUETA_EDICION],size: 40,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
