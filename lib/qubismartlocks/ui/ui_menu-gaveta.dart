/*
 Proyecto: Qubi Smart Locks
 Version: 0.0.2
 Autor: Abner Hernández
 Unidad: UI Menú Gaveta
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';

Widget FondoGaveta(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    child: UIBackgroundDrawer(),
  );
}

Widget ImagenRecurso(String nombreImagen, {ancho = 40.0, alto = 40.0}) {
  return Container(
    height: alto,
    width: ancho,
    child:  Image(
      image:  AssetImage('assets/images/' + nombreImagen),
//      fit: BoxFit.scaleDown,
    ),
  );
}

class OpcionGaveta {
  OpcionGaveta({
    @required this.opcion,
    @required this.onTap,
    this.widget,
  });

  final String opcion;
  final Widget widget;
  final VoidCallback onTap;
}

class UIMenuGaveta extends StatelessWidget {
  UIMenuGaveta(this.context);

  final BuildContext context;

  final List<OpcionGaveta> listaOpciones = List<OpcionGaveta>();

  void cargarOpcionesGaveta() {
    if (listaOpciones.length > 0) {
      listaOpciones.clear();
    }

    /*listaOpciones.add(
      OpcionGaveta(
        opcion: 'Cerraduras',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UICerradurasForma()));

        },
        widget: Icon(Icons.lock, color: AppRes.appResMap[Co.COLOR_1],),
      ),
    );*/


    /*listaOpciones.add(
      OpcionGaveta(
        opcion: 'Estado de Cerraduras',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UIEstadosCerradurasForma()));

        },
        widget: Icon(Icons.lock_open, color: AppRes.appResMap[Co.COLOR_1],),
      ),
    );*/

    /*listaOpciones.add(
      OpcionGaveta(
        opcion: 'Histórico de Cerraduras',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UIHistoricosCerradurasForma()));

        },
        widget: Icon(Icons.lock_outline, color: AppRes.appResMap[Co.COLOR_1],),
      ),
    );*/

    /*listaOpciones.add(
      OpcionGaveta(
        opcion: 'Log de Cerraduras',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UILogsCerradurasForma()));

        },
        widget: Icon(Icons.phonelink_lock, color: AppRes.appResMap[Co.COLOR_1],),
      ),
    );
*/
    /*listaOpciones.add(
      OpcionGaveta(
        opcion: 'Marcas de Cerraduras',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UIMarcasCerradurasForma()));

        },
        widget: Icon(Icons.phonelink_lock, color: AppRes.appResMap[Co.COLOR_1],),
      ),
    );*/

    /*listaOpciones.add(
      OpcionGaveta(
        opcion: 'Modelos de Cerraduras',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UIModelosCerradurasForma()));

        },
        widget: Icon(Icons.screen_lock_landscape, color: AppRes.appResMap[Co.COLOR_1],),
      ),
    );*/

    /*listaOpciones.add(
      OpcionGaveta(
        opcion: 'Usuarios',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UIUsuariosForma()));

        },
        widget: Icon(Icons.supervised_user_circle, color: AppRes.appResMap[Co.COLOR_1],),
      ),
    );*/

   /* listaOpciones.add(
      OpcionGaveta(
        opcion: 'Niveles de Usuarios',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UINivelesUsuariosForma()));

        },
        widget: Icon(Icons.people_outline, color: AppRes.appResMap[Co.COLOR_1],),
      ),
    );*/

    /*listaOpciones.add(
      OpcionGaveta(
        opcion: 'Habitaciones',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UIUnidadesFuncionalesForma()));

        },
        widget: Icon(Icons.business, color: AppRes.appResMap[Co.COLOR_1],),
      ),
    );*/

    /*listaOpciones.add(
      OpcionGaveta(
        opcion: 'Tipo de Habitaciones',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UITipUnidadesFuncionalesForma()));

        },
        widget: Icon(Icons.view_quilt, color: AppRes.appResMap[Co.COLOR_1],),
      ),
    );*/

    /*listaOpciones.add(
      OpcionGaveta(
        opcion: 'Pasajeros',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UIPasajerosForma()));

        },
        widget: Icon(Icons.people, color: AppRes.appResMap[Co.COLOR_1],),
      ),
    );*/

    /*listaOpciones.add(
      OpcionGaveta(
        opcion: 'Clientes',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UIClientesForma()));

        },
        widget: Icon(Icons.streetview, color: AppRes.appResMap[Co.COLOR_1],),
      ),
    );*/

    /*listaOpciones.add(
      OpcionGaveta(
        opcion: 'Reservaciones',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UIReservacionesForma()));

        },
        widget: Icon(Icons.featured_play_list, color: AppRes.appResMap[Co.COLOR_1],),
      ),
    );*/

    /*listaOpciones.add(
      OpcionGaveta(
        opcion: 'Estado de Reservaciones',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UIEstadosReservacionesForma()));

        },
        widget: Icon(Icons.spellcheck, color: AppRes.appResMap[Co.COLOR_1],),
      ),
    );*/

    listaOpciones.add(
      OpcionGaveta(
        opcion: 'Paquetería',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UIPaqueteriaForma()));

        },
        widget: Icon(Icons.contact_mail, color: AppRes.appResMap[Co.COLOR_1],),
      ),
    );

    /*listaOpciones.add(
      OpcionGaveta(
        opcion: 'Origenes de Paquetes',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UIOrigenesPaquetesForma()));

        },
        widget: Icon(Icons.group_work, color: AppRes.appResMap[Co.COLOR_1],),
      ),
    );*/

    /*listaOpciones.add(
      OpcionGaveta(
        opcion: 'Chat',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UIMensajes()));

        },
        widget: Icon(Icons.message, color: AppRes.appResMap[Co.COLOR_1],),
      ),
    );*/

    listaOpciones.add(
      OpcionGaveta(
        opcion: 'Cerrar Sesión',
        onTap: () {
          cerrarSesion(this.context, DEM.cerrarSesion);
//          Navigator.popUntil(context, ModalRoute.withName(Ingresar.ruta));
        },
        widget: Icon(Icons.lock, color: AppRes.appResMap[Co.COLOR_1],),
//        widget: ImagenRecurso('candado_negro.png'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    cargarOpcionesGaveta();

    return Drawer(
      elevation: 4.0,
      child: Stack(
        children: <Widget>[

          FondoGaveta(context),

          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                ],
              ),
            ],
          ),
          ListView.builder(
            itemCount: listaOpciones == null ? 0 : listaOpciones.length,
            itemBuilder: (BuildContext context, int index) {
              if (listaOpciones[index].opcion == '-') {
                return Divider(color: AppRes.appResMap[Co.COLOR_1],);
              } else {
                  return ListTile(
                    contentPadding: const EdgeInsets.only(top: 5.0, left: 10.0),
                    leading: listaOpciones[index].widget,
                    title: Container(
                      child: Text(
                        listaOpciones[index].opcion,
                        style: estiloTituloPantalla.copyWith(
                            fontFamily: Co.FONT_1M,
                            color: AppRes.appResMap[Co.COLOR_1],
                            fontSize: 20.0),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      if (listaOpciones[index].onTap != null)
                        listaOpciones[index].onTap();
                    },
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
