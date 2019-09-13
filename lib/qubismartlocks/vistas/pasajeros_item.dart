/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Pasajeros
 [Qubi Smart Locks/Qubi Smart Locks/Pasajeros]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class PasajeroItem extends StatefulWidget {
  PasajeroItem({
    this.registro,
    this.lista,
    this.animation,
  });

  final List<Pasajero> lista;
  final Pasajero registro;
  final Animation animation;

  @override
  _PasajeroItemState createState() => _PasajeroItemState();
}

class _PasajeroItemState extends State<PasajeroItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          GlobalKey<ScaffoldState> key = Scaffold.of(context).widget.key;

          Resultado _resultado = await  Pasajeros.registro(widget.registro.id, widget.registro);
          if (_resultado.estado == Co.REGISTRO_BORRADO) {
            mensajeError(key.currentState, Co.MENSAJE_REGISTRO_BORRADO);
            widget.lista.remove(widget.registro);
          }
          if (_resultado.estado == Co.OK) {
            widget.registro.assign(_resultado.objeto);
            Pasajero registroEnEdicion = Pasajero();
            registroEnEdicion.assign(widget.registro);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                FPasajerosEdicion(
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
                  // TODO: Definir el enlace para Id en clave foranea Pasajero.Reservacion
                  Text(widget.registro.reservacion.toString(),
                      style: estiloListados),
                  Text(widget.registro.nombres,
                      style: estiloListados),
                  Text(widget.registro.apellidos,
                      style: estiloListados),
                  Text(widget.registro.llaveElectronica.toString(),
                      style: estiloListados),
                ],
              )
            ],
          )
        ),
    );
  }
}
