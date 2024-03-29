/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad EstadosReservaciones -> Estado de Reservación
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class EstadoReservacion {
  EstadoReservacion({
    this.key = '',
    this.id,
    this.denomEstadoReservacion,
    this.descEstadoReservacion,
    this.visible,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  String denomEstadoReservacion;  // Denominación 200 No Nulo [Texto Variable: String]
  String descEstadoReservacion;  // Descripción Blob [Memo: String]
  bool visible;  // Lógico [Lógico: bool]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[ESTADOSRESERVACIONES.ID];
    this.denomEstadoReservacion = value[ESTADOSRESERVACIONES.DENOMESTADORESERVACION];
    this.descEstadoReservacion = value[ESTADOSRESERVACIONES.DESCESTADORESERVACION];
    this.visible = value[ESTADOSRESERVACIONES.VISIBLE];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      ESTADOSRESERVACIONES.ID: this.id,
      ESTADOSRESERVACIONES.DENOMESTADORESERVACION: this.denomEstadoReservacion,
      ESTADOSRESERVACIONES.DESCESTADORESERVACION: this.descEstadoReservacion,
      ESTADOSRESERVACIONES.VISIBLE: this.visible,
    };
  }

  assign(EstadoReservacion estadoReservacion) {

    if (estadoReservacion == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.denomEstadoReservacion = null; //'';
      this.descEstadoReservacion = null; //'';
      this.visible = null; //false;
    } else {
      this.key = estadoReservacion.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = estadoReservacion.id;
      this.denomEstadoReservacion = estadoReservacion.denomEstadoReservacion;
      this.descEstadoReservacion = estadoReservacion.descEstadoReservacion;
      this.visible = estadoReservacion.visible;
    }
  }

  Map toMap() {
    Map map = {
      ESTADOSRESERVACIONES.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      ESTADOSRESERVACIONES.ID: this.id,
      ESTADOSRESERVACIONES.DENOMESTADORESERVACION: this.denomEstadoReservacion,
      ESTADOSRESERVACIONES.DESCESTADORESERVACION: this.descEstadoReservacion,
      ESTADOSRESERVACIONES.VISIBLE: this.visible,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[ESTADOSRESERVACIONES.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = map[ESTADOSRESERVACIONES.ID];
    this.denomEstadoReservacion = map[ESTADOSRESERVACIONES.DENOMESTADORESERVACION];
    this.descEstadoReservacion = map[ESTADOSRESERVACIONES.DESCESTADORESERVACION];
    this.visible = map[ESTADOSRESERVACIONES.VISIBLE];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final EstadoReservacion typedOther = other;
    return
        id == typedOther.id &&
        denomEstadoReservacion == typedOther.denomEstadoReservacion &&
        descEstadoReservacion == typedOther.descEstadoReservacion &&
        visible == typedOther.visible;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      denomEstadoReservacion.hashCode,
      descEstadoReservacion.hashCode,
      visible.hashCode,
  ]);

}

//==============================================================================
class ESTADOSRESERVACIONES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Estados de Reservaciones';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Estado de Reservación';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_DENOMESTADORESERVACION = 'Denominación del Estado de Reservación';
  static const String ETIQUETA_DESCESTADORESERVACION = 'Descripción del Estado de Reservación';
  static const String ETIQUETA_VISIBLE = 'Visible';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'EstadosReservaciones';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'EstadoReservacion';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ID = 'id';
  static const String DENOMESTADORESERVACION = 'denomEstadoReservacion';
  static const String DESCESTADORESERVACION = 'descEstadoReservacion';
  static const String VISIBLE = 'visible';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, ID, DENOMESTADORESERVACION, VISIBLE,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, DENOMESTADORESERVACION, DESCESTADORESERVACION, VISIBLE,];

}
