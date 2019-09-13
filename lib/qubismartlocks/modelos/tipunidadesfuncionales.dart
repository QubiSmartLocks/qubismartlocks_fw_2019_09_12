/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad TipUnidadesFuncionales -> Tipo de Unidad Funcional
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class TipoUnidadFuncional {
  TipoUnidadFuncional({
    this.id,
    this.denomTipoUnidadFuncional,
    this.maximoCerradurasAsignadas,
  });

  int id;
  String denomTipoUnidadFuncional;
  int maximoCerradurasAsignadas;

  fromKeyValue(String key, Map value) {
    this.id = value[TIPUNIDADESFUNCIONALES.ID];
    this.denomTipoUnidadFuncional = value[TIPUNIDADESFUNCIONALES.DENOMTIPOUNIDADFUNCIONAL];
    this.maximoCerradurasAsignadas = value[TIPUNIDADESFUNCIONALES.MAXIMOCERRADURASASIGNADAS];
  }

  toJson() {
    return {
      TIPUNIDADESFUNCIONALES.ID: this.id,
      TIPUNIDADESFUNCIONALES.DENOMTIPOUNIDADFUNCIONAL: this.denomTipoUnidadFuncional,
      TIPUNIDADESFUNCIONALES.MAXIMOCERRADURASASIGNADAS: this.maximoCerradurasAsignadas,
    };
  }

  assign(TipoUnidadFuncional tipoUnidadFuncional) {

    if (tipoUnidadFuncional == null) {
      this.id = null; //0;
      this.denomTipoUnidadFuncional = null; //'';
      this.maximoCerradurasAsignadas = null; //0;
    } else {
      this.id = tipoUnidadFuncional.id;
      this.denomTipoUnidadFuncional = tipoUnidadFuncional.denomTipoUnidadFuncional;
      this.maximoCerradurasAsignadas = tipoUnidadFuncional.maximoCerradurasAsignadas;
    }
  }

  Map toMap() {
    Map map = {
      TIPUNIDADESFUNCIONALES.ID: this.id,
      TIPUNIDADESFUNCIONALES.DENOMTIPOUNIDADFUNCIONAL: this.denomTipoUnidadFuncional,
      TIPUNIDADESFUNCIONALES.MAXIMOCERRADURASASIGNADAS: this.maximoCerradurasAsignadas,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.id = map[TIPUNIDADESFUNCIONALES.ID];
    this.denomTipoUnidadFuncional = map[TIPUNIDADESFUNCIONALES.DENOMTIPOUNIDADFUNCIONAL];
    this.maximoCerradurasAsignadas = map[TIPUNIDADESFUNCIONALES.MAXIMOCERRADURASASIGNADAS];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final TipoUnidadFuncional typedOther = other;
    return
        id == typedOther.id &&
        denomTipoUnidadFuncional == typedOther.denomTipoUnidadFuncional &&
        maximoCerradurasAsignadas == typedOther.maximoCerradurasAsignadas;
  }


  @override
  int get hashCode => hashObjects([
      id.hashCode,
      denomTipoUnidadFuncional.hashCode,
      maximoCerradurasAsignadas.hashCode 
  ]);

}

//==============================================================================
class TIPUNIDADESFUNCIONALES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Tipos de Unidades Funcionales';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Tipo de Unidad Funcional';

  // Etiquetas de los Atributos
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_DENOMTIPOUNIDADFUNCIONAL = 'Denominación del Tipo de Unidad Funcional';
  static const String ETIQUETA_MAXIMOCERRADURASASIGNADAS = 'Máximo Cerraduras Asignadas';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'TipUnidadesFuncionales';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'TipoUnidadFuncional';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String ID = 'id';
  static const String DENOMTIPOUNIDADFUNCIONAL = 'denomTipoUnidadFuncional';
  static const String MAXIMOCERRADURASASIGNADAS = 'maximoCerradurasAsignadas';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [ID,DENOMTIPOUNIDADFUNCIONAL,MAXIMOCERRADURASASIGNADAS,];
  static const List CAMPOS_DETALLE = [ID,DENOMTIPOUNIDADFUNCIONAL,MAXIMOCERRADURASASIGNADAS,];

}
