/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad NivelesUsuarios -> Nivel de Usuario
   [Qubi Smart Locks/Seguridad]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class NivelUsuario {
  NivelUsuario({
    this.id,
    this.denomNivelUsuario,
    this.detNiveles,
  });

  int id;
  String denomNivelUsuario;
  String detNiveles;

  fromKeyValue(String key, Map value) {
    this.id = value[NIVELESUSUARIOS.ID];
    this.denomNivelUsuario = value[NIVELESUSUARIOS.DENOMNIVELUSUARIO];
    this.detNiveles = value[NIVELESUSUARIOS.DETNIVELES];
  }

  toJson() {
    return {
      NIVELESUSUARIOS.ID: this.id,
      NIVELESUSUARIOS.DENOMNIVELUSUARIO: this.denomNivelUsuario,
      NIVELESUSUARIOS.DETNIVELES: this.detNiveles,
    };
  }

  assign(NivelUsuario nivelUsuario) {

    if (nivelUsuario == null) {
      this.id = null; //0;
      this.denomNivelUsuario = null; //'';
      this.detNiveles = null; //'';
    } else {
      this.id = nivelUsuario.id;
      this.denomNivelUsuario = nivelUsuario.denomNivelUsuario;
      this.detNiveles = nivelUsuario.detNiveles;
    }
  }

  Map toMap() {
    Map map = {
      NIVELESUSUARIOS.ID: this.id,
      NIVELESUSUARIOS.DENOMNIVELUSUARIO: this.denomNivelUsuario,
      NIVELESUSUARIOS.DETNIVELES: this.detNiveles,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.id = map[NIVELESUSUARIOS.ID];
    this.denomNivelUsuario = map[NIVELESUSUARIOS.DENOMNIVELUSUARIO];
    this.detNiveles = map[NIVELESUSUARIOS.DETNIVELES];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final NivelUsuario typedOther = other;
    return
        id == typedOther.id &&
        denomNivelUsuario == typedOther.denomNivelUsuario &&
        detNiveles == typedOther.detNiveles;
  }


  @override
  int get hashCode => hashObjects([
      id.hashCode,
      denomNivelUsuario.hashCode,
      detNiveles.hashCode 
  ]);

}

//==============================================================================
class NIVELESUSUARIOS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Niveles de Usuarios';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Nivel de Usuario';

  // Etiquetas de los Atributos
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_DENOMNIVELUSUARIO = 'Denominación del Nivel de Usuario';
  static const String ETIQUETA_DETNIVELES = 'Detalle de Niveles';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'NivelesUsuarios';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'NivelUsuario';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String ID = 'id';
  static const String DENOMNIVELUSUARIO = 'denomNivelUsuario';
  static const String DETNIVELES = 'detNiveles';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [ID,DENOMNIVELUSUARIO,];
  static const List CAMPOS_DETALLE = [ID,DENOMNIVELUSUARIO,DETNIVELES,];

}
