/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Cerraduras
 [Qubi Smart Locks/Qubi Smart Locks/Cerraduras]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UICerradurasForma extends StatefulWidget {
  static const String ruta = '/ui-cerraduras/forma';

  @override
  _UICerradurasFormaState createState() => _UICerradurasFormaState();
}

class _UICerradurasFormaState extends State<UICerradurasForma> {

  _nuevocerradura() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UICerraduraEdicion(registro: Cerradura())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_CERRADURAS_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_CERRADURAS_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_CERRADURAS_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_CERRADURAS_TITULO],
      onTapAdd: _nuevocerradura,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UICerradurasLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevocerradura),
        ],
      ),
    );
  }
}
