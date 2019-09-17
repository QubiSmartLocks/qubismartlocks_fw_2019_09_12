/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad ZonasEdificaciones -> Zona en Edificación
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class ZonaEdificacion {
  ZonaEdificacion({
    this.key = '',
    this.id,
    this.edificacion,
    this.denomZona,
    this.identZona,
    this.personaAdministradora,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  Edificacion edificacion;  // Id [Búsqueda: int]
  String denomZona;  // Denominación 200 No Nulo [Texto Variable: String]
  String identZona;  // Descripción 4096 [Texto Variable: String]
  int personaAdministradora;  // Id [Búsqueda: int]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[ZONASEDIFICACIONES.ID];

    // Edificaciones
    if (value[ZONASEDIFICACIONES.EDIFICACION] != null) {
      if (this.edificacion == null) {
        this.edificacion = Edificacion();
      }
      this.edificacion.fromKeyValue(key, value[ZONASEDIFICACIONES.EDIFICACION]);
    } else {
      this.edificacion = null;
    }

    this.denomZona = value[ZONASEDIFICACIONES.DENOMZONA];
    this.identZona = value[ZONASEDIFICACIONES.IDENTZONA];
    this.personaAdministradora = value[ZONASEDIFICACIONES.PERSONAADMINISTRADORA];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      ZONASEDIFICACIONES.ID: this.id,
      ZONASEDIFICACIONES.EDIFICACION: this.edificacion == null ? null : this.edificacion.toJson(),
      ZONASEDIFICACIONES.DENOMZONA: this.denomZona,
      ZONASEDIFICACIONES.IDENTZONA: this.identZona,
      ZONASEDIFICACIONES.PERSONAADMINISTRADORA: this.personaAdministradora,
    };
  }

  assign(ZonaEdificacion zonaEdificacion) {

    if (zonaEdificacion == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.edificacion = null; //Edificacion();
      this.denomZona = null; //'';
      this.identZona = null; //'';
      this.personaAdministradora = null; //0;
    } else {
      this.key = zonaEdificacion.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = zonaEdificacion.id;

      // Edificaciones
      if (zonaEdificacion.edificacion != null) {
        if (this.edificacion == null) {
          this.edificacion = Edificacion();
        }
        this.edificacion.assign(zonaEdificacion.edificacion);
      } else {
        this.edificacion = null;
      }

      this.denomZona = zonaEdificacion.denomZona;
      this.identZona = zonaEdificacion.identZona;
      this.personaAdministradora = zonaEdificacion.personaAdministradora;
    }
  }

  Map toMap() {
    Map map = {
      ZONASEDIFICACIONES.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      ZONASEDIFICACIONES.ID: this.id,
      ZONASEDIFICACIONES.EDIFICACION: this.edificacion == null ? null : this.edificacion.toMap(),
      ZONASEDIFICACIONES.DENOMZONA: this.denomZona,
      ZONASEDIFICACIONES.IDENTZONA: this.identZona,
      ZONASEDIFICACIONES.PERSONAADMINISTRADORA: this.personaAdministradora,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[ZONASEDIFICACIONES.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = map[ZONASEDIFICACIONES.ID];

    // Edificaciones
    if (map[ZONASEDIFICACIONES.EDIFICACION] != null) {
      if (this.edificacion == null) {
        this.edificacion = Edificacion();
      }
      this.edificacion.fromMap(map[ZONASEDIFICACIONES.EDIFICACION]);
    } else {
      this.edificacion = null;
    }

    this.denomZona = map[ZONASEDIFICACIONES.DENOMZONA];
    this.identZona = map[ZONASEDIFICACIONES.IDENTZONA];
    this.personaAdministradora = map[ZONASEDIFICACIONES.PERSONAADMINISTRADORA];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final ZonaEdificacion typedOther = other;
    return
        id == typedOther.id &&
        edificacion == typedOther.edificacion &&
        denomZona == typedOther.denomZona &&
        identZona == typedOther.identZona &&
        personaAdministradora == typedOther.personaAdministradora;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      edificacion.hashCode,
      denomZona.hashCode,
      identZona.hashCode,
      personaAdministradora.hashCode,
  ]);

}

//==============================================================================
class ZONASEDIFICACIONES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Zonas en Edificaciones';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Zona en Edificación';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_EDIFICACION = 'Edificación';
  static const String ETIQUETA_DENOMZONA = 'Denominación de la Zona';
  static const String ETIQUETA_IDENTZONA = 'Identificación de la Zona';
  static const String ETIQUETA_PERSONAADMINISTRADORA = 'Persona Administradora';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'ZonasEdificaciones';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'ZonaEdificacion';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ID = 'id';
  static const String EDIFICACION = 'edificacion';
  static const String DENOMZONA = 'denomZona';
  static const String IDENTZONA = 'identZona';
  static const String PERSONAADMINISTRADORA = 'personaAdministradora';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, ID, EDIFICACION, DENOMZONA,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, EDIFICACION, DENOMZONA, IDENTZONA, PERSONAADMINISTRADORA,];

}
