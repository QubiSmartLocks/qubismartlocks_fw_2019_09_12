import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:appresweb/appresweb.dart';
import 'package:flutter_web/painting.dart';


class UICampoSeleccion extends StatefulWidget {
  UICampoSeleccion({
    this.titulo,
    @required this.data,
    @required this.campo,
    this.etiqueta,
    @required this.mostrar,
    this.alto,
    this.ancho,
    this.altoLista,
    this.anchoLista,
    @required this.selecto,
    @required this.lista,
    this.callback,
  });

  final String titulo;
  final Map data;
  final String campo;
  final String etiqueta;
  final String mostrar;
  final double alto;
  final double ancho;
  final double altoLista;
  final double anchoLista;
  final Map selecto;
  final List<Map> lista;

  final VoidCallback callback;

  @override
  _UICampoSeleccionState createState() => _UICampoSeleccionState();
}

class _UICampoSeleccionState extends State<UICampoSeleccion> {
  mostrarListaSeleccion(BuildContext context) {
    SimpleDialog dialog = SimpleDialog(
      backgroundColor: AppRes.appResMap[Co.COLOR_3],
      elevation: 15,
      titlePadding: EdgeInsets.all(0),
      contentPadding: EdgeInsets.all(10),
      title: UITitulo(widget.titulo),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      children: <Widget>[
        Container(
          width: widget.anchoLista,
          height: widget.altoLista,
//          padding: EdgeInsets.all(20),
//          margin: EdgeInsets.all(20),
//          color: Colors.red,
          child: ListView.builder(
              itemCount: widget.lista.length,
              padding: EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                Map mapa = widget.lista[index];
                return GestureDetector(
                  onTap: () {
                    seleccionado(mapa);
                  },
                  child: Container(

                    //decoration: AppRes.appResMap[Co.DECORACION_CAJA_CIRCULAR],
                    width: widget.ancho,
                    margin: EdgeInsets.all(2),
                    padding: EdgeInsets.only(left: 8,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: mapa[widget.mostrar] ==
                              widget.data[widget.campo][widget.mostrar]
                          ? AppRes.appResMap[Co.COLOR_FONDO_ITEM_LISTA]
                          : AppRes.appResMap[Co.COLOR_ITEM_LISTA],
                    ),
                    child: Text(
                      mapa[widget.mostrar],
                      style: AppRes.appResMap[Co.ESTILO_DATO].copyWith(
                        color: mapa[widget.mostrar] ==
                                widget.data[widget.campo][widget.mostrar]
                            ? AppRes.appResMap[Co.COLOR_ITEM_LISTA]
                            : AppRes.appResMap[Co.COLOR_FONDO_ITEM_LISTA],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Container(
          width: widget.anchoLista,
          height: widget.altoLista,
//            borderRadius: BorderRadius.circular(40),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(
            left: (MediaQuery.of(context).size.width - widget.anchoLista) / 2,
            right: (MediaQuery.of(context).size.width - widget.anchoLista) / 2,
            top: (MediaQuery.of(context).size.height - widget.altoLista) / 2,
            bottom: (MediaQuery.of(context).size.height - widget.altoLista) / 2,
          ),
          child: dialog,
        );
      },
    );
  }

  seleccionado(Map mapa) {
    print('Se ha seleccionado:');
    print(mapa[widget.mostrar]);
    widget.data[widget.campo] = mapa;
    print(widget.data);
    if (widget.callback != null) {
      widget.callback();
    }
    setState(() {});
    Navigator.of(context).pop(mapa);
  }

  @override
  Widget build(BuildContext context) {
    String sdato = '<Seleccione>';
    try {
      sdato = widget.data[widget.campo][widget.mostrar];
    }catch(e){
      //

    }
    if (sdato == null) {
      sdato = '<Seleccione>';
    }
    print(sdato);
    return Container(
      width: widget.ancho,
//      height: widget.alto + 35,
      child: Column(
        children: <Widget>[
          widget.etiqueta == null ? Container() : UIEtiqueta(widget.etiqueta),
          GestureDetector(
            onTap: () {
              mostrarListaSeleccion(context);
            },
            child: Stack(
              children: <Widget>[
                Container(
                  width: widget.ancho,
                  height: widget.alto == null
                      ? AppRes.appResMap[Co.ALTO_EDICION]
                      : widget.alto,
//                  decoration:
//                      AppRes.appResMap[Co.DECORACION_CONTENEDOR_EDICION],
//                  padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 10),
                ),
                Container(
                  decoration: AppRes.appResMap[Co.DECORACION_CAJA_CIRCULAR],     // Añadido Eber
                  width: widget.ancho,
//                  color: Colors.transparent,
                  height: (widget.alto == null
                      ? AppRes.appResMap[Co.ALTO_EDICION]
                      : widget.alto),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 10),
                  margin: EdgeInsets.all(0),
                  child: Text(
                    sdato,
                    style: AppRes.appResMap[Co.ESTILO_EDICION],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
