/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad UnidadesFuncionales -> Unidad Funcional
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class UnidadFuncional {
  UnidadFuncional({
    this.key = '',
    this.id,
    this.edificacion,
    this.zona,
    this.tipoUnidadFuncional,
    this.denomUnidadFuncional,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  Edificacion edificacion;  // Id [Búsqueda: int]
  ZonaEdificacion zona;  // Id [Búsqueda: int]
  TipoUnidadFuncional tipoUnidadFuncional;  // Id [Búsqueda: int]
  String denomUnidadFuncional;  // Denominación 200 No Nulo [Texto Variable: String]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[UNIDADESFUNCIONALES.ID];

    // Edificaciones
    if (value[UNIDADESFUNCIONALES.EDIFICACION] != null) {
      if (this.edificacion == null) {
        this.edificacion = Edificacion();
      }
      this.edificacion.fromKeyValue(key, value[UNIDADESFUNCIONALES.EDIFICACION]);
    } else {
      this.edificacion = null;
    }


    // Zonas en Edificaciones
    if (value[UNIDADESFUNCIONALES.ZONA] != null) {
      if (this.zona == null) {
        this.zona = ZonaEdificacion();
      }
      this.zona.fromKeyValue(key, value[UNIDADESFUNCIONALES.ZONA]);
    } else {
      this.zona = null;
    }


    // Tipos de Unidades Funcionales
    if (value[UNIDADESFUNCIONALES.TIPOUNIDADFUNCIONAL] != null) {
      if (this.tipoUnidadFuncional == null) {
        this.tipoUnidadFuncional = TipoUnidadFuncional();
      }
      this.tipoUnidadFuncional.fromKeyValue(key, value[UNIDADESFUNCIONALES.TIPOUNIDADFUNCIONAL]);
    } else {
      this.tipoUnidadFuncional = null;
    }

    this.denomUnidadFuncional = value[UNIDADESFUNCIONALES.DENOMUNIDADFUNCIONAL];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      UNIDADESFUNCIONALES.ID: this.id,
      UNIDADESFUNCIONALES.EDIFICACION: this.edificacion == null ? null : this.edificacion.toJson(),
      UNIDADESFUNCIONALES.ZONA: this.zona == null ? null : this.zona.toJson(),
      UNIDADESFUNCIONALES.TIPOUNIDADFUNCIONAL: this.tipoUnidadFuncional == null ? null : this.tipoUnidadFuncional.toJson(),
      UNIDADESFUNCIONALES.DENOMUNIDADFUNCIONAL: this.denomUnidadFuncional,
    };
  }

  assign(UnidadFuncional unidadFuncional) {

    if (unidadFuncional == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.edificacion = null; //TipoUnidadFuncional();
      this.zona = null; //TipoUnidadFuncional();
      this.tipoUnidadFuncional = null; //TipoUnidadFuncional();
      this.denomUnidadFuncional = null; //'';
    } else {
      this.key = unidadFuncional.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = unidadFuncional.id;

      // Edificaciones
      if (unidadFuncional.edificacion != null) {
        if (this.edificacion == null) {
          this.edificacion = Edificacion();
        }
        this.edificacion.assign(unidadFuncional.edificacion);
      } else {
        this.edificacion = null;
      }


      // Zonas en Edificaciones
      if (unidadFuncional.zona != null) {
        if (this.zona == null) {
          this.zona = ZonaEdificacion();
        }
        this.zona.assign(unidadFuncional.zona);
      } else {
        this.zona = null;
      }


      // Tipos de Unidades Funcionales
      if (unidadFuncional.tipoUnidadFuncional != null) {
        if (this.tipoUnidadFuncional == null) {
          this.tipoUnidadFuncional = TipoUnidadFuncional();
        }
        this.tipoUnidadFuncional.assign(unidadFuncional.tipoUnidadFuncional);
      } else {
        this.tipoUnidadFuncional = null;
      }

      this.denomUnidadFuncional = unidadFuncional.denomUnidadFuncional;
    }
  }

  Map toMap() {
    Map map = {
      UNIDADESFUNCIONALES.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      UNIDADESFUNCIONALES.ID: this.id,
      UNIDADESFUNCIONALES.EDIFICACION: this.edificacion == null ? null : this.edificacion.toMap(),
      UNIDADESFUNCIONALES.ZONA: this.zona == null ? null : this.zona.toMap(),
      UNIDADESFUNCIONALES.TIPOUNIDADFUNCIONAL: this.tipoUnidadFuncional == null ? null : this.tipoUnidadFuncional.toMap(),
      UNIDADESFUNCIONALES.DENOMUNIDADFUNCIONAL: this.denomUnidadFuncional,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[UNIDADESFUNCIONALES.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = map[UNIDADESFUNCIONALES.ID];

    // Edificaciones
    if (map[UNIDADESFUNCIONALES.EDIFICACION] != null) {
      if (this.edificacion == null) {
        this.edificacion = Edificacion();
      }
      this.edificacion.fromMap(map[UNIDADESFUNCIONALES.EDIFICACION]);
    } else {
      this.edificacion = null;
    }


    // Zonas en Edificaciones
    if (map[UNIDADESFUNCIONALES.ZONA] != null) {
      if (this.zona == null) {
        this.zona = ZonaEdificacion();
      }
      this.zona.fromMap(map[UNIDADESFUNCIONALES.ZONA]);
    } else {
      this.zona = null;
    }


    // Tipos de Unidades Funcionales
    if (map[UNIDADESFUNCIONALES.TIPOUNIDADFUNCIONAL] != null) {
      if (this.tipoUnidadFuncional == null) {
        this.tipoUnidadFuncional = TipoUnidadFuncional();
      }
      this.tipoUnidadFuncional.fromMap(map[UNIDADESFUNCIONALES.TIPOUNIDADFUNCIONAL]);
    } else {
      this.tipoUnidadFuncional = null;
    }

    this.denomUnidadFuncional = map[UNIDADESFUNCIONALES.DENOMUNIDADFUNCIONAL];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final UnidadFuncional typedOther = other;
    return
        id == typedOther.id &&
        edificacion == typedOther.edificacion &&
        zona == typedOther.zona &&
        tipoUnidadFuncional == typedOther.tipoUnidadFuncional &&
        denomUnidadFuncional == typedOther.denomUnidadFuncional;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      edificacion.hashCode,
      zona.hashCode,
      tipoUnidadFuncional.hashCode,
      denomUnidadFuncional.hashCode,
  ]);

}

//==============================================================================
class UNIDADESFUNCIONALES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Unidades Funcionales';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Unidad Funcional';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_EDIFICACION = 'Edificación';
  static const String ETIQUETA_ZONA = 'Zona';
  static const String ETIQUETA_TIPOUNIDADFUNCIONAL = 'Tipo de Habitación';
  static const String ETIQUETA_DENOMUNIDADFUNCIONAL = 'Denominación de Habitación';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'UnidadesFuncionales';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'UnidadFuncional';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ID = 'id';
  static const String EDIFICACION = 'edificacion';
  static const String ZONA = 'zona';
  static const String TIPOUNIDADFUNCIONAL = 'tipoUnidadFuncional';
  static const String DENOMUNIDADFUNCIONAL = 'denomUnidadFuncional';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, ID, TIPOUNIDADFUNCIONAL, DENOMUNIDADFUNCIONAL,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, EDIFICACION, ZONA, TIPOUNIDADFUNCIONAL, DENOMUNIDADFUNCIONAL,];

}
