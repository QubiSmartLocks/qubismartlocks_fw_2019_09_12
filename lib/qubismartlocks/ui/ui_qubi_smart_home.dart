import 'package:qubismartlocks_fw/qubismartlocks.dart';

import '../fake-data.dart';

class OpcionQubi {
  OpcionQubi(this.orden, this.texto, this.ruta, {this.color = Colors.transparent});

  int orden;
  Color color;
  String texto;
  String ruta;
}



class UIQubiSmartHome extends StatefulWidget {
  @override
  _UIQubiSmartHomeState createState() => _UIQubiSmartHomeState();
}

class _UIQubiSmartHomeState extends State<UIQubiSmartHome> {

  List<OpcionQubi> opciones;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (opciones == null) {
      opciones  = List<OpcionQubi>();
      opciones.add(OpcionQubi(1, 'Habitaciones', UIUnidadesFuncionalesForma.ruta));
      opciones.add(OpcionQubi(2, 'Clientes', UIClientesForma.ruta));
      opciones.add(OpcionQubi(3, 'Reservaciones', UIReservacionesForma.ruta));
      opciones.add(OpcionQubi(7, 'Paquetería', UIPaqueteriaForma.ruta));
      opciones.add(OpcionQubi(8, 'Chat', UIMensajesForma.ruta));
      opciones.add(OpcionQubi(9, 'Administración', Inicio.ruta));
      opciones.add(OpcionQubi(4, '', ''));
      opciones.add(OpcionQubi(5, '', ''));
      opciones.add(OpcionQubi(6, '', ''));
      // Siempre, de todas maneras, re-ordenamos la lista por el atributo orden
      opciones.sort((a,b) => a.orden.compareTo(b.orden));
    }
    CD.iniciar(context);
    App.variables.calcular(context);
    DEM.fakeData = FakeData();

//    print('Usuario Activo: ${DEM.fakeData.usuarioActivo.nombres}');
//    print('Recepcionista: ${DEM.fakeData.recepcionista.nombres}');

    double ladoMayor = CD.minimo * 0.7;
    double margenMayor = CD.minimo * 0.15;
    String x = '(c) 2019, Qubi - Todos los derechos reservados.';
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 25),
            //margin: EdgeInsets.only(top: margenMayor, right: margenMayor, left: CD.ancho-ladoMayor-margenMayor*2),
            height: MediaQuery.of(context).size.height * 1.0,
            width: MediaQuery.of(context).size.width * .3,
            color: Colors.transparent,
            child: Image.asset(
              'images/Qubi.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: margenMayor,
                right: margenMayor,
                left: CD.ancho - ladoMayor - margenMayor * 2),
            height: ladoMayor,
            width: ladoMayor,
            color: Colors.transparent,
            child: Image.asset(
              'images/logoQ.jpg',
              fit: BoxFit.cover,
            ),
          ),
          UIQubiMenu(opciones: opciones),
          Container(
            padding: EdgeInsets.only(right: 30, bottom: 15),
            alignment: Alignment.bottomRight,
            child: Text(
              x,
//              'Todos los derechos reservados',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}