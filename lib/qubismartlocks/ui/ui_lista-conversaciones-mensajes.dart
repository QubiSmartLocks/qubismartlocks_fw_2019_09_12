import 'package:qubismartlocks_fw/qubismartlocks.dart';


class ListaMensajesEnConversacion extends StatefulWidget {
  @override
  _ListaMensajesEnConversacionState createState() =>
      _ListaMensajesEnConversacionState();
}

class _ListaMensajesEnConversacionState
    extends State<ListaMensajesEnConversacion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: DEM.mensajesEnConversacionActiva.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 20 / 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * 20 / 100,
              //width: CD.ancho * .20,

              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: DEM.fakeData.recepcionista.id ==
                    DEM.mensajesEnConversacionActiva[index].participante
                        .usuario
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 20 / 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.blue.shade100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${DEM.mensajesEnConversacionActiva[index].participante.nombre}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${DEM.mensajesEnConversacionActiva[index].mensajeTexto}',
                        ),
                        Text(
                          '${DEM.mensajesEnConversacionActiva[index].momento.toString()}',
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}