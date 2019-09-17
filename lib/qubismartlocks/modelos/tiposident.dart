/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad TiposIdent -> Tipo de Identificación
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class TipoIdent {
  TipoIdent({
    this.key = '',
    this.id,
    this.denomTipoIdent,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  String denomTipoIdent;  // Denominación 200 No Nulo [Texto Variable: String]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[TIPOSIDENT.ID];
    this.denomTipoIdent = value[TIPOSIDENT.DENOMTIPOIDENT];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      TIPOSIDENT.ID: this.id,
      TIPOSIDENT.DENOMTIPOIDENT: this.denomTipoIdent,
    };
  }

  assign(TipoIdent tipoIdent) {

    if (tipoIdent == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.denomTipoIdent = null; //'';
    } else {
      this.key = tipoIdent.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = tipoIdent.id;
      this.denomTipoIdent = tipoIdent.denomTipoIdent;
    }
  }

  Map toMap() {
    Map map = {
      TIPOSIDENT.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      TIPOSIDENT.ID: this.id,
      TIPOSIDENT.DENOMTIPOIDENT: this.denomTipoIdent,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[TIPOSIDENT.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = map[TIPOSIDENT.ID];
    this.denomTipoIdent = map[TIPOSIDENT.DENOMTIPOIDENT];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final TipoIdent typedOther = other;
    return
        id == typedOther.id &&
        denomTipoIdent == typedOther.denomTipoIdent;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      denomTipoIdent.hashCode,
  ]);

}

//==============================================================================
class TIPOSIDENT {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Tipos de Identificación';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Tipo de Identificación';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_DENOMTIPOIDENT = 'Denominación del Tipo de Identificación';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'TiposIdent';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'TipoIdent';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ID = 'id';
  static const String DENOMTIPOIDENT = 'denomTipoIdent';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, ID, DENOMTIPOIDENT,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, DENOMTIPOIDENT,];

}
