/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad LogsCerraduras -> Log de Cerradura
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class LogCerradura {
  LogCerradura({
    this.id,
    this.cerradura,
    this.fecha,
    this.hora,
    this.detLog,
  });

  int id;
  Cerradura cerradura;
  DateTime fecha;
  TimeOfDay hora;
  String detLog;

  fromKeyValue(String key, Map value) {
    this.id = value[LOGSCERRADURAS.ID];
    this.cerradura.fromKeyValue(key, value[LOGSCERRADURAS.CERRADURA]);
    this.fecha = new DateTime.fromMillisecondsSinceEpoch(value[LOGSCERRADURAS.FECHA]);
    this.hora = new TimeOfDay.fromDateTime(new DateTime.fromMillisecondsSinceEpoch(value[LOGSCERRADURAS.HORA]));
    this.detLog = value[LOGSCERRADURAS.DETLOG];
  }

  toJson() {
    return {
      LOGSCERRADURAS.ID: this.id,
      LOGSCERRADURAS.CERRADURA: this.cerradura.toJson(),
      LOGSCERRADURAS.FECHA: this.fecha == null ? null : this.fecha.millisecondsSinceEpoch,
      LOGSCERRADURAS.HORA: this.hora == null ? null : (this.hora.hour * 60 * 60 * 1000) +
          (this.hora.minute * 60 * 1000) ,
      LOGSCERRADURAS.DETLOG: this.detLog,
    };
  }

  assign(LogCerradura logCerradura) {

    if (logCerradura == null) {
      this.id = null; //0;
      this.cerradura = null; //new Cerradura();
      this.fecha = null; //DateTime.now();
      this.hora = null; //DateTime.now();
      this.detLog = null; //'';
    } else {
      this.id = logCerradura.id;

      if (logCerradura.cerradura != null) {
        if (this.cerradura == null) {
          this.cerradura = Cerradura();
        }
        this.cerradura.assign(logCerradura.cerradura);
      } else {
        this.cerradura = null;
      }

      this.fecha = logCerradura.fecha;
      this.hora = logCerradura.hora;
      this.detLog = logCerradura.detLog;
    }
  }

  Map toMap() {
    Map map = {
      LOGSCERRADURAS.ID: this.id,
      LOGSCERRADURAS.CERRADURA: this.cerradura == null ? null : this.cerradura.toMap(),
      LOGSCERRADURAS.FECHA: this.fecha == null ? null : this.fecha.millisecondsSinceEpoch,
      LOGSCERRADURAS.HORA: this.hora == null ? null : (this.hora.hour * 60 * 60 * 1000) +
          (this.hora.minute * 60 * 1000) ,
      LOGSCERRADURAS.DETLOG: this.detLog,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.id = map[LOGSCERRADURAS.ID];
    if (map[LOGSCERRADURAS.CERRADURA] != null) {
      if (this.cerradura == null) {
        this.cerradura = Cerradura();
      }
      this.cerradura.fromMap(map[LOGSCERRADURAS.CERRADURA]);
    } else {
      this.cerradura = null;
    }
    this.fecha = map[LOGSCERRADURAS.FECHA];
    this.hora = map[LOGSCERRADURAS.HORA];
    this.detLog = map[LOGSCERRADURAS.DETLOG];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final LogCerradura typedOther = other;
    return
        id == typedOther.id &&
        cerradura == typedOther.cerradura &&
        fecha == typedOther.fecha &&
        hora == typedOther.hora &&
        detLog == typedOther.detLog;
  }


  @override
  int get hashCode => hashObjects([
      id.hashCode,
      cerradura.hashCode,
      fecha.hashCode,
      hora.hashCode,
      detLog.hashCode 
  ]);

}

//==============================================================================
class LOGSCERRADURAS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Logs de Cerraduras';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Log de Cerradura';

  // Etiquetas de los Atributos
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_CERRADURA = 'Cerradura';
  static const String ETIQUETA_FECHA = 'Fecha';
  static const String ETIQUETA_HORA = 'Hora';
  static const String ETIQUETA_DETLOG = 'Detalle del Log';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'LogsCerraduras';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'LogCerradura';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String ID = 'id';
  static const String CERRADURA = 'cerradura';
  static const String FECHA = 'fecha';
  static const String HORA = 'hora';
  static const String DETLOG = 'detLog';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [ID,CERRADURA,FECHA,HORA,DETLOG,];
  static const List CAMPOS_DETALLE = [ID,CERRADURA,FECHA,HORA,DETLOG,];

}
