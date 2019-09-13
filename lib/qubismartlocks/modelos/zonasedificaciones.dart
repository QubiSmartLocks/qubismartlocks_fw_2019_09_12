/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad ZonasEdificaciones -> Zona en Edificación
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class ZonaEdificacion {
  ZonaEdificacion({
    this.id,
    this.edificacion,
    this.denomZona,
    this.identZona,
    this.personaAdministradora,
  });

  int id;
  Edificacion edificacion;
  String denomZona;
  String identZona;
  int personaAdministradora;

  fromKeyValue(String key, Map value) {
    this.id = value[ZONASEDIFICACIONES.ID];
    this.edificacion.fromKeyValue(key, value[ZONASEDIFICACIONES.EDIFICACION]);
    this.denomZona = value[ZONASEDIFICACIONES.DENOMZONA];
    this.identZona = value[ZONASEDIFICACIONES.IDENTZONA];
    this.personaAdministradora = value[ZONASEDIFICACIONES.PERSONAADMINISTRADORA];
  }

  toJson() {
    return {
      ZONASEDIFICACIONES.ID: this.id,
      ZONASEDIFICACIONES.EDIFICACION: this.edificacion.toJson(),
      ZONASEDIFICACIONES.DENOMZONA: this.denomZona,
      ZONASEDIFICACIONES.IDENTZONA: this.identZona,
      ZONASEDIFICACIONES.PERSONAADMINISTRADORA: this.personaAdministradora,
    };
  }

  assign(ZonaEdificacion zonaEdificacion) {

    if (zonaEdificacion == null) {
      this.id = null; //0;
      this.edificacion = null; //new Edificacion();
      this.denomZona = null; //'';
      this.identZona = null; //'';
      this.personaAdministradora = null; //0;
    } else {
      this.id = zonaEdificacion.id;

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
    this.id = map[ZONASEDIFICACIONES.ID];
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
      personaAdministradora.hashCode 
  ]);

}

//==============================================================================
class ZONASEDIFICACIONES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Zonas en Edificaciones';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Zona en Edificación';

  // Etiquetas de los Atributos
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

  static const List CAMPOS_LISTADO = [ID,EDIFICACION,DENOMZONA,];
  static const List CAMPOS_DETALLE = [ID,EDIFICACION,DENOMZONA,IDENTZONA,PERSONAADMINISTRADORA,];

}
