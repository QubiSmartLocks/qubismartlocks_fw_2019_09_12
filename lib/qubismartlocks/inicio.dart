// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: inicio.dart
// Pantalla de Inicio de la aplicacion


import 'package:qubismartlocks_fw/qubismartlocks.dart';

const double _kFlexibleSpaceMaxHeight = 256.0;

class Inicio extends StatefulWidget {
  Inicio({this.tipo});

  static const String ruta = '/home';

  final TipoUsr tipo;

  @override
  _InicioState createState() => new _InicioState();
}

class _InicioState extends State<Inicio> {
  _changeState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    App.variables.calcular(context);

    final adminButton = FloatingActionButton(
      child: Icon(Icons.menu),
      backgroundColor: AppRes.appResMap[Co.FONDO_2],
      foregroundColor: AppRes.appResMap[Co.COLOR_2],
      onPressed: () {
        Navigator.pushNamed(context, InicioAdmin.ruta);
      },
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: widget.tipo == TipoUsr.ADM ? adminButton : null,
      drawer: UIMenuGaveta(context),
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.FONDO_1],
//        iconTheme: IconThemeData(color: AppRes.appResMap[Co.FONDO_1]),
//        actions: <Widget>[
//          Text(
//            'Acción 1',
//            style: estiloTituloPantalla.copyWith(
//              fontSize: 12,
//            ),
//          ),
//          Text(
//            'Acción 2',
//            style: estiloTituloPantalla.copyWith(
//              fontSize: 12,
//            ),
//          ),
//        ],
        title: Text(
          AppRes.appResMap[Co.APP_DENOM],
          style: estiloTituloPantalla,
        ),
//        titleSpacing: 50.0,
      ),
//      bottomNavigationBar: UIBotonesInicioGestor(),
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            pinned: true,
            backgroundColor: Colors.transparent,
            expandedHeight: _kFlexibleSpaceMaxHeight,
            flexibleSpace: new FlexibleSpaceBar(
              centerTitle: true,
              title: new Text(AppRes.appResMap[Co.APP_DENOM],
                style: estiloTituloPantalla.copyWith(
                    color: AppRes.appResMap[Co.COLOR_2], height: 32),),
              // TODO(abarth): Wire up to the parallax in a way that doesn't pop during hero transition.
              background: UIBackground(
                  fondo: AppRes.appResMap[Co.BACKGROUND_ADMIN], fit: BoxFit.fitWidth),
              // const _AppBarBackground(animation: kAlwaysDismissedAnimation),
            ),
          ),
          new SliverList(delegate: new SliverChildListDelegate(
              listaItemsMenuAdmin)),
        ],
      )
    );
  }
}
