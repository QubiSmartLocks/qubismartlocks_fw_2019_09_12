/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad ModelosCerraduras -> Modelo de Cerradura
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class ModeloCerradura {
  ModeloCerradura({
    this.id,
    this.marca,
    this.denomModelo,
    this.descModelo,
  });

  int id;
  MarcaCerradura marca;
  String denomModelo;
  String descModelo;

  fromKeyValue(String key, Map value) {
    this.id = value[MODELOSCERRADURAS.ID];
    this.marca.fromKeyValue(key, value[MODELOSCERRADURAS.MARCA]);
    this.denomModelo = value[MODELOSCERRADURAS.DENOMMODELO];
    this.descModelo = value[MODELOSCERRADURAS.DESCMODELO];
  }

  toJson() {
    return {
      MODELOSCERRADURAS.ID: this.id,
      MODELOSCERRADURAS.MARCA: this.marca.toJson(),
      MODELOSCERRADURAS.DENOMMODELO: this.denomModelo,
      MODELOSCERRADURAS.DESCMODELO: this.descModelo,
    };
  }

  assign(ModeloCerradura modeloCerradura) {

    if (modeloCerradura == null) {
      this.id = null; //0;
      this.marca = null; //new MarcaCerradura();
      this.denomModelo = null; //'';
      this.descModelo = null; //'';
    } else {
      this.id = modeloCerradura.id;

      if (modeloCerradura.marca != null) {
        if (this.marca == null) {
          this.marca = MarcaCerradura();
        }
        this.marca.assign(modeloCerradura.marca);
      } else {
        this.marca = null;
      }

      this.denomModelo = modeloCerradura.denomModelo;
      this.descModelo = modeloCerradura.descModelo;
    }
  }

  Map toMap() {
    Map map = {
      MODELOSCERRADURAS.ID: this.id,
      MODELOSCERRADURAS.MARCA: this.marca == null ? null : this.marca.toMap(),
      MODELOSCERRADURAS.DENOMMODELO: this.denomModelo,
      MODELOSCERRADURAS.DESCMODELO: this.descModelo,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.id = map[MODELOSCERRADURAS.ID];
    if (map[MODELOSCERRADURAS.MARCA] != null) {
      if (this.marca == null) {
        this.marca = MarcaCerradura();
      }
      this.marca.fromMap(map[MODELOSCERRADURAS.MARCA]);
    } else {
      this.marca = null;
    }
    this.denomModelo = map[MODELOSCERRADURAS.DENOMMODELO];
    this.descModelo = map[MODELOSCERRADURAS.DESCMODELO];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final ModeloCerradura typedOther = other;
    return
        id == typedOther.id &&
        marca == typedOther.marca &&
        denomModelo == typedOther.denomModelo &&
        descModelo == typedOther.descModelo;
  }


  @override
  int get hashCode => hashObjects([
      id.hashCode,
      marca.hashCode,
      denomModelo.hashCode,
      descModelo.hashCode 
  ]);

}

//==============================================================================
class MODELOSCERRADURAS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Modelos de Cerraduras';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Modelo de Cerradura';

  // Etiquetas de los Atributos
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_MARCA = 'Marca';
  static const String ETIQUETA_DENOMMODELO = 'Denominación del Modelo';
  static const String ETIQUETA_DESCMODELO = 'Descripción del Modelo';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'ModelosCerraduras';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'ModeloCerradura';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String ID = 'id';
  static const String MARCA = 'marca';
  static const String DENOMMODELO = 'denomModelo';
  static const String DESCMODELO = 'descModelo';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [ID,MARCA,DENOMMODELO,];
  static const List CAMPOS_DETALLE = [ID,MARCA,DENOMMODELO,DESCMODELO,];

}
