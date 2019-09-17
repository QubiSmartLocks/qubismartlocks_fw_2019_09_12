/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Cerraduras -> Cerradura
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class Cerradura {
  Cerradura({
    this.key = '',
    this.id,
    this.marca,
    this.modelo,
    this.denomCerradura,
    this.serial,
    this.unidadFuncional,
    this.estadoCerradura,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  MarcaCerradura marca;  // Id [Búsqueda: int]
  ModeloCerradura modelo;  // Id [Búsqueda: int]
  String denomCerradura;  // Denominación 200 No Nulo [Texto Variable: String]
  String serial;  // Serial [Texto Variable: String]
  UnidadFuncional unidadFuncional;  // Id [Búsqueda: int]
  EstadoCerradura estadoCerradura;  // Id [Búsqueda: int]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[CERRADURAS.ID];

    // Marcas de Cerraduras
    if (value[CERRADURAS.MARCA] != null) {
      if (this.marca == null) {
        this.marca = MarcaCerradura();
      }
      this.marca.fromKeyValue(key, value[CERRADURAS.MARCA]);
    } else {
      this.marca = null;
    }


    // Modelos de Cerraduras
    if (value[CERRADURAS.MODELO] != null) {
      if (this.modelo == null) {
        this.modelo = ModeloCerradura();
      }
      this.modelo.fromKeyValue(key, value[CERRADURAS.MODELO]);
    } else {
      this.modelo = null;
    }

    this.denomCerradura = value[CERRADURAS.DENOMCERRADURA];
    this.serial = value[CERRADURAS.SERIAL];

    // Unidades Funcionales
    if (value[CERRADURAS.UNIDADFUNCIONAL] != null) {
      if (this.unidadFuncional == null) {
        this.unidadFuncional = UnidadFuncional();
      }
      this.unidadFuncional.fromKeyValue(key, value[CERRADURAS.UNIDADFUNCIONAL]);
    } else {
      this.unidadFuncional = null;
    }


    // Estados de Cerraduras
    if (value[CERRADURAS.ESTADOCERRADURA] != null) {
      if (this.estadoCerradura == null) {
        this.estadoCerradura = EstadoCerradura();
      }
      this.estadoCerradura.fromKeyValue(key, value[CERRADURAS.ESTADOCERRADURA]);
    } else {
      this.estadoCerradura = null;
    }

  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      CERRADURAS.ID: this.id,
      CERRADURAS.MARCA: this.marca == null ? null : this.marca.toJson(),
      CERRADURAS.MODELO: this.modelo == null ? null : this.modelo.toJson(),
      CERRADURAS.DENOMCERRADURA: this.denomCerradura,
      CERRADURAS.SERIAL: this.serial,
      CERRADURAS.UNIDADFUNCIONAL: this.unidadFuncional == null ? null : this.unidadFuncional.toJson(),
      CERRADURAS.ESTADOCERRADURA: this.estadoCerradura == null ? null : this.estadoCerradura.toJson(),
    };
  }

  assign(Cerradura cerradura) {

    if (cerradura == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.marca = null; //EstadoCerradura();
      this.modelo = null; //EstadoCerradura();
      this.denomCerradura = null; //'';
      this.serial = null; //'';
      this.unidadFuncional = null; //EstadoCerradura();
      this.estadoCerradura = null; //EstadoCerradura();
    } else {
      this.key = cerradura.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = cerradura.id;

      // Marcas de Cerraduras
      if (cerradura.marca != null) {
        if (this.marca == null) {
          this.marca = MarcaCerradura();
        }
        this.marca.assign(cerradura.marca);
      } else {
        this.marca = null;
      }


      // Modelos de Cerraduras
      if (cerradura.modelo != null) {
        if (this.modelo == null) {
          this.modelo = ModeloCerradura();
        }
        this.modelo.assign(cerradura.modelo);
      } else {
        this.modelo = null;
      }

      this.denomCerradura = cerradura.denomCerradura;
      this.serial = cerradura.serial;

      // Unidades Funcionales
      if (cerradura.unidadFuncional != null) {
        if (this.unidadFuncional == null) {
          this.unidadFuncional = UnidadFuncional();
        }
        this.unidadFuncional.assign(cerradura.unidadFuncional);
      } else {
        this.unidadFuncional = null;
      }


      // Estados de Cerraduras
      if (cerradura.estadoCerradura != null) {
        if (this.estadoCerradura == null) {
          this.estadoCerradura = EstadoCerradura();
        }
        this.estadoCerradura.assign(cerradura.estadoCerradura);
      } else {
        this.estadoCerradura = null;
      }

    }
  }

  Map toMap() {
    Map map = {
      CERRADURAS.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      CERRADURAS.ID: this.id,
      CERRADURAS.MARCA: this.marca == null ? null : this.marca.toMap(),
      CERRADURAS.MODELO: this.modelo == null ? null : this.modelo.toMap(),
      CERRADURAS.DENOMCERRADURA: this.denomCerradura,
      CERRADURAS.SERIAL: this.serial,
      CERRADURAS.UNIDADFUNCIONAL: this.unidadFuncional == null ? null : this.unidadFuncional.toMap(),
      CERRADURAS.ESTADOCERRADURA: this.estadoCerradura == null ? null : this.estadoCerradura.toMap(),
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[CERRADURAS.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = map[CERRADURAS.ID];

    // Marcas de Cerraduras
    if (map[CERRADURAS.MARCA] != null) {
      if (this.marca == null) {
        this.marca = MarcaCerradura();
      }
      this.marca.fromMap(map[CERRADURAS.MARCA]);
    } else {
      this.marca = null;
    }


    // Modelos de Cerraduras
    if (map[CERRADURAS.MODELO] != null) {
      if (this.modelo == null) {
        this.modelo = ModeloCerradura();
      }
      this.modelo.fromMap(map[CERRADURAS.MODELO]);
    } else {
      this.modelo = null;
    }

    this.denomCerradura = map[CERRADURAS.DENOMCERRADURA];
    this.serial = map[CERRADURAS.SERIAL];

    // Unidades Funcionales
    if (map[CERRADURAS.UNIDADFUNCIONAL] != null) {
      if (this.unidadFuncional == null) {
        this.unidadFuncional = UnidadFuncional();
      }
      this.unidadFuncional.fromMap(map[CERRADURAS.UNIDADFUNCIONAL]);
    } else {
      this.unidadFuncional = null;
    }


    // Estados de Cerraduras
    if (map[CERRADURAS.ESTADOCERRADURA] != null) {
      if (this.estadoCerradura == null) {
        this.estadoCerradura = EstadoCerradura();
      }
      this.estadoCerradura.fromMap(map[CERRADURAS.ESTADOCERRADURA]);
    } else {
      this.estadoCerradura = null;
    }

  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Cerradura typedOther = other;
    return
        id == typedOther.id &&
        marca == typedOther.marca &&
        modelo == typedOther.modelo &&
        denomCerradura == typedOther.denomCerradura &&
        serial == typedOther.serial &&
        unidadFuncional == typedOther.unidadFuncional &&
        estadoCerradura == typedOther.estadoCerradura;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      marca.hashCode,
      modelo.hashCode,
      denomCerradura.hashCode,
      serial.hashCode,
      unidadFuncional.hashCode,
      estadoCerradura.hashCode,
  ]);

}

//==============================================================================
class CERRADURAS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Cerraduras';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Cerradura';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_MARCA = 'Marca';
  static const String ETIQUETA_MODELO = 'Modelo';
  static const String ETIQUETA_DENOMCERRADURA = 'Denominación de la Smart Lock';
  static const String ETIQUETA_SERIAL = 'Serial';
  static const String ETIQUETA_UNIDADFUNCIONAL = 'Habitación';
  static const String ETIQUETA_ESTADOCERRADURA = 'Estado de la Cerradura';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Cerraduras';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Cerradura';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ID = 'id';
  static const String MARCA = 'marca';
  static const String MODELO = 'modelo';
  static const String DENOMCERRADURA = 'denomCerradura';
  static const String SERIAL = 'serial';
  static const String UNIDADFUNCIONAL = 'unidadFuncional';
  static const String ESTADOCERRADURA = 'estadoCerradura';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, ID, MODELO, DENOMCERRADURA, UNIDADFUNCIONAL, ESTADOCERRADURA,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, MARCA, MODELO, DENOMCERRADURA, SERIAL, UNIDADFUNCIONAL, ESTADOCERRADURA,];

}
