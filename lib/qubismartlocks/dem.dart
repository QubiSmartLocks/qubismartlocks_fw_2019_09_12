// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: dem.dart
// Datos en Memoria

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:qubismartlocks_fw/qubismartlocks/fake-data.dart';
import 'package:firebase/firebase.dart' as firebase;


enum TipoUsr {ADM, AD1, AD2, SE1, SE2 }


class DEM {
  // DatosEnMemoria

  static ApiDart api; // = ApiDart();
  static FakeData fakeData;
  static Conversacion conversacionActiva = Conversacion();
  static List<Mensaje> mensajesEnConversacionActiva = List<Mensaje>();

  static GlobalKey<ScaffoldState> anyScaffoldKey;

  static bool lInicializado = false;

  static firebase.Database db;
  static firebase.App app;

  static iniciar() async {
    if (lInicializado)
      return;
    await inicializarConfiguracion();
    lInicializado = true;
  }

  static TipoUsr tipoUsr = TipoUsr.SE2;
  static TipoUsr tipoUsrActivo = TipoUsr.SE2;

  static void setTipoUsr(TipoUsr _tipo) {
    tipoUsr = _tipo;
  }

  static void setTipoUsrActivo(TipoUsr _tipo) {
    tipoUsrActivo = _tipo;
  }

  static VoidCallback refrescarMain = () {};
  static VoidCallback refrescar = () {};

  static Map mapaBusquedaReservas = {
    "buscar": "13025"
  };

  // Mapas en Memoria para Edición de datos
  // --------------------------------------

//  Base de Datos: Qubi Smart Locks    =>  123
//  ---------------------------
  // Cerraduras
  static Map mapaCerradura;
  static Cerradura cerradura = Cerradura();
  static List<Cerradura> listaCerraduras = List<Cerradura>();

  // Clientes
  static Map mapaCliente;
  static Cliente cliente = Cliente();
  static List<Cliente> listaClientes = List<Cliente>();

  // Edificaciones
  static Map mapaEdificacion;
  static Edificacion edificacion = Edificacion();
  static List<Edificacion> listaEdificaciones = List<Edificacion>();

  // Estados de Cerraduras
  static Map mapaEstadoCerradura;
  static EstadoCerradura estadoCerradura = EstadoCerradura();
  static List<EstadoCerradura> listaEstadosCerraduras = List<EstadoCerradura>();

  // Estados de Reservaciones
  static Map mapaEstadoReservacion;
  static EstadoReservacion estadoReservacion = EstadoReservacion();
  static List<EstadoReservacion> listaEstadosReservaciones = List<EstadoReservacion>();

  // Históricos de Cerraduras
  static Map mapaHistoricoCerradura;
  static HistoricoCerradura historicoCerradura = HistoricoCerradura();
  static List<HistoricoCerradura> listaHistoricosCerraduras = List<HistoricoCerradura>();

  // Logs de Cerraduras
  static Map mapaLogCerradura;
  static LogCerradura logCerradura = LogCerradura();
  static List<LogCerradura> listaLogsCerraduras = List<LogCerradura>();

  // Marcas de Cerraduras
  static Map mapaMarcaCerradura;
  static MarcaCerradura marcaCerradura = MarcaCerradura();
  static List<MarcaCerradura> listaMarcasCerraduras = List<MarcaCerradura>();

  // Modelos de Cerraduras
  static Map mapaModeloCerradura;
  static ModeloCerradura modeloCerradura = ModeloCerradura();
  static List<ModeloCerradura> listaModelosCerraduras = List<ModeloCerradura>();

  // Orígenes de Paquetes
  static Map mapaOrigenPaquete;
  static OrigenPaquete origenPaquete = OrigenPaquete();
  static List<OrigenPaquete> listaOrigenesPaquetes = List<OrigenPaquete>();

  // Paquetería
  static Map mapaPaquete;
  static Paquete paquete = Paquete();
  static List<Paquete> listaPaqueteria = List<Paquete>();

  // Pasajeros
  static Map mapaPasajero;
  static Pasajero pasajero = Pasajero();
  static List<Pasajero> listaPasajeros = List<Pasajero>();

  // Propietarios
  static Map mapaPropietario;
  static Propietario propietario = Propietario();
  static List<Propietario> listaPropietarios = List<Propietario>();

  // Reservaciones
  static Map mapaReservacion;
  static Reservacion reservacion = Reservacion();
  static List<Reservacion> listaReservaciones = List<Reservacion>();

  // Tipos de Edificaciones
  static Map mapaTipoEdificacion;
  static TipoEdificacion tipoEdificacion = TipoEdificacion();
  static List<TipoEdificacion> listaTiposEdificaciones = List<TipoEdificacion>();

  // Tipos de Identificación
  static Map mapaTipoIdent;
  static TipoIdent tipoIdent = TipoIdent();
  static List<TipoIdent> listaTiposIdent = List<TipoIdent>();

  // Tipos de Unidades Funcionales
  static Map mapaTipoUnidadFuncional;
  static TipoUnidadFuncional tipoUnidadFuncional = TipoUnidadFuncional();
  static List<TipoUnidadFuncional> listaTipUnidadesFuncionales = List<TipoUnidadFuncional>();

  // Unidades Funcionales
  static Map mapaUnidadFuncional;
  static UnidadFuncional unidadFuncional = UnidadFuncional();
  static List<UnidadFuncional> listaUnidadesFuncionales = List<UnidadFuncional>();

  // Zonas en Edificaciones
  static Map mapaZonaEdificacion;
  static ZonaEdificacion zonaEdificacion = ZonaEdificacion();
  static List<ZonaEdificacion> listaZonasEdificaciones = List<ZonaEdificacion>();

//  Sub-Proyecto: Seguridad    =>  120
//  ===========================

//  Base de Datos: Seguridad    =>  120
//  ---------------------------
  // Niveles de Usuarios
  static Map mapaNivelUsuario;
  static NivelUsuario nivelUsuario = NivelUsuario();
  static List<NivelUsuario> listaNivelesUsuarios = List<NivelUsuario>();

  // Usuarios
  static Map mapaUsuario;
  static Usuario usuario = Usuario();
  static List<Usuario> listaUsuarios = List<Usuario>();

//  Sub-Proyecto: Modelos de Campos    =>  125
//  ===========================

//  Base de Datos: Modelos de Campos    =>  125
//  ---------------------------
  // Modelos Campos
  static Map mapaModeloCampo;
  static ModeloCampo modeloCampo = ModeloCampo();
  static List<ModeloCampo> listaModelosCampos = List<ModeloCampo>();

  // Modelos Foráneos
  static Map mapaModeloForaneo;
  static ModeloForaneo modeloForaneo = ModeloForaneo();
  static List<ModeloForaneo> listaModelosForaneos = List<ModeloForaneo>();

//  Sub-Proyecto: Clock PMS (Api Reservaciones)    =>  127
//  ===========================

//  Base de Datos: Clock PMS (Api Reservaciones)    =>  127
//  ---------------------------
  // Bookings
  static Map mapaBooking;
  static Booking booking = Booking();
  static List<Booking> listaBookings = List<Booking>();

  // Room Rates
  static Map mapaRoomRate;
  static RoomRate roomRate = RoomRate();
  static List<RoomRate> listaRoomRates = List<RoomRate>();

  // Room Types
  static Map mapaRoomType;
  static RoomType roomType = RoomType();
  static List<RoomType> listaRoomTypes = List<RoomType>();

  // Rooms
  static Map mapaRoom;
  static Room room = Room();
  static List<Room> listaRooms = List<Room>();

//  Sub-Proyecto: Mensajería (Chats)    =>  126
//  ===========================

//  Base de Datos: Mensajería (Chats)    =>  126
//  ---------------------------
  // Conversaciones
  static Map mapaConversacion;
  static Conversacion conversacion = Conversacion();
  static List<Conversacion> listaConversaciones = List<Conversacion>();

  // Mensajes
  static Map mapaMensaje;
  static Mensaje mensaje = Mensaje();
  static List<Mensaje> listaMensajes = List<Mensaje>();

  // Mensajes Automáticos
  static Map mapaMensajeAutomatico;
  static MensajeAutomatico mensajeAutomatico = MensajeAutomatico();
  static List<MensajeAutomatico> listaMensajesAutomaticos = List<MensajeAutomatico>();

  // Opciones de Mensajería
  static Map mapaOpcionMensajeria;
  static OpcionMensajeria opcionMensajeria = OpcionMensajeria();
  static List<OpcionMensajeria> listaOpcionesMensajeria = List<OpcionMensajeria>();

  // Participantes
  static Map mapaParticipante;
  static Participante participante = Participante();
  static List<Participante> listaParticipantes = List<Participante>();


  static cerrarSesionEnMemoria() {
    // Cerraduras
    mapaCerradura = null;
    // Clientes
    mapaCliente = null;
    // Edificaciones
    mapaEdificacion = null;
    // Estados de Cerraduras
    mapaEstadoCerradura = null;
    // Estados de Reservaciones
    mapaEstadoReservacion = null;
    // Históricos de Cerraduras
    mapaHistoricoCerradura = null;
    // Logs de Cerraduras
    mapaLogCerradura = null;
    // Marcas de Cerraduras
    mapaMarcaCerradura = null;
    // Modelos de Cerraduras
    mapaModeloCerradura = null;
    // Orígenes de Paquetes
    mapaOrigenPaquete = null;
    // Paquetería
    mapaPaquete = null;
    // Pasajeros
    mapaPasajero = null;
    // Propietarios
    mapaPropietario = null;
    // Reservaciones
    mapaReservacion = null;
    // Tipos de Edificaciones
    mapaTipoEdificacion = null;
    // Tipos de Identificación
    mapaTipoIdent = null;
    // Tipos de Unidades Funcionales
    mapaTipoUnidadFuncional = null;
    // Unidades Funcionales
    mapaUnidadFuncional = null;
    // Zonas en Edificaciones
    mapaZonaEdificacion = null;
    // Niveles de Usuarios
    mapaNivelUsuario = null;
    // Usuarios
    mapaUsuario = null;
    // Modelos Campos
    mapaModeloCampo = null;
    // Modelos Foráneos
    mapaModeloForaneo = null;
    // Bookings
    mapaBooking = null;
    // Room Rates
    mapaRoomRate = null;
    // Room Types
    mapaRoomType = null;
    // Rooms
    mapaRoom = null;
    // Conversaciones
    mapaConversacion = null;
    // Mensajes
    mapaMensaje = null;
    // Mensajes Automáticos
    mapaMensajeAutomatico = null;
    // Opciones de Mensajería
    mapaOpcionMensajeria = null;
    // Participantes
    mapaParticipante = null;
  }

  static Future<void> inicializarConfiguracion() async {
    // Cerraduras
    mapaCerradura = cerradura.toMap();
    // Clientes
    mapaCliente = cliente.toMap();
    // Edificaciones
    mapaEdificacion = edificacion.toMap();
    // Estados de Cerraduras
    mapaEstadoCerradura = estadoCerradura.toMap();
    // Estados de Reservaciones
    mapaEstadoReservacion = estadoReservacion.toMap();
    // Históricos de Cerraduras
    mapaHistoricoCerradura = historicoCerradura.toMap();
    // Logs de Cerraduras
    mapaLogCerradura = logCerradura.toMap();
    // Marcas de Cerraduras
    mapaMarcaCerradura = marcaCerradura.toMap();
    // Modelos de Cerraduras
    mapaModeloCerradura = modeloCerradura.toMap();
    // Orígenes de Paquetes
    mapaOrigenPaquete = origenPaquete.toMap();
    // Paquetería
    mapaPaquete = paquete.toMap();
    // Pasajeros
    mapaPasajero = pasajero.toMap();
    // Propietarios
    mapaPropietario = propietario.toMap();
    // Reservaciones
    mapaReservacion = reservacion.toMap();
    // Tipos de Edificaciones
    mapaTipoEdificacion = tipoEdificacion.toMap();
    // Tipos de Identificación
    mapaTipoIdent = tipoIdent.toMap();
    // Tipos de Unidades Funcionales
    mapaTipoUnidadFuncional = tipoUnidadFuncional.toMap();
    // Unidades Funcionales
    mapaUnidadFuncional = unidadFuncional.toMap();
    // Zonas en Edificaciones
    mapaZonaEdificacion = zonaEdificacion.toMap();
    // Niveles de Usuarios
    mapaNivelUsuario = nivelUsuario.toMap();
    // Usuarios
    mapaUsuario = usuario.toMap();
    // Modelos Campos
    mapaModeloCampo = modeloCampo.toMap();
    // Modelos Foráneos
    mapaModeloForaneo = modeloForaneo.toMap();
    // Bookings
    mapaBooking = booking.toMap();
    // Room Rates
    mapaRoomRate = roomRate.toMap();
    // Room Types
    mapaRoomType = roomType.toMap();
    // Rooms
    mapaRoom = room.toMap();
    // Conversaciones
    mapaConversacion = conversacion.toMap();
    // Mensajes
    mapaMensaje = mensaje.toMap();
    // Mensajes Automáticos
    mapaMensajeAutomatico = mensajeAutomatico.toMap();
    // Opciones de Mensajería
    mapaOpcionMensajeria = opcionMensajeria.toMap();
    // Participantes
    mapaParticipante = participante.toMap();

    await initFirebaseDatabase();
  }

  static Future<void> cerrarSesion() async {
  }

  static initFirebaseDatabase() async {
    db = firebase.database(app);
    print('*** BASE DE DATOS FIREBASE ***');
    print(db);
  }

  static initApiDartConexion() async {
    api = ApiDart(
      scheme: ApiConst.SCHEMES[0],
      host: '192.168.1.52',
      port: 8888,
      username: 'eh',
      password: 'password',
      clientID: 'com.qubiapp.smartlocks',
      client_secret: 'Sm4rtL0cksQub1',
      scopeRequired: 'ADMIN',
//      apiBeginPoint: '/nopass/api_qubismartlocks/',
      apiBeginPoint: '/api_qubismartlocks/',
    );
    await api.getToken();
    print('api Creado de ApiDart');
    print('Token: ${api.tokenData.access_token}');
  }


  static nuevaConversacion(Usuario usuario1, Usuario usuario2) async {
    print('Creamos la Conversación');
    // Creamos la Conversación
    conversacion.assign(null); // = Conversacion();
    conversacion.denomConversacion = '${usuario1.nombres} ${usuario1.apellidos}';
    conversacion.fechaCreacion = DateTime.now();
    conversacion.fechaUltimoMensaje = DateTime.now();
    conversacion.key = '_${usuario1.id}';
    conversacion.id = usuario1.id;
    conversacion.nota = '';
    await ConversacionesFB.guardarConversacion(conversacion: conversacion);

    listaParticipantes.clear();
    print('Creamos el Participante 1 (Huesped)');
    // Creamos el Participante 1 (Huesped)
    Participante participante1 = Participante();
    participante1.id = usuario1.id;
    participante1.conversacion = conversacion;
    participante1.usuario = usuario1.id;
    participante1.nombre = '${usuario1.nombres} ${usuario1.apellidos}';
    participante1.key = '_${usuario1.id}';
    participante1.nota = 'NOTA _${usuario1.nombres}';
    participante1.keyConversacion = conversacion.key;
    await ParticipantesFB.guardarParticipante(participante: participante1);
    listaParticipantes.add(participante1);

    print('Creamos el Participante 2 (Recepcionista)');
    // Creamos el Participante 2 (Recepcionista)
    Participante participante2 = Participante();
    participante2.id = usuario2.id;
    participante2.conversacion = conversacion;
    participante2.usuario = usuario2.id;
    participante2.nombre = '${usuario2.nombres} ${usuario2.apellidos}';
    participante2.key = '_${usuario2.id}';
    participante2.nota = 'NOTA _${usuario2.nombres}';
    participante2.keyConversacion = conversacion.key;
    await ParticipantesFB.guardarParticipante(participante: participante2);
    listaParticipantes.add(participante2);

    print('Cargamos las opciones de Mensajería');
    // Cargamos las opciones de Mensajería
    await OpcionesMensajeria.todos(listaOpcionesMensajeria);
    await OpcionesMensajeria.registro(listaOpcionesMensajeria[0].id, opcionMensajeria);

    print('Mensaje de Bienvenida: ${opcionMensajeria.bienvenida.mensaje}');
    print('Creamos el mensaje de Bienvenida');
    // Creamos el mensaje de Bienvenida
    Mensaje mensaje = Mensaje();
    mensaje.keyConversacion = conversacion.key;
    mensaje.id= 0;
    mensaje.conversacion = conversacion;
    mensaje.participante = participante2;
    mensaje.momento = DateTime.now();
    mensaje.mensajeTexto = opcionMensajeria.bienvenida.mensaje;
    mensaje.keyParticipante= participante2.key;
    await MensajesFB.guardarMensaje(mensaje: mensaje);
    listaMensajes.clear();
    listaMensajes.add(mensaje);
    print('Listo el mensaje de Bienvenida ${mensaje.mensajeTexto}');
    await ConversacionesFB.drConversaciones.child(conversacion.key).child(CONVERSACIONES.FECHAULTIMOMENSAJE).update(GuardarFechaHora(mensaje.momento));
    print('Actualizada la fecha del último mensaje');
  }

}
