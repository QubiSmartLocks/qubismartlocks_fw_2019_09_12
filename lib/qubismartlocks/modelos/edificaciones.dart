/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Edificaciones -> Edificación
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class Edificacion {
  Edificacion({
    this.key = '',
    this.id,
    this.denomEdificacion,
    this.tipoEdificacion,
    this.direccion,
    this.ubicacionGPS,
    this.personaAdministradora,
    this.propietario,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  String denomEdificacion;  // Denominación 200 No Nulo [Texto Variable: String]
  TipoEdificacion tipoEdificacion;  // Id [Búsqueda: int]
  String direccion;  // Dirección [Texto Variable: String]
  String ubicacionGPS;  // Ubicación GPS [Texto Variable: String]
  int personaAdministradora;  // Id [Búsqueda: int]
  Propietario propietario;  // Id [Búsqueda: int]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[EDIFICACIONES.ID];
    this.denomEdificacion = value[EDIFICACIONES.DENOMEDIFICACION];

    // Tipos de Edificaciones
    if (value[EDIFICACIONES.TIPOEDIFICACION] != null) {
      if (this.tipoEdificacion == null) {
        this.tipoEdificacion = TipoEdificacion();
      }
      this.tipoEdificacion.fromKeyValue(key, value[EDIFICACIONES.TIPOEDIFICACION]);
    } else {
      this.tipoEdificacion = null;
    }

    this.direccion = value[EDIFICACIONES.DIRECCION];
    this.ubicacionGPS = value[EDIFICACIONES.UBICACIONGPS];
    this.personaAdministradora = value[EDIFICACIONES.PERSONAADMINISTRADORA];

    // Propietarios
    if (value[EDIFICACIONES.PROPIETARIO] != null) {
      if (this.propietario == null) {
        this.propietario = Propietario();
      }
      this.propietario.fromKeyValue(key, value[EDIFICACIONES.PROPIETARIO]);
    } else {
      this.propietario = null;
    }

  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      EDIFICACIONES.ID: this.id,
      EDIFICACIONES.DENOMEDIFICACION: this.denomEdificacion,
      EDIFICACIONES.TIPOEDIFICACION: this.tipoEdificacion == null ? null : this.tipoEdificacion.toJson(),
      EDIFICACIONES.DIRECCION: this.direccion,
      EDIFICACIONES.UBICACIONGPS: this.ubicacionGPS,
      EDIFICACIONES.PERSONAADMINISTRADORA: this.personaAdministradora,
      EDIFICACIONES.PROPIETARIO: this.propietario == null ? null : this.propietario.toJson(),
    };
  }

  assign(Edificacion edificacion) {

    if (edificacion == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.denomEdificacion = null; //'';
      this.tipoEdificacion = null; //Propietario();
      this.direccion = null; //'';
      this.ubicacionGPS = null; //'';
      this.personaAdministradora = null; //0;
      this.propietario = null; //Propietario();
    } else {
      this.key = edificacion.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = edificacion.id;
      this.denomEdificacion = edificacion.denomEdificacion;

      // Tipos de Edificaciones
      if (edificacion.tipoEdificacion != null) {
        if (this.tipoEdificacion == null) {
          this.tipoEdificacion = TipoEdificacion();
        }
        this.tipoEdificacion.assign(edificacion.tipoEdificacion);
      } else {
        this.tipoEdificacion = null;
      }

      this.direccion = edificacion.direccion;
      this.ubicacionGPS = edificacion.ubicacionGPS;
      this.personaAdministradora = edificacion.personaAdministradora;

      // Propietarios
      if (edificacion.propietario != null) {
        if (this.propietario == null) {
          this.propietario = Propietario();
        }
        this.propietario.assign(edificacion.propietario);
      } else {
        this.propietario = null;
      }

    }
  }

  Map toMap() {
    Map map = {
      EDIFICACIONES.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      EDIFICACIONES.ID: this.id,
      EDIFICACIONES.DENOMEDIFICACION: this.denomEdificacion,
      EDIFICACIONES.TIPOEDIFICACION: this.tipoEdificacion == null ? null : this.tipoEdificacion.toMap(),
      EDIFICACIONES.DIRECCION: this.direccion,
      EDIFICACIONES.UBICACIONGPS: this.ubicacionGPS,
      EDIFICACIONES.PERSONAADMINISTRADORA: this.personaAdministradora,
      EDIFICACIONES.PROPIETARIO: this.propietario == null ? null : this.propietario.toMap(),
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[EDIFICACIONES.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = map[EDIFICACIONES.ID];
    this.denomEdificacion = map[EDIFICACIONES.DENOMEDIFICACION];

    // Tipos de Edificaciones
    if (map[EDIFICACIONES.TIPOEDIFICACION] != null) {
      if (this.tipoEdificacion == null) {
        this.tipoEdificacion = TipoEdificacion();
      }
      this.tipoEdificacion.fromMap(map[EDIFICACIONES.TIPOEDIFICACION]);
    } else {
      this.tipoEdificacion = null;
    }

    this.direccion = map[EDIFICACIONES.DIRECCION];
    this.ubicacionGPS = map[EDIFICACIONES.UBICACIONGPS];
    this.personaAdministradora = map[EDIFICACIONES.PERSONAADMINISTRADORA];

    // Propietarios
    if (map[EDIFICACIONES.PROPIETARIO] != null) {
      if (this.propietario == null) {
        this.propietario = Propietario();
      }
      this.propietario.fromMap(map[EDIFICACIONES.PROPIETARIO]);
    } else {
      this.propietario = null;
    }

  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Edificacion typedOther = other;
    return
        id == typedOther.id &&
        denomEdificacion == typedOther.denomEdificacion &&
        tipoEdificacion == typedOther.tipoEdificacion &&
        direccion == typedOther.direccion &&
        ubicacionGPS == typedOther.ubicacionGPS &&
        personaAdministradora == typedOther.personaAdministradora &&
        propietario == typedOther.propietario;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      denomEdificacion.hashCode,
      tipoEdificacion.hashCode,
      direccion.hashCode,
      ubicacionGPS.hashCode,
      personaAdministradora.hashCode,
      propietario.hashCode,
  ]);

}

//==============================================================================
class EDIFICACIONES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Edificaciones';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Edificación';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_DENOMEDIFICACION = 'Denominación de la Edificación';
  static const String ETIQUETA_TIPOEDIFICACION = 'Tipo de Edificación';
  static const String ETIQUETA_DIRECCION = 'Dirección';
  static const String ETIQUETA_UBICACIONGPS = 'Ubicación';
  static const String ETIQUETA_PERSONAADMINISTRADORA = 'Persona Administradora';
  static const String ETIQUETA_PROPIETARIO = 'Propietario';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Edificaciones';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Edificacion';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ID = 'id';
  static const String DENOMEDIFICACION = 'denomEdificacion';
  static const String TIPOEDIFICACION = 'tipoEdificacion';
  static const String DIRECCION = 'direccion';
  static const String UBICACIONGPS = 'ubicacionGPS';
  static const String PERSONAADMINISTRADORA = 'personaAdministradora';
  static const String PROPIETARIO = 'propietario';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, ID, DENOMEDIFICACION, TIPOEDIFICACION,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, DENOMEDIFICACION, TIPOEDIFICACION, DIRECCION, UBICACIONGPS, PERSONAADMINISTRADORA, PROPIETARIO,];

}
