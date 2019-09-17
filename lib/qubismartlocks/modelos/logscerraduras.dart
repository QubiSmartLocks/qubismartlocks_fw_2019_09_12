/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad LogsCerraduras -> Log de Cerradura
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class LogCerradura {
  LogCerradura({
    this.key = '',
    this.id,
    this.cerradura,
    this.fecha,
    this.hora,
    this.detLog,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  Cerradura cerradura;  // Id [Búsqueda: int]
  DateTime fecha;  // Fecha [Fecha: DateTime]
  TimeOfDay hora;  // Hora [Hora: TimeOfDay]
  String detLog;  // Nota [Texto Variable: String]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[LOGSCERRADURAS.ID];

    // Cerraduras
    if (value[LOGSCERRADURAS.CERRADURA] != null) {
      if (this.cerradura == null) {
        this.cerradura = Cerradura();
      }
      this.cerradura.fromKeyValue(key, value[LOGSCERRADURAS.CERRADURA]);
    } else {
      this.cerradura = null;
    }

    this.fecha = LeerFecha(value[LOGSCERRADURAS.FECHA]);
    this.hora = LeerHora(value[LOGSCERRADURAS.HORA]);
    this.detLog = value[LOGSCERRADURAS.DETLOG];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      LOGSCERRADURAS.ID: this.id,
      LOGSCERRADURAS.CERRADURA: this.cerradura == null ? null : this.cerradura.toJson(),
      LOGSCERRADURAS.FECHA: this.fecha == null ? null : GuardarFecha(this.fecha),
      LOGSCERRADURAS.HORA: this.hora == null ? null : GuardarHora(this.hora),
      LOGSCERRADURAS.DETLOG: this.detLog,
    };
  }

  assign(LogCerradura logCerradura) {

    if (logCerradura == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.cerradura = null; //Cerradura();
      this.fecha = null; //DateTime.now();
      this.hora = null; //DateTime.now();
      this.detLog = null; //'';
    } else {
      this.key = logCerradura.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = logCerradura.id;

      // Cerraduras
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
      LOGSCERRADURAS.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      LOGSCERRADURAS.ID: this.id,
      LOGSCERRADURAS.CERRADURA: this.cerradura == null ? null : this.cerradura.toMap(),
      LOGSCERRADURAS.FECHA: this.fecha == null ? null : GuardarFecha(this.fecha),
      LOGSCERRADURAS.HORA: this.hora == null ? null : GuardarHora(this.hora),
      LOGSCERRADURAS.DETLOG: this.detLog,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[LOGSCERRADURAS.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = map[LOGSCERRADURAS.ID];

    // Cerraduras
    if (map[LOGSCERRADURAS.CERRADURA] != null) {
      if (this.cerradura == null) {
        this.cerradura = Cerradura();
      }
      this.cerradura.fromMap(map[LOGSCERRADURAS.CERRADURA]);
    } else {
      this.cerradura = null;
    }

    this.fecha = map[LOGSCERRADURAS.FECHA] == null ? null : LeerFecha(map[LOGSCERRADURAS.FECHA]);
    this.hora = map[LOGSCERRADURAS.HORA] == null ? null : LeerHora(map[LOGSCERRADURAS.HORA]);
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
      detLog.hashCode,
  ]);

}

//==============================================================================
class LOGSCERRADURAS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Logs de Cerraduras';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Log de Cerradura';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
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
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
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

  static const List CAMPOS_LISTADO = [
 KEY, ID, CERRADURA, FECHA, HORA, DETLOG,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, CERRADURA, FECHA, HORA, DETLOG,];

}
