/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Usuarios -> Usuario
   [Qubi Smart Locks/Seguridad]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Usuario {
  Usuario({
    this.id,
    this.nombres,
    this.apellidos,
    this.correoElectronico,
    this.celular,
    this.nivelUsuario,
  });

  int id;
  String nombres;
  String apellidos;
  String correoElectronico;
  String celular;
  NivelUsuario nivelUsuario;
  String username;

  fromKeyValue(String key, Map value) {
    this.id = value[USUARIOS.ID];
    this.nombres = value[USUARIOS.NOMBRES];
    this.apellidos = value[USUARIOS.APELLIDOS];
    this.correoElectronico = value[USUARIOS.CORREOELECTRONICO];
    this.celular = value[USUARIOS.CELULAR];
    this.nivelUsuario.fromKeyValue(key, value[USUARIOS.NIVELUSUARIO]);
    this.username = value['username'];
  }

  toJson() {
    return {
      USUARIOS.ID: this.id,
      USUARIOS.NOMBRES: this.nombres,
      USUARIOS.APELLIDOS: this.apellidos,
      USUARIOS.CORREOELECTRONICO: this.correoElectronico,
      USUARIOS.CELULAR: this.celular,
      USUARIOS.NIVELUSUARIO: this.nivelUsuario.toJson(),
      "username": this.username,
    };
  }

  assign(Usuario usuario) {

    if (usuario == null) {
      this.id = null; //0;
      this.nombres = null; //'';
      this.apellidos = null; //'';
      this.correoElectronico = null; //'';
      this.celular = null; //'';
      this.nivelUsuario = null; //new NivelUsuario();
    this.username = null;
    } else {
      this.id = usuario.id;
      this.nombres = usuario.nombres;
      this.apellidos = usuario.apellidos;
      this.correoElectronico = usuario.correoElectronico;
      this.celular = usuario.celular;

      if (usuario.nivelUsuario != null) {
        if (this.nivelUsuario == null) {
          this.nivelUsuario = NivelUsuario();
        }
        this.nivelUsuario.assign(usuario.nivelUsuario);
      } else {
        this.nivelUsuario = null;
      }

      this.username = usuario.username;
    }
  }

  Map toMap() {
    Map map = {
      USUARIOS.ID: this.id,
      USUARIOS.NOMBRES: this.nombres,
      USUARIOS.APELLIDOS: this.apellidos,
      USUARIOS.CORREOELECTRONICO: this.correoElectronico,
      USUARIOS.CELULAR: this.celular,
      USUARIOS.NIVELUSUARIO: this.nivelUsuario == null ? null : this.nivelUsuario.toMap(),
      'username': this.username,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.id = map[USUARIOS.ID];
    this.nombres = map[USUARIOS.NOMBRES];
    this.apellidos = map[USUARIOS.APELLIDOS];
    this.correoElectronico = map[USUARIOS.CORREOELECTRONICO];
    this.celular = map[USUARIOS.CELULAR];
    if (map[USUARIOS.NIVELUSUARIO] != null) {
      if (this.nivelUsuario == null) {
        this.nivelUsuario = NivelUsuario();
      }
      this.nivelUsuario.fromMap(map[USUARIOS.NIVELUSUARIO]);
    } else {
      this.nivelUsuario = null;
    }
    this.username = map['username'];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Usuario typedOther = other;
    return
        id == typedOther.id &&
        nombres == typedOther.nombres &&
        apellidos == typedOther.apellidos &&
        correoElectronico == typedOther.correoElectronico &&
        celular == typedOther.celular &&
        nivelUsuario == typedOther.nivelUsuario;
  }


  @override
  int get hashCode => hashObjects([
      id.hashCode,
      nombres.hashCode,
      apellidos.hashCode,
      correoElectronico.hashCode,
      celular.hashCode,
      nivelUsuario.hashCode 
  ]);

}

//==============================================================================
class USUARIOS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Usuarios';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Usuario';

  // Etiquetas de los Atributos
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_NOMBRES = 'Nombres';
  static const String ETIQUETA_APELLIDOS = 'Apellidos';
  static const String ETIQUETA_CORREOELECTRONICO = 'Correo Electrónico';
  static const String ETIQUETA_CELULAR = 'Celular';
  static const String ETIQUETA_NIVELUSUARIO = 'Nivel de Usuario';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Usuarios';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Usuario';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String ID = 'id';
  static const String NOMBRES = 'nombres';
  static const String APELLIDOS = 'apellidos';
  static const String CORREOELECTRONICO = 'correoElectronico';
  static const String CELULAR = 'celular';
  static const String NIVELUSUARIO = 'nivelUsuario';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [ID,NOMBRES,APELLIDOS,CORREOELECTRONICO,CELULAR,NIVELUSUARIO,];
  static const List CAMPOS_DETALLE = [ID,NOMBRES,APELLIDOS,CORREOELECTRONICO,CELULAR,NIVELUSUARIO,];

}
