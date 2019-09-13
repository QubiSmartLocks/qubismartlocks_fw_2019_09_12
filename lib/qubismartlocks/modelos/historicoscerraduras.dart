/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad HistoricosCerraduras -> Histórico de Cerradura
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class HistoricoCerradura {
  HistoricoCerradura({
    this.id,
    this.cerradura,
    this.fecha,
    this.hora,
    this.usuario,
    this.funcion,
    this.notas,
  });

  int id;
  Cerradura cerradura;
  DateTime fecha;
  TimeOfDay hora;
  int usuario;
  String funcion;
  String notas;

  fromKeyValue(String key, Map value) {
    this.id = value[HISTORICOSCERRADURAS.ID];
    this.cerradura.fromKeyValue(key, value[HISTORICOSCERRADURAS.CERRADURA]);
    this.fecha = new DateTime.fromMillisecondsSinceEpoch(value[HISTORICOSCERRADURAS.FECHA]);
    this.hora = new TimeOfDay.fromDateTime(new DateTime.fromMillisecondsSinceEpoch(value[HISTORICOSCERRADURAS.HORA]));
    this.usuario = value[HISTORICOSCERRADURAS.USUARIO];
    this.funcion = value[HISTORICOSCERRADURAS.FUNCION];
    this.notas = value[HISTORICOSCERRADURAS.NOTAS];
  }

  toJson() {
    return {
      HISTORICOSCERRADURAS.ID: this.id,
      HISTORICOSCERRADURAS.CERRADURA: this.cerradura.toJson(),
      HISTORICOSCERRADURAS.FECHA: this.fecha == null ? null : this.fecha.millisecondsSinceEpoch,
      HISTORICOSCERRADURAS.HORA: this.hora == null ? null : (this.hora.hour * 60 * 60 * 1000) +
          (this.hora.minute * 60 * 1000) ,
      HISTORICOSCERRADURAS.USUARIO: this.usuario,
      HISTORICOSCERRADURAS.FUNCION: this.funcion,
      HISTORICOSCERRADURAS.NOTAS: this.notas,
    };
  }

  assign(HistoricoCerradura historicoCerradura) {

    if (historicoCerradura == null) {
      this.id = null; //0;
      this.cerradura = null; //new Cerradura();
      this.fecha = null; //DateTime.now();
      this.hora = null; //DateTime.now();
      this.usuario = null; //0;
      this.funcion = null; //'';
      this.notas = null; //'';
    } else {
      this.id = historicoCerradura.id;

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
      HISTORICOSCERRADURAS.ID: this.id,
      HISTORICOSCERRADURAS.CERRADURA: this.cerradura == null ? null : this.cerradura.toMap(),
      HISTORICOSCERRADURAS.FECHA: this.fecha == null ? null : this.fecha.millisecondsSinceEpoch,
      HISTORICOSCERRADURAS.HORA: this.hora == null ? null : (this.hora.hour * 60 * 60 * 1000) +
          (this.hora.minute * 60 * 1000) ,
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
    this.id = map[HISTORICOSCERRADURAS.ID];
    if (map[HISTORICOSCERRADURAS.CERRADURA] != null) {
      if (this.cerradura == null) {
        this.cerradura = Cerradura();
      }
      this.cerradura.fromMap(map[HISTORICOSCERRADURAS.CERRADURA]);
    } else {
      this.cerradura = null;
    }
    this.fecha = map[HISTORICOSCERRADURAS.FECHA];
    this.hora = map[HISTORICOSCERRADURAS.HORA];
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
      notas.hashCode 
  ]);

}

//==============================================================================
class HISTORICOSCERRADURAS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Históricos de Cerraduras';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Histórico de Cerradura';

  // Etiquetas de los Atributos
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

  static const List CAMPOS_LISTADO = [ID,CERRADURA,FECHA,HORA,USUARIO,FUNCION,];
  static const List CAMPOS_DETALLE = [ID,CERRADURA,FECHA,HORA,USUARIO,FUNCION,NOTAS,];

}
