/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Rooms
 [Clock PMS (Api Reservaciones)/Clock PMS (Api Reservaciones)/Rooms]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class RoomItem extends StatefulWidget {
  RoomItem({
    this.registro,
    this.lista,
    this.animation,
  });

  final List<Room> lista;
  final Room registro;
  final Animation animation;

  @override
  _RoomItemState createState() => _RoomItemState();
}

class _RoomItemState extends State<RoomItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          GlobalKey<ScaffoldState> key = Scaffold.of(context).widget.key;

          Resultado _resultado = await  Rooms.registro(widget.registro.id, widget.registro);
          if (_resultado.estado == Co.REGISTRO_BORRADO) {
            mensajeError(key.currentState, Co.MENSAJE_REGISTRO_BORRADO);
            widget.lista.remove(widget.registro);
          }
          if (_resultado.estado == Co.OK) {
            widget.registro.assign(_resultado.objeto);
            Room registroEnEdicion = Room();
            registroEnEdicion.assign(widget.registro);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                FRoomsEdicion(
                  registro: registroEnEdicion,
                ),
              ),
            ).then((resultado) {
              if (resultado != null) {
                if (resultado.estado == Co.OK) {
                  widget.registro.assign(registroEnEdicion);
                }
                if (resultado.estado == Co.REGISTRO_BORRADO) {
                  widget.lista.remove(widget.registro);
                }
              }
              setState(() {});
            });
          }
        },
        child: Container(
          // height: Co.ALTO_ITEMS_LISTADOS,
          width: CD.ancho,
          color: AppRes.appResMap[Co.COLOR_FONDO_ITEM_LISTA],
          margin: const EdgeInsets.symmetric(vertical: Co.MARGEN_ITEMS_LISTADOS_VERTICAL),
          padding: const EdgeInsets.all(Co.PADDING_ITEMS_LISTADOS_VERTICAL),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.registro.name,
                      style: estiloListados),
                  Text(widget.registro.room_type_id.toString(),
                      style: estiloListados),
                  Text(widget.registro.housekeeping_warning,
                      style: estiloListados),
                  Text(widget.registro.housekeeping_status,
                      style: estiloListados),
                  Text(widget.registro.description,
                      style: estiloListados),
                  Text(widget.registro.sort_order.toString(),
                      style: estiloListados),
                  Text(widget.registro.location_id.toString(),
                      style: estiloListados),
                ],
              )
            ],
          )
        ),
    );
  }
}
