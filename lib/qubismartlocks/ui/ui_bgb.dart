// Proyecto: TACCH
// Version: 0.3.5.23
// Autor:
// Unidad: Artilugios (Widgets)

import 'package:flutter_web/material.dart';
import 'package:appresweb/src/_res.dart';

class UIBGB extends StatelessWidget {
  UIBGB({@required this.guardar, @required this.borrar});

  final VoidCallback guardar;
  final VoidCallback borrar;

  @override
  Widget build(BuildContext context) {
    if (!CD.iniciado) CD.iniciar(context);

    return Container(
      alignment: Alignment.centerLeft,
      width: 280,
      margin: EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: borrar == null
//            ? MainAxisAlignment.center
//            : MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 50,
            child: FlatButton(
            color: AppRes
                .appResMap[Co.COLOR_2],
            shape:
            RoundedRectangleBorder(
                borderRadius:
                BorderRadius
                    .circular(
                    8)),
            child: Icon(Icons.arrow_back,
                color: AppRes.appResMap[
                Co.COLOR_3]),
            onPressed: () {
              Navigator.pop(context);
            },
          ),),

          // ),
          Expanded(
            child: SizedBox(),
          ),

          Container(
            color: Colors.transparent,
            height: 35,
            width: 145,
            child: FlatButton(
              color: AppRes.appResMap[Co.COLOR_2],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: <Widget>[
                  Icon(Icons.save, color: AppRes.appResMap[Co.COLOR_3],),
                  Text(' Guardar', style: AppRes.appResMap[Co.ESTILO_BOTONES_BGB],),
                ],
              ),
              onPressed: () {
                guardar;
              },
            ),
          ),
          borrar == null
              ? Container()
              : SizedBox(
                  width: 10,
                ),
          Container(
            color: Colors.transparent,
            height: 35,
            width: 120,
            child: FlatButton(
              color: AppRes.appResMap[Co.COLOR_2],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: <Widget>[
                  Icon(Icons.clear, color: AppRes.appResMap[Co.COLOR_3],),
                  Text(' Borrar',
                    style: AppRes.appResMap[Co.ESTILO_BOTONES_BGB],
                  ),
                ],
              ),
              onPressed: () {
                borrar;
              },
            ),
          ),
        ],
      ),
    );
  }
}
