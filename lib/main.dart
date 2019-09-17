/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: main.dart
 Inicio de la aplicacion
*/
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase/firebase.dart' as firebase;
import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:qubismartlocks_fw/splash.dart';


void main() {
  if (listaItemsMenuAdmin.length == 0) {
    OpcionesMenuAdmin.buildMenuItems();
  }
  runApp(MainApp());
}


final Map<String, WidgetBuilder> _kRoutes =
Map<String, WidgetBuilder>.fromIterable(
  listaItemsMenuAdmin,
  key: (item) => item.ruta,
  value: (item) => item.constructor,
);

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  _refrescar() {
    setState(() {});
  }

  Future<Null> inicio() async {
    initializeDateFormatting();
    await DEM.iniciar();
    //firebase.auth().signOut();
    DEM.refrescarMain = _refrescar;
  }

  @override
  void initState() {
    // Initialize Firebase
    DEM.app = firebase.initializeApp(
//      name: 'prueba',
      apiKey: "AIzaSyBUaOzLJ7gusvGzkIo8UXoTCq5gaVGYSDs",
      authDomain: "qubilocks-f36b6.firebaseapp.com",
      databaseURL: "https://qubilocks-f36b6.firebaseio.com",
      projectId: "qubilocks-f36b6",
      storageBucket: "qubilocks-f36b6.appspot.com",
      messagingSenderId: "716278979135",
//        appId: "1:716278979135:web:74a43796b01ed47f1c768a"
    );

    inicio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Map<String, WidgetBuilder> rutas = Map<String, WidgetBuilder>();

    rutas.addAll(_kRoutes);

    return MaterialApp(
      title: 'Qubi Smart Locks',
      // theme: iPhone,
      debugShowCheckedModeBanner: false,
      home: Material(
        type: MaterialType.transparency,
        child: _seleccionPantallaInicial(),
      ),
      routes: rutas,
    );
  }
}

Widget _seleccionPantallaInicial() {
  return StreamBuilder<firebase.User>(
    stream: firebase.auth().onAuthStateChanged,
    builder: (BuildContext context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return SplashPage();
      } else {
        if (snapshot.hasData &&
            snapshot.data.uid != '' &&
            Sesion.usuarioFb == null
            ) {
          Sesion.usuarioFb = snapshot.data;
        }
        if (Sesion.usuarioFb != null &&
                Sesion.usuarioFb.emailVerified &&
                Sesion.usuarioFire.autorizado
            // && Sesion.lConexionAutorizada
            ) {
//          return Inicio(
//            tipo: DEM.tipoUsr,
//          );
        }
        return Inicio(
          tipo: DEM.tipoUsr,
        );
        return IniciarSesion();
      }
    },
  );
}
