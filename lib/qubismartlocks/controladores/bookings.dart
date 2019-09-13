// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad Bookings
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Bookings {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<Booking> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(BOOKINGS.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        Booking booking = Booking();
        booking.fromMap(mapa);
        laLista.add(booking);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, Booking booking) async {
    Resultado _resultado = await DEM.api.getRecord(BOOKINGS.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      booking.fromMap(_resultado.objeto);
      _resultado.objeto = booking;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(Booking booking) async {
    Resultado _resultado;
    Map mapa = booking.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (booking.id == null || booking.id == 0) {
      _resultado = await DEM.api.postRecord(
          BOOKINGS.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          BOOKINGS.ENDPOINT.toLowerCase() + booking.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      booking.fromMap(_objeto);  
      _resultado.objeto = booking;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(Booking booking) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        BOOKINGS.ENDPOINT.toLowerCase() + booking.id.toString());
    if (_resultado.estado == Co.OK) {
      booking.fromMap(_resultado.objeto);
      _resultado.objeto = booking;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<Booking> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
