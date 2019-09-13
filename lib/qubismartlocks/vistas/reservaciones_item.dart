/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Reservaciones
 [Qubi Smart Locks/Qubi Smart Locks/Reservaciones]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class ReservacionItem extends StatefulWidget {
  ReservacionItem({
    this.registro,
    this.lista,
    this.animation,
  });

  final List<Reservacion> lista;
  final Reservacion registro;
  final Animation animation;

  @override
  _ReservacionItemState createState() => _ReservacionItemState();
}

class _ReservacionItemState extends State<ReservacionItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          GlobalKey<ScaffoldState> key = Scaffold.of(context).widget.key;

          Resultado _resultado = await  Reservaciones.registro(widget.registro.id, widget.registro);
          if (_resultado.estado == Co.REGISTRO_BORRADO) {
            mensajeError(key.currentState, Co.MENSAJE_REGISTRO_BORRADO);
            widget.lista.remove(widget.registro);
          }
          if (_resultado.estado == Co.OK) {
            widget.registro.assign(_resultado.objeto);
            Reservacion registroEnEdicion = Reservacion();
            registroEnEdicion.assign(widget.registro);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                FReservacionesEdicion(
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
                  Text(widget.registro.numeroReservacion,
                      style: estiloListados),
                  Text(widget.registro.fechaLlegada.toString(),
                      style: estiloListados),
                  Text(widget.registro.fechaSalida.toString(),
                      style: estiloListados),
                  Text(widget.registro.tipoUnidadFuncional.denomTipoUnidadFuncional,
                      style: estiloListados),
                  Text(widget.registro.unidadFuncional.denomUnidadFuncional,
                      style: estiloListados),
                  Text(widget.registro.adultos.toString(),
                      style: estiloListados),
                  Text(widget.registro.niyos.toString(),
                      style: estiloListados),
                  Text(widget.registro.referenciaNumero,
                      style: estiloListados),
                  Text(widget.registro.fechaReferencia.toString(),
                      style: estiloListados),
                  Text(widget.registro.estadoReservacion.denomEstadoReservacion,
                      style: estiloListados),
                ],
              )
            ],
          )
        ),
    );
  }
}
