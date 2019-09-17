/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad TiposEdificaciones -> Tipo de Edificación
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class TipoEdificacion {
  TipoEdificacion({
    this.key = '',
    this.id,
    this.denomTipoEdificacion,
    this.descTipoEdificacion,
    this.seZonifica,
    this.tieneMultiplesUnidadesFuncionales,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  String denomTipoEdificacion;  // Denominación 200 No Nulo [Texto Variable: String]
  String descTipoEdificacion;  // Descripción Blob [Memo: String]
  bool seZonifica;  // Lógico [Lógico: bool]
  bool tieneMultiplesUnidadesFuncionales;  // Lógico [Lógico: bool]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[TIPOSEDIFICACIONES.ID];
    this.denomTipoEdificacion = value[TIPOSEDIFICACIONES.DENOMTIPOEDIFICACION];
    this.descTipoEdificacion = value[TIPOSEDIFICACIONES.DESCTIPOEDIFICACION];
    this.seZonifica = value[TIPOSEDIFICACIONES.SEZONIFICA];
    this.tieneMultiplesUnidadesFuncionales = value[TIPOSEDIFICACIONES.TIENEMULTIPLESUNIDADESFUNCIONALES];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      TIPOSEDIFICACIONES.ID: this.id,
      TIPOSEDIFICACIONES.DENOMTIPOEDIFICACION: this.denomTipoEdificacion,
      TIPOSEDIFICACIONES.DESCTIPOEDIFICACION: this.descTipoEdificacion,
      TIPOSEDIFICACIONES.SEZONIFICA: this.seZonifica,
      TIPOSEDIFICACIONES.TIENEMULTIPLESUNIDADESFUNCIONALES: this.tieneMultiplesUnidadesFuncionales,
    };
  }

  assign(TipoEdificacion tipoEdificacion) {

    if (tipoEdificacion == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.denomTipoEdificacion = null; //'';
      this.descTipoEdificacion = null; //'';
      this.seZonifica = null; //false;
      this.tieneMultiplesUnidadesFuncionales = null; //false;
    } else {
      this.key = tipoEdificacion.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = tipoEdificacion.id;
      this.denomTipoEdificacion = tipoEdificacion.denomTipoEdificacion;
      this.descTipoEdificacion = tipoEdificacion.descTipoEdificacion;
      this.seZonifica = tipoEdificacion.seZonifica;
      this.tieneMultiplesUnidadesFuncionales = tipoEdificacion.tieneMultiplesUnidadesFuncionales;
    }
  }

  Map toMap() {
    Map map = {
      TIPOSEDIFICACIONES.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      TIPOSEDIFICACIONES.ID: this.id,
      TIPOSEDIFICACIONES.DENOMTIPOEDIFICACION: this.denomTipoEdificacion,
      TIPOSEDIFICACIONES.DESCTIPOEDIFICACION: this.descTipoEdificacion,
      TIPOSEDIFICACIONES.SEZONIFICA: this.seZonifica,
      TIPOSEDIFICACIONES.TIENEMULTIPLESUNIDADESFUNCIONALES: this.tieneMultiplesUnidadesFuncionales,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[TIPOSEDIFICACIONES.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = map[TIPOSEDIFICACIONES.ID];
    this.denomTipoEdificacion = map[TIPOSEDIFICACIONES.DENOMTIPOEDIFICACION];
    this.descTipoEdificacion = map[TIPOSEDIFICACIONES.DESCTIPOEDIFICACION];
    this.seZonifica = map[TIPOSEDIFICACIONES.SEZONIFICA];
    this.tieneMultiplesUnidadesFuncionales = map[TIPOSEDIFICACIONES.TIENEMULTIPLESUNIDADESFUNCIONALES];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final TipoEdificacion typedOther = other;
    return
        id == typedOther.id &&
        denomTipoEdificacion == typedOther.denomTipoEdificacion &&
        descTipoEdificacion == typedOther.descTipoEdificacion &&
        seZonifica == typedOther.seZonifica &&
        tieneMultiplesUnidadesFuncionales == typedOther.tieneMultiplesUnidadesFuncionales;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      denomTipoEdificacion.hashCode,
      descTipoEdificacion.hashCode,
      seZonifica.hashCode,
      tieneMultiplesUnidadesFuncionales.hashCode,
  ]);

}

//==============================================================================
class TIPOSEDIFICACIONES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Tipos de Edificaciones';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Tipo de Edificación';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_DENOMTIPOEDIFICACION = 'Denominación del Tipo de Edificación';
  static const String ETIQUETA_DESCTIPOEDIFICACION = 'Descripción del Tipo de Edificación';
  static const String ETIQUETA_SEZONIFICA = 'Se Zonifica';
  static const String ETIQUETA_TIENEMULTIPLESUNIDADESFUNCIONALES = 'Tiene Múltiples Unidades Funcionales';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'TiposEdificaciones';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'TipoEdificacion';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ID = 'id';
  static const String DENOMTIPOEDIFICACION = 'denomTipoEdificacion';
  static const String DESCTIPOEDIFICACION = 'descTipoEdificacion';
  static const String SEZONIFICA = 'seZonifica';
  static const String TIENEMULTIPLESUNIDADESFUNCIONALES = 'tieneMultiplesUnidadesFuncionales';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, ID, DENOMTIPOEDIFICACION, SEZONIFICA, TIENEMULTIPLESUNIDADESFUNCIONALES,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, DENOMTIPOEDIFICACION, DESCTIPOEDIFICACION, SEZONIFICA, TIENEMULTIPLESUNIDADESFUNCIONALES,];

}
