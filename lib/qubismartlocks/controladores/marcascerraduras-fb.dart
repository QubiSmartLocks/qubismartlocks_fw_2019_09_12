/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad MarcasCerraduras -> Marca de Cerradura
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class MarcasCerradurasFB {

  static fb.DatabaseReference drMarcasCerraduras = DEM.db.ref( MARCASCERRADURAS.ENTIDAD );

  static Future guardarMarcaCerradura({MarcaCerradura marcaCerradura}) async {

    if (marcaCerradura.key == '') {
      marcaCerradura.key = drMarcasCerraduras.push().key;
    }
    await drMarcasCerraduras.child(marcaCerradura.key).update(marcaCerradura.toJson());
  }

  static Future borrarMarcaCerradura({MarcaCerradura marcaCerradura}) async {
    await drMarcasCerraduras.child(marcaCerradura.key).remove();
  }

  static init() async {
    await drMarcasCerraduras.remove();
    await InicializarMarcasCerraduras.init();
  }

  static todos(List<MarcaCerradura> lista) async {
    // Lista de Marcas de Cerraduras
    lista.clear();
    drMarcasCerraduras.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = MarcaCerradura();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
