/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad HistoricosCerraduras -> Histórico de Cerradura
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class HistoricoCerradura {
  HistoricoCerradura({
    this.key = '',
    this.id,
    this.cerradura,
    this.fecha,
    this.hora,
    this.usuario,
    this.funcion,
    this.notas,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  Cerradura cerradura;  // Id [Búsqueda: int]
  DateTime fecha;  // Fecha [Fecha: DateTime]
  TimeOfDay hora;  // Hora [Hora: TimeOfDay]
  int usuario;  // Id [Búsqueda: int]
  String funcion;  // Nota [Texto Variable: String]
  String notas;  // Notas [Texto Variable: String]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[HISTORICOSCERRADURAS.ID];

    // Cerraduras
    if (value[HISTORICOSCERRADURAS.CERRADURA] != null) {
      if (this.cerradura == null) {
        this.cerradura = Cerradura();
      }
      this.cerradura.fromKeyValue(key, value[HISTORICOSCERRADURAS.CERRADURA]);
    } else {
      this.cerradura = null;
    }

    this.fecha = LeerFecha(value[HISTORICOSCERRADURAS.FECHA]);
    this.hora = LeerHora(value[HISTORICOSCERRADURAS.HORA]);
    this.usuario = value[HISTORICOSCERRADURAS.USUARIO];
    this.funcion = value[HISTORICOSCERRADURAS.FUNCION];
    this.notas = value[HISTORICOSCERRADURAS.NOTAS];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      HISTORICOSCERRADURAS.ID: this.id,
      HISTORICOSCERRADURAS.CERRADURA: this.cerradura == null ? null : this.cerradura.toJson(),
      HISTORICOSCERRADURAS.FECHA: this.fecha == null ? null : GuardarFecha(this.fecha),
      HISTORICOSCERRADURAS.HORA: this.hora == null ? null : GuardarHora(this.hora),
      HISTORICOSCERRADURAS.USUARIO: this.usuario,
      HISTORICOSCERRADURAS.FUNCION: this.funcion,
      HISTORICOSCERRADURAS.NOTAS: this.notas,
    };
  }

  assign(HistoricoCerradura historicoCerradura) {

    if (historicoCerradura == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.cerradura = null; //Cerradura();
      this.fecha = null; //DateTime.now();
      this.hora = null; //DateTime.now();
      this.usuario = null; //0;
      this.funcion = null; //'';
      this.notas = null; //'';
    } else {
      this.key = historicoCerradura.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = historicoCerradura.id;

      // Cerraduras
      if (historicoCerradura.cerradura != null) {
        if (this.cerradura == null) {
          this.cerradura = Cerradura();
        }
        this.cerradura.assign(historicoCerradura.cerradura);
      } else {
        this.cerradura = null;
      }

      this.fecha = historicoCerradura.fecha;
      this.hora = historicoCerradura.hora;
      this.usuario = historicoCerradura.usuario;
      this.funcion = historicoCerradura.funcion;
      this.notas = historicoCerradura.notas;
    }
  }

  Map toMap() {
    Map map = {
      HISTORICOSCERRADURAS.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      HISTORICOSCERRADURAS.ID: this.id,
      HISTORICOSCERRADURAS.CERRADURA: this.cerradura == null ? null : this.cerradura.toMap(),
      HISTORICOSCERRADURAS.FECHA: this.fecha == null ? null : GuardarFecha(this.fecha),
      HISTORICOSCERRADURAS.HORA: this.hora == null ? null : GuardarHora(this.hora),
      HISTORICOSCERRADURAS.USUARIO: this.usuario,
      HISTORICOSCERRADURAS.FUNCION: this.funcion,
      HISTORICOSCERRADURAS.NOTAS: this.notas,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[HISTORICOSCERRADURAS.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = map[HISTORICOSCERRADURAS.ID];

    // Cerraduras
    if (map[HISTORICOSCERRADURAS.CERRADURA] != null) {
      if (this.cerradura == null) {
        this.cerradura = Cerradura();
      }
      this.cerradura.fromMap(map[HISTORICOSCERRADURAS.CERRADURA]);
    } else {
      this.cerradura = null;
    }

    this.fecha = map[HISTORICOSCERRADURAS.FECHA] == null ? null : LeerFecha(map[HISTORICOSCERRADURAS.FECHA]);
    this.hora = map[HISTORICOSCERRADURAS.HORA] == null ? null : LeerHora(map[HISTORICOSCERRADURAS.HORA]);
    this.usuario = map[HISTORICOSCERRADURAS.USUARIO];
    this.funcion = map[HISTORICOSCERRADURAS.FUNCION];
    this.notas = map[HISTORICOSCERRADURAS.NOTAS];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final HistoricoCerradura typedOther = other;
    return
        id == typedOther.id &&
        cerradura == typedOther.cerradura &&
        fecha == typedOther.fecha &&
        hora == typedOther.hora &&
        usuario == typedOther.usuario &&
        funcion == typedOther.funcion &&
        notas == typedOther.notas;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      cerradura.hashCode,
      fecha.hashCode,
      hora.hashCode,
      usuario.hashCode,
      funcion.hashCode,
      notas.hashCode,
  ]);

}

//==============================================================================
class HISTORICOSCERRADURAS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Históricos de Cerraduras';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Histórico de Cerradura';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_CERRADURA = 'Cerradura';
  static const String ETIQUETA_FECHA = 'Fecha';
  static const String ETIQUETA_HORA = 'Hora';
  static const String ETIQUETA_USUARIO = 'Usuario';
  static const String ETIQUETA_FUNCION = 'Función';
  static const String ETIQUETA_NOTAS = 'Notas';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'HistoricosCerraduras';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'HistoricoCerradura';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ID = 'id';
  static const String CERRADURA = 'cerradura';
  static const String FECHA = 'fecha';
  static const String HORA = 'hora';
  static const String USUARIO = 'usuario';
  static const String FUNCION = 'funcion';
  static const String NOTAS = 'notas';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, ID, CERRADURA, FECHA, HORA, USUARIO, FUNCION,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, CERRADURA, FECHA, HORA, USUARIO, FUNCION, NOTAS,];

}
