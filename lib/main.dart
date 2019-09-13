// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: main.dart
// Inicio de la aplicacion

import 'package:flutter_web/material.dart';
// AppPacks
import 'package:appadminweb/appadminweb.dart';
import 'package:appresweb/appresweb.dart';
// Aplicacion Qubi Smart Locks
import 'package:qubismartlocks_fw/qubismartlocks/dem.dart';
import 'package:qubismartlocks_fw/qubismartlocks/iniciar-sesion.dart';
import 'package:qubismartlocks_fw/qubismartlocks/inicio.dart';
import 'package:qubismartlocks_fw/qubismartlocks/menu-admin.dart';
//import 'package:qubismartlocks_fw/qubismartlocks/ui/_ui.dart';

import 'package:intl/date_symbol_data_local.dart';


bool lInicio = true;

void main() {
  if (listaItemsMenuAdmin.length == 0) {
    OpcionesMenuAdmin.buildMenuItems();
  }

  runApp(MainApp());
}

final Map<String, WidgetBuilder> _kRoutes =
new Map<String, WidgetBuilder>.fromIterable(
  listaItemsMenuAdmin,
  key: (item) => item.ruta,
  value: (item) => item.constructor,
);

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  Future<Null> inicio() async {
    initializeDateFormatting();
//    BaseDatos basedatos = new BaseDatos();
//    basedatos.inicializar();
//    localPath();
//    DataModule dm = new DataModule();
//    dm.iniciar();
//    Sesion.iniciar();  // Se ha comentado porque sólo se puede iniciar si se ha Iniciado Sesión
  }

  @override
  Widget build(BuildContext context) {
    if (lInicio) {
      lInicio = false;
      inicio();
    }

    Map<String, WidgetBuilder> rutas = new Map<String, WidgetBuilder>();

    rutas.addAll(_kRoutes);

    return new MaterialApp(
      title: 'Qubi Smart Locks',
//      theme: iPhone,
      debugShowCheckedModeBanner: false,
      home: new Material(
        type: MaterialType.transparency,
//          DEM.iniciar();
        child: Inicio(tipo: DEM.tipoUsr,),
      ),
      routes: rutas,
    );
  }
}

