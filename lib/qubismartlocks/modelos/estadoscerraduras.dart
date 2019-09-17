/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad EstadosCerraduras -> Estado de Cerradura
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class EstadoCerradura {
  EstadoCerradura({
    this.key = '',
    this.id,
    this.denomEstadoCerradura,
    this.activa,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  String denomEstadoCerradura;  // Denominación 200 No Nulo [Texto Variable: String]
  bool activa;  // Lógico [Lógico: bool]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[ESTADOSCERRADURAS.ID];
    this.denomEstadoCerradura = value[ESTADOSCERRADURAS.DENOMESTADOCERRADURA];
    this.activa = value[ESTADOSCERRADURAS.ACTIVA];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      ESTADOSCERRADURAS.ID: this.id,
      ESTADOSCERRADURAS.DENOMESTADOCERRADURA: this.denomEstadoCerradura,
      ESTADOSCERRADURAS.ACTIVA: this.activa,
    };
  }

  assign(EstadoCerradura estadoCerradura) {

    if (estadoCerradura == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.denomEstadoCerradura = null; //'';
      this.activa = null; //false;
    } else {
      this.key = estadoCerradura.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = estadoCerradura.id;
      this.denomEstadoCerradura = estadoCerradura.denomEstadoCerradura;
      this.activa = estadoCerradura.activa;
    }
  }

  Map toMap() {
    Map map = {
      ESTADOSCERRADURAS.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      ESTADOSCERRADURAS.ID: this.id,
      ESTADOSCERRADURAS.DENOMESTADOCERRADURA: this.denomEstadoCerradura,
      ESTADOSCERRADURAS.ACTIVA: this.activa,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[ESTADOSCERRADURAS.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = map[ESTADOSCERRADURAS.ID];
    this.denomEstadoCerradura = map[ESTADOSCERRADURAS.DENOMESTADOCERRADURA];
    this.activa = map[ESTADOSCERRADURAS.ACTIVA];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final EstadoCerradura typedOther = other;
    return
        id == typedOther.id &&
        denomEstadoCerradura == typedOther.denomEstadoCerradura &&
        activa == typedOther.activa;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      denomEstadoCerradura.hashCode,
      activa.hashCode,
  ]);

}

//==============================================================================
class ESTADOSCERRADURAS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Estados de Cerraduras';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Estado de Cerradura';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_DENOMESTADOCERRADURA = 'Denominación del Estado de Cerradura';
  static const String ETIQUETA_ACTIVA = 'Activa';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'EstadosCerraduras';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'EstadoCerradura';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ID = 'id';
  static const String DENOMESTADOCERRADURA = 'denomEstadoCerradura';
  static const String ACTIVA = 'activa';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, ID, DENOMESTADOCERRADURA, ACTIVA,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, DENOMESTADOCERRADURA, ACTIVA,];

}
