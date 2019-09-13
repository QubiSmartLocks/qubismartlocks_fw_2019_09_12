/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad TiposIdent -> Tipo de Identificación
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class TipoIdent {
  TipoIdent({
    this.id,
    this.denomTipoIdent,
  });

  int id;
  String denomTipoIdent;

  fromKeyValue(String key, Map value) {
    this.id = value[TIPOSIDENT.ID];
    this.denomTipoIdent = value[TIPOSIDENT.DENOMTIPOIDENT];
  }

  toJson() {
    return {
      TIPOSIDENT.ID: this.id,
      TIPOSIDENT.DENOMTIPOIDENT: this.denomTipoIdent,
    };
  }

  assign(TipoIdent tipoIdent) {

    if (tipoIdent == null) {
      this.id = null; //0;
      this.denomTipoIdent = null; //'';
    } else {
      this.id = tipoIdent.id;
      this.denomTipoIdent = tipoIdent.denomTipoIdent;
    }
  }

  Map toMap() {
    Map map = {
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
      denomTipoIdent.hashCode 
  ]);

}

//==============================================================================
class TIPOSIDENT {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Tipos de Identificación';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Tipo de Identificación';

  // Etiquetas de los Atributos
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_DENOMTIPOIDENT = 'Denominación del Tipo de Identificación';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'TiposIdent';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'TipoIdent';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String ID = 'id';
  static const String DENOMTIPOIDENT = 'denomTipoIdent';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [ID,DENOMTIPOIDENT,];
  static const List CAMPOS_DETALLE = [ID,DENOMTIPOIDENT,];

}
