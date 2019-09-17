/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Propietarios -> Propietario
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class Propietario {
  Propietario({
    this.key = '',
    this.id,
    this.nombreCompletoPropietario,
    this.usuario,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  String nombreCompletoPropietario;  // Nombre Completo [Texto Variable: String]
  int usuario;  // Id [Búsqueda: int]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[PROPIETARIOS.ID];
    this.nombreCompletoPropietario = value[PROPIETARIOS.NOMBRECOMPLETOPROPIETARIO];
    this.usuario = value[PROPIETARIOS.USUARIO];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      PROPIETARIOS.ID: this.id,
      PROPIETARIOS.NOMBRECOMPLETOPROPIETARIO: this.nombreCompletoPropietario,
      PROPIETARIOS.USUARIO: this.usuario,
    };
  }

  assign(Propietario propietario) {

    if (propietario == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.nombreCompletoPropietario = null; //'';
      this.usuario = null; //0;
    } else {
      this.key = propietario.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = propietario.id;
      this.nombreCompletoPropietario = propietario.nombreCompletoPropietario;
      this.usuario = propietario.usuario;
    }
  }

  Map toMap() {
    Map map = {
      PROPIETARIOS.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      PROPIETARIOS.ID: this.id,
      PROPIETARIOS.NOMBRECOMPLETOPROPIETARIO: this.nombreCompletoPropietario,
      PROPIETARIOS.USUARIO: this.usuario,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[PROPIETARIOS.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = map[PROPIETARIOS.ID];
    this.nombreCompletoPropietario = map[PROPIETARIOS.NOMBRECOMPLETOPROPIETARIO];
    this.usuario = map[PROPIETARIOS.USUARIO];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Propietario typedOther = other;
    return
        id == typedOther.id &&
        nombreCompletoPropietario == typedOther.nombreCompletoPropietario &&
        usuario == typedOther.usuario;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      nombreCompletoPropietario.hashCode,
      usuario.hashCode,
  ]);

}

//==============================================================================
class PROPIETARIOS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Propietarios';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Propietario';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_NOMBRECOMPLETOPROPIETARIO = 'Nombre Completo del Propietario';
  static const String ETIQUETA_USUARIO = 'Usuario';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Propietarios';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Propietario';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ID = 'id';
  static const String NOMBRECOMPLETOPROPIETARIO = 'nombreCompletoPropietario';
  static const String USUARIO = 'usuario';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, ID, NOMBRECOMPLETOPROPIETARIO, USUARIO,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, NOMBRECOMPLETOPROPIETARIO, USUARIO,];

}
