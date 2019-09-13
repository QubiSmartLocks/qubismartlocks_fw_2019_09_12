import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:qubismartlocks_fw/qubismartlocks/ui/ui_pasajeros.dart';

class UIResultadosBusquedasReservasCard extends StatefulWidget {
  UIResultadosBusquedasReservasCard({this.reservacion});

  final Reservacion reservacion;

  _UIResultadosBusquedasReservasCardState createState() =>
      _UIResultadosBusquedasReservasCardState();
}

class _UIResultadosBusquedasReservasCardState
    extends State<UIResultadosBusquedasReservasCard> {
  _detallePasajeros() async {
    // TODO: Buscar Pasajeros de la reservacion.id
//    widget.reservacion.id
//    await Pasajeros.getAll(DEM.listaPasajeros);
//    if (DEM.listaPasajeros.length == 0) {
//      DEM.listaPasajeros.add(Pasajero(
//        reservacion: widget.reservacion.id,
//        nombres: widget.reservacion.guest_first_name,
//        apellidos: widget.reservacion.guest_last_name,
////        doc: widget.reservacion.gu,
//        telefono: widget.reservacion.guest_phone_number,
//        email: widget.reservacion.guest_e_mail,
//      ));
//    }
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => UIPasajeros())).then((_){
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    App.variables.calcular(context);

    Reservacion reservacion = widget.reservacion;

//    if (reservacion == null) {
//      reservacion = Reservacion(
//          number: '1234567',
//          guest_first_name: 'Éber',
//          guest_last_name: 'Hernández',
//          adults: 3,
//          children: 8,
//          departure: DateTime.now().add(Duration(days: 10)),
//          created_at: DateTime.now().subtract(Duration(days: 3)),
//          updated_at: DateTime.now().subtract(Duration(days: 1)),
//          arrival: DateTime.now());
//    }

    return GestureDetector(
      onTap: _detallePasajeros,
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.all(10),
          width: 525,
          height: 185,
//        color: Colors.lightBlue,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
//                  Text(
//                    'Número: ' + reservacion.number,
//                    style: AppRes.appResMap[Co.ESTILO_LISTA_1RA_LINEA],
//                  ),
//                  Text(
//                    ' Reservada: ' + MostrarFecha(reservacion.created_at),
//                    style: AppRes.appResMap[Co.ESTILO_LISTA_1RA_LINEA],
//                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
//                  Text(
//                    'Pasajero: ' +
//                        reservacion.guest_first_name +
//                        ' ' +
//                        reservacion.guest_last_name,
//                    style: AppRes.appResMap[Co.ESTILO_LISTA_2DA_LINEA],
//                  ),
//                  Text(
//                    'Referencia: ' + reservacion.reference_number, // +
////                      ', ' +
////                      reservacion.guest_first_name,
//                    style: AppRes.appResMap[Co.ESTILO_LISTA_2DA_LINEA],
//                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
//                  Text(
//                    'Actualizada: ' + MostrarFecha(reservacion.updated_at),
//                    style: AppRes.appResMap[Co.ESTILO_LISTA_2DA_LINEA],
//                  ),
//                  Text(
//                    'Hab: ' +
//                        DEM.listaHabitaciones
//                            .firstWhere(
//                                (hab) => hab.id == reservacion.arrival_room_id,
//                                orElse: () => Habitacion(name: '<NONE>'))
//                            .name,
//                    style: AppRes.appResMap[Co.ESTILO_LISTA_1RA_LINEA],
//                  ),
//                  Text(
//                    'Tipo: ' +
//                        DEM.listaTipHabitaciones
//                            .firstWhere(
//                                (tipHab) =>
//                                    tipHab.id ==
//                                    reservacion.arrival_room_type_id,
//                                orElse: () => TipoHabitacion(name: '<NONE>'))
//                            .name,
////                      reservacion.arrival_room_type_id.toString().substring(0, 10),
//                    style: AppRes.appResMap[Co.ESTILO_LISTA_2DA_LINEA],
//                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        UIReservasPersona(
                          texto: 'Adultos',
                          //cantidad: reservacion.adults,
                          ancho: 70,
                          alto: 100,
                          margin: EdgeInsets.only(top: 0),
                        ),
                        UIReservasPersona(
                          texto: 'Niños',
                          //cantidad: reservacion.children,
                          ancho: 70,
                          alto: 65,
                          margin: EdgeInsets.only(top: 35),
                        ),
                      ],
                    ),
                  ),
                  UISeparadorLineaVertical(),
                  UIReservasFechaCheckInOut(
                    in_out: 'in',
                    //fecha: reservacion.arrival,
                  ),
                  UISeparadorLineaVertical(),
                  UIReservasFechaCheckInOut(
                    in_out: 'out',
                    //fecha: reservacion.departure,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
