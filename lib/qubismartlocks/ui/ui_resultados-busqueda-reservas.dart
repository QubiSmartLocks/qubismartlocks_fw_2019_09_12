import 'package:qubismartlocks_fw/qubismartlocks.dart';

//String dropdownValue = 'Todas';

//void main() => runApp(UIResultadosBusquedaReservas());

class UIResultadosBusquedaReservas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //debugShowMaterialGrid: true,
        title: 'Material App',
        home: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return MediaQuery.of(context).size.width > 800
                ? UIResultadosBusquedaReservasBig(DEM.listaReservaciones)
                : UIResultadosBusquedaReservasSmall(DEM.listaReservaciones);
          },
        ));
  }
}

