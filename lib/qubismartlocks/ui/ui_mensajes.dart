import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UIMensajes extends StatefulWidget {
  static const String ruta = '/ui-mensajes';

  @override
  _UIMensajesState createState() => _UIMensajesState();
}

class _UIMensajesState extends State<UIMensajes> {
  refrescar() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    CD.iniciar(context);
    double anchoMinimoParaVerConversaciones = 800;
    bool lVerListaConversaciones =
        (CD.ancho > anchoMinimoParaVerConversaciones);
    double porcentajeAnchoConversaciones = lVerListaConversaciones ? 30 : 0;
    double anchoConversaciones = CD.ancho * porcentajeAnchoConversaciones / 100;
    double anchoMensajes =
        CD.ancho * (100 - porcentajeAnchoConversaciones) / 100;
    double altoEncabezado = CD.alto * .1;
    double altoConversaciones = CD.alto - altoEncabezado;
    double altoMensajes = CD.alto - (altoEncabezado * 2);
    double anchoAltoBotones = altoEncabezado * .7;
    double anchoNuevoMensaje = anchoMensajes - (altoEncabezado * .8);
//    double anchoHorizontalMensajes = CD.ancho * .68;

    return Row(
      children: <Widget>[
        lVerListaConversaciones
            ? Column(
                children: <Widget>[
                  Container(
                    width: anchoConversaciones,
                    height: altoEncabezado,
                    decoration: AppRes.appResMap[Co.DECORACION_GRADIENTE],
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Image.asset(
                            'images/web_qubi_arrow-back.png',
                            width: altoEncabezado * .7,
                            height: altoEncabezado * .7,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        Container(
                          child: Text(
                            'Conversaciones',
                            style: TextStyle(
                                fontSize: 28,
                                color: AppRes.appResMap[Co.COLOR_3]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: anchoConversaciones,
                      height: altoConversaciones,
                      child: ListaConversaciones(refrescar: refrescar),
                    ),
                  ),
                ],
              )
            : Container(),
        Container(
          width: anchoMensajes,
          child: Column(
            children: <Widget>[
              Container(
                height: altoEncabezado,
                decoration:
                    AppRes.appResMap[Co.DECORACION_HORIZONTAL_GRADIENT_RTL],
                child: Container(
                  color: Colors.transparent,
                  margin: EdgeInsets.only(left: 5),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(radius: altoEncabezado * .4),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          '${DEM.conversacionActiva.denomConversacion}',
                          style: TextStyle(color: AppRes.appResMap[Co.COLOR_3]),
                          textScaleFactor: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    width: anchoMensajes,
                    height: altoMensajes,
//                    decoration:
//                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Image.asset(
                      'images/web_qubi-12.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  //
                  // Contenedor de los mensajes en la Conversación
                  Container(
                    width: anchoMensajes,
                    height: altoMensajes,
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: ListaMensajesEnConversacion(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //
              // Zona para escribir nuevos mensajes
              Container(
                width: anchoMensajes,
                height: altoEncabezado,
                decoration:
                    AppRes.appResMap[Co.DECORACION_HORIZONTAL_GRADIENT_RTL],
                child: Row(
                  children: <Widget>[
                    Container(
                      width: anchoNuevoMensaje - anchoAltoBotones,
                      padding: EdgeInsets.all(5),
                      child: TextField(
                        decoration: InputDecoration(
                          hoverColor: Colors.white,
                          hintText: 'Ingrese un mensaje',
                          hintStyle: TextStyle(
                              color: AppRes.appResMap[Co.COLOR_2],
                              backgroundColor: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      width: anchoAltoBotones,
                      height: anchoAltoBotones,
                      child: GestureDetector(
                        onTap: () async {
//                          print('Guardando Mensajes Automaticos...');
//                          DEM.fakeData.listaMensajesAutomaticos.forEach((ma) async {
//                            print(ma.mensaje);
//                            ma.id = 0;
//                            final r = await MensajesAutomaticos.guardar(ma);
//                            print('${r.estado}-${r.mensaje}');
//                          });
                          DEM.nuevaConversacion(
                            DEM.fakeData.usuarioActivo,
                            DEM.fakeData.recepcionista,
                          );
                        },
                        child: Icon(Icons.arrow_forward_ios,
                            size: 35, color: Colors.green),
                      ),
                    ),
//                    Container(
//                      width: anchoAltoBotones,
//                      height: anchoAltoBotones,
//                      child: GestureDetector(
//                        onTap: () async {
//                          print(
//                              'Usuario Activo: ${DEM.fakeData.usuarioActivo.nombres}');
//                          print(
//                              'Recepcionista: ${DEM.fakeData.recepcionista.nombres}');
//                          print('Guardando Opciones de Mensajería...');
//                          DEM.fakeData.opcionMensajeria.participanteAutomatico = null;
//                          DEM.fakeData.opcionMensajeria.id = 0;
//                          final r = await OpcionesMensajeria.guardar(DEM.fakeData.opcionMensajeria);
//                          print('${r.estado}-${r.mensaje}');
//
//
//                        },
//                        child: Icon(Icons.arrow_forward_ios,
//                            size: 35, color: Colors.green),
//                      ),
//                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
