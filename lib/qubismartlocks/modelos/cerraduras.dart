/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Cerraduras -> Cerradura
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Cerradura {
  Cerradura({
    this.id,
    this.marca,
    this.modelo,
    this.denomCerradura,
    this.serial,
    this.unidadFuncional,
    this.estadoCerradura,
  });

  int id;
  MarcaCerradura marca;
  ModeloCerradura modelo;
  String denomCerradura;
  String serial;
  UnidadFuncional unidadFuncional;
  EstadoCerradura estadoCerradura;

  fromKeyValue(String key, Map value) {
    this.id = value[CERRADURAS.ID];
    this.marca.fromKeyValue(key, value[CERRADURAS.MARCA]);
    this.modelo.fromKeyValue(key, value[CERRADURAS.MODELO]);
    this.denomCerradura = value[CERRADURAS.DENOMCERRADURA];
    this.serial = value[CERRADURAS.SERIAL];
    this.unidadFuncional.fromKeyValue(key, value[CERRADURAS.UNIDADFUNCIONAL]);
    this.estadoCerradura.fromKeyValue(key, value[CERRADURAS.ESTADOCERRADURA]);
  }

  toJson() {
    return {
      CERRADURAS.ID: this.id,
      CERRADURAS.MARCA: this.marca.toJson(),
      CERRADURAS.MODELO: this.modelo.toJson(),
      CERRADURAS.DENOMCERRADURA: this.denomCerradura,
      CERRADURAS.SERIAL: this.serial,
      CERRADURAS.UNIDADFUNCIONAL: this.unidadFuncional.toJson(),
      CERRADURAS.ESTADOCERRADURA: this.estadoCerradura.toJson(),
    };
  }

  assign(Cerradura cerradura) {

    if (cerradura == null) {
      this.id = null; //0;
      this.marca = null; //new EstadoCerradura();
      this.modelo = null; //new EstadoCerradura();
      this.denomCerradura = null; //'';
      this.serial = null; //'';
      this.unidadFuncional = null; //new EstadoCerradura();
      this.estadoCerradura = null; //new EstadoCerradura();
    } else {
      this.id = cerradura.id;

      if (cerradura.marca != null) {
        if (this.marca == null) {
          this.marca = MarcaCerradura();
        }
        this.marca.assign(cerradura.marca);
      } else {
        this.marca = null;
      }


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

      if (cerradura.unidadFuncional != null) {
        if (this.unidadFuncional == null) {
          this.unidadFuncional = UnidadFuncional();
        }
        this.unidadFuncional.assign(cerradura.unidadFuncional);
      } else {
        this.unidadFuncional = null;
      }


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
    this.id = map[CERRADURAS.ID];
    if (map[CERRADURAS.MARCA] != null) {
      if (this.marca == null) {
        this.marca = MarcaCerradura();
      }
      this.marca.fromMap(map[CERRADURAS.MARCA]);
    } else {
      this.marca = null;
    }
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
    if (map[CERRADURAS.UNIDADFUNCIONAL] != null) {
      if (this.unidadFuncional == null) {
        this.unidadFuncional = UnidadFuncional();
      }
      this.unidadFuncional.fromMap(map[CERRADURAS.UNIDADFUNCIONAL]);
    } else {
      this.unidadFuncional = null;
    }
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
      estadoCerradura.hashCode 
  ]);

}

//==============================================================================
class CERRADURAS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Cerraduras';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Cerradura';

  // Etiquetas de los Atributos
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

  static const List CAMPOS_LISTADO = [ID,MODELO,DENOMCERRADURA,UNIDADFUNCIONAL,ESTADOCERRADURA,];
  static const List CAMPOS_DETALLE = [ID,MARCA,MODELO,DENOMCERRADURA,SERIAL,UNIDADFUNCIONAL,ESTADOCERRADURA,];

}
