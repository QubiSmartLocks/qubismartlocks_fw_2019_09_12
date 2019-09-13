/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Marcas de Cerraduras
 [Qubi Smart Locks/Qubi Smart Locks/Marcas de Cerraduras]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIMarcasCerradurasForma extends StatefulWidget {
  static const String ruta = '/ui-marcascerraduras/forma';

  @override
  _UIMarcasCerradurasFormaState createState() => _UIMarcasCerradurasFormaState();
}

class _UIMarcasCerradurasFormaState extends State<UIMarcasCerradurasForma> {

  _nuevomarcacerradura() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIMarcaCerraduraEdicion(registro: MarcaCerradura())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_MARCASCERRADURAS_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_MARCASCERRADURAS_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_MARCASCERRADURAS_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_MARCASCERRADURAS_TITULO],
      onTapAdd: _nuevomarcacerradura,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIMarcasCerradurasLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevomarcacerradura),
        ],
      ),
    );
  }
}
