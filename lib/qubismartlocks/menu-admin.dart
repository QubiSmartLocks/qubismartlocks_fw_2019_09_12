// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: menu-admin.dart
// Menú Administrativo

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class OpcionesMenuAdmin {
  static buildMenuItems() {
    // When editing this list, make sure you keep it in sync with
    // the list in ../../test_driver/transitions_perf_test.dart
    final List<MenuItem> _items = <MenuItem>[

      // Pestaña Qubi Smart Locks
      // Barra Qubi Smart Locks
      // Vista Administrativa para Tipos de Edificaciones
      MenuItem(
        titulo: 'Tipos de Edificaciones',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Tipos de Edificaciones]',
        categoria: 'Qubi Smart Locks',
        ruta: FTipEdificaciones.ruta,
        constructor: (BuildContext context) => FTipEdificaciones(),
      ),
      // Interface de Usuario (UI) para Tipos de Edificaciones
      MenuItem(
        titulo: 'Tipos de Edificaciones',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UITipEdificacionesForma.ruta,
        constructor: (BuildContext context) => UITipEdificacionesForma(),
      ),

      // Vista Administrativa para Tipos de Unidades Funcionales
      MenuItem(
        titulo: 'Tipos de Unidades Funcionales',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Tipos de Unidades Funcionales]',
        categoria: 'Qubi Smart Locks',
        ruta: FTipUnidadesFuncionales.ruta,
        constructor: (BuildContext context) => FTipUnidadesFuncionales(),
      ),
      // Interface de Usuario (UI) para Tipos de Unidades Funcionales
      MenuItem(
        titulo: 'Tipos de Unidades Funcionales',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UITipUnidadesFuncionalesForma.ruta,
        constructor: (BuildContext context) => UITipUnidadesFuncionalesForma(),
      ),

      // Vista Administrativa para Estados de Cerraduras
      MenuItem(
        titulo: 'Estados de Cerraduras',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Estados de Cerraduras]',
        categoria: 'Qubi Smart Locks',
        ruta: FEstadosCerraduras.ruta,
        constructor: (BuildContext context) => FEstadosCerraduras(),
      ),
      // Interface de Usuario (UI) para Estados de Cerraduras
      MenuItem(
        titulo: 'Estados de Cerraduras',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UIEstadosCerradurasForma.ruta,
        constructor: (BuildContext context) => UIEstadosCerradurasForma(),
      ),

      // Vista Administrativa para Marcas de Cerraduras
      MenuItem(
        titulo: 'Marcas de Cerraduras',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Marcas de Cerraduras]',
        categoria: 'Qubi Smart Locks',
        ruta: FMarcasCerraduras.ruta,
        constructor: (BuildContext context) => FMarcasCerraduras(),
      ),
      // Interface de Usuario (UI) para Marcas de Cerraduras
      MenuItem(
        titulo: 'Marcas de Cerraduras',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UIMarcasCerradurasForma.ruta,
        constructor: (BuildContext context) => UIMarcasCerradurasForma(),
      ),

      // Vista Administrativa para Modelos de Cerraduras
      MenuItem(
        titulo: 'Modelos de Cerraduras',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Modelos de Cerraduras]',
        categoria: 'Qubi Smart Locks',
        ruta: FModelosCerraduras.ruta,
        constructor: (BuildContext context) => FModelosCerraduras(),
      ),
      // Interface de Usuario (UI) para Modelos de Cerraduras
      MenuItem(
        titulo: 'Modelos de Cerraduras',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UIModelosCerradurasForma.ruta,
        constructor: (BuildContext context) => UIModelosCerradurasForma(),
      ),

      // Vista Administrativa para Propietarios
      MenuItem(
        titulo: 'Propietarios',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Propietarios]',
        categoria: 'Qubi Smart Locks',
        ruta: FPropietarios.ruta,
        constructor: (BuildContext context) => FPropietarios(),
      ),
      // Interface de Usuario (UI) para Propietarios
      MenuItem(
        titulo: 'Propietarios',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UIPropietariosForma.ruta,
        constructor: (BuildContext context) => UIPropietariosForma(),
      ),

      // Vista Administrativa para Edificaciones
      MenuItem(
        titulo: 'Edificaciones',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Edificaciones]',
        categoria: 'Qubi Smart Locks',
        ruta: FEdificaciones.ruta,
        constructor: (BuildContext context) => FEdificaciones(),
      ),
      // Interface de Usuario (UI) para Edificaciones
      MenuItem(
        titulo: 'Edificaciones',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UIEdificacionesForma.ruta,
        constructor: (BuildContext context) => UIEdificacionesForma(),
      ),

      // Vista Administrativa para Zonas en Edificaciones
      MenuItem(
        titulo: 'Zonas en Edificaciones',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Zonas en Edificaciones]',
        categoria: 'Qubi Smart Locks',
        ruta: FZonasEdificaciones.ruta,
        constructor: (BuildContext context) => FZonasEdificaciones(),
      ),
      // Interface de Usuario (UI) para Zonas en Edificaciones
      MenuItem(
        titulo: 'Zonas en Edificaciones',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UIZonasEdificacionesForma.ruta,
        constructor: (BuildContext context) => UIZonasEdificacionesForma(),
      ),

      // Vista Administrativa para Unidades Funcionales
      MenuItem(
        titulo: 'Unidades Funcionales',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Unidades Funcionales]',
        categoria: 'Qubi Smart Locks',
        ruta: FUnidadesFuncionales.ruta,
        constructor: (BuildContext context) => FUnidadesFuncionales(),
      ),
      // Interface de Usuario (UI) para Unidades Funcionales
      MenuItem(
        titulo: 'Unidades Funcionales',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UIUnidadesFuncionalesForma.ruta,
        constructor: (BuildContext context) => UIUnidadesFuncionalesForma(),
      ),

      // Vista Administrativa para Cerraduras
      MenuItem(
        titulo: 'Cerraduras',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Cerraduras]',
        categoria: 'Qubi Smart Locks',
        ruta: FCerraduras.ruta,
        constructor: (BuildContext context) => FCerraduras(),
      ),
      // Interface de Usuario (UI) para Cerraduras
      MenuItem(
        titulo: 'Cerraduras',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UICerradurasForma.ruta,
        constructor: (BuildContext context) => UICerradurasForma(),
      ),

      // Vista Administrativa para Logs de Cerraduras
      MenuItem(
        titulo: 'Logs de Cerraduras',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Logs de Cerraduras]',
        categoria: 'Qubi Smart Locks',
        ruta: FLogsCerraduras.ruta,
        constructor: (BuildContext context) => FLogsCerraduras(),
      ),
      // Interface de Usuario (UI) para Logs de Cerraduras
      MenuItem(
        titulo: 'Logs de Cerraduras',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UILogsCerradurasForma.ruta,
        constructor: (BuildContext context) => UILogsCerradurasForma(),
      ),

      // Vista Administrativa para Históricos de Cerraduras
      MenuItem(
        titulo: 'Históricos de Cerraduras',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Históricos de Cerraduras]',
        categoria: 'Qubi Smart Locks',
        ruta: FHistoricosCerraduras.ruta,
        constructor: (BuildContext context) => FHistoricosCerraduras(),
      ),
      // Interface de Usuario (UI) para Históricos de Cerraduras
      MenuItem(
        titulo: 'Históricos de Cerraduras',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UIHistoricosCerradurasForma.ruta,
        constructor: (BuildContext context) => UIHistoricosCerradurasForma(),
      ),

      // Vista Administrativa para Clientes
      MenuItem(
        titulo: 'Clientes',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Clientes]',
        categoria: 'Qubi Smart Locks',
        ruta: FClientes.ruta,
        constructor: (BuildContext context) => FClientes(),
      ),
      // Interface de Usuario (UI) para Clientes
      MenuItem(
        titulo: 'Clientes',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UIClientesForma.ruta,
        constructor: (BuildContext context) => UIClientesForma(),
      ),

      // Vista Administrativa para Pasajeros
      MenuItem(
        titulo: 'Pasajeros',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Pasajeros]',
        categoria: 'Qubi Smart Locks',
        ruta: FPasajeros.ruta,
        constructor: (BuildContext context) => FPasajeros(),
      ),
      // Interface de Usuario (UI) para Pasajeros
      MenuItem(
        titulo: 'Pasajeros',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UIPasajerosForma.ruta,
        constructor: (BuildContext context) => UIPasajerosForma(),
      ),

      // Vista Administrativa para Reservaciones
      MenuItem(
        titulo: 'Reservaciones',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Reservaciones]',
        categoria: 'Qubi Smart Locks',
        ruta: FReservaciones.ruta,
        constructor: (BuildContext context) => FReservaciones(),
      ),
      // Interface de Usuario (UI) para Reservaciones
      MenuItem(
        titulo: 'Reservaciones',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UIReservacionesForma.ruta,
        constructor: (BuildContext context) => UIReservacionesForma(),
      ),

      // Vista Administrativa para Paquetería
      MenuItem(
        titulo: 'Paquetería',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Paquetería]',
        categoria: 'Qubi Smart Locks',
        ruta: FPaqueteria.ruta,
        constructor: (BuildContext context) => FPaqueteria(),
      ),
      // Interface de Usuario (UI) para Paquetería
      MenuItem(
        titulo: 'Paquetería',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UIPaqueteriaForma.ruta,
        constructor: (BuildContext context) => UIPaqueteriaForma(),
      ),

      // Vista Administrativa para Tipos de Identificación
      MenuItem(
        titulo: 'Tipos de Identificación',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Tipos de Identificación]',
        categoria: 'Qubi Smart Locks',
        ruta: FTipIdent.ruta,
        constructor: (BuildContext context) => FTipIdent(),
      ),
      // Interface de Usuario (UI) para Tipos de Identificación
      MenuItem(
        titulo: 'Tipos de Identificación',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UITipIdentForma.ruta,
        constructor: (BuildContext context) => UITipIdentForma(),
      ),

      // Vista Administrativa para Estados de Reservaciones
      MenuItem(
        titulo: 'Estados de Reservaciones',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Estados de Reservaciones]',
        categoria: 'Qubi Smart Locks',
        ruta: FEstadosReservaciones.ruta,
        constructor: (BuildContext context) => FEstadosReservaciones(),
      ),
      // Interface de Usuario (UI) para Estados de Reservaciones
      MenuItem(
        titulo: 'Estados de Reservaciones',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UIEstadosReservacionesForma.ruta,
        constructor: (BuildContext context) => UIEstadosReservacionesForma(),
      ),

      // Vista Administrativa para Orígenes de Paquetes
      MenuItem(
        titulo: 'Orígenes de Paquetes',
        subtitulo: '[Qubi Smart Locks/Qubi Smart Locks/Orígenes de Paquetes]',
        categoria: 'Qubi Smart Locks',
        ruta: FOrigenesPaquetes.ruta,
        constructor: (BuildContext context) => FOrigenesPaquetes(),
      ),
      // Interface de Usuario (UI) para Orígenes de Paquetes
      MenuItem(
        titulo: 'Orígenes de Paquetes',
        subtitulo: '',
        categoria: 'Qubi Smart Locks',
        ruta: UIOrigenesPaquetesForma.ruta,
        constructor: (BuildContext context) => UIOrigenesPaquetesForma(),
      ),


      // Pestaña Seguridad
      // Barra Seguridad
      // Vista Administrativa para Niveles de Usuarios
      MenuItem(
        titulo: 'Niveles de Usuarios',
        subtitulo: '[Seguridad/Seguridad/Niveles de Usuarios]',
        categoria: 'Seguridad',
        ruta: FNivelesUsuarios.ruta,
        constructor: (BuildContext context) => FNivelesUsuarios(),
      ),
      // Interface de Usuario (UI) para Niveles de Usuarios
      MenuItem(
        titulo: 'Niveles de Usuarios',
        subtitulo: '',
        categoria: 'Seguridad',
        ruta: UINivelesUsuariosForma.ruta,
        constructor: (BuildContext context) => UINivelesUsuariosForma(),
      ),

      // Vista Administrativa para Usuarios
      MenuItem(
        titulo: 'Usuarios',
        subtitulo: '[Seguridad/Seguridad/Usuarios]',
        categoria: 'Seguridad',
        ruta: FUsuarios.ruta,
        constructor: (BuildContext context) => FUsuarios(),
      ),
      // Interface de Usuario (UI) para Usuarios
      MenuItem(
        titulo: 'Usuarios',
        subtitulo: '',
        categoria: 'Seguridad',
        ruta: UIUsuariosForma.ruta,
        constructor: (BuildContext context) => UIUsuariosForma(),
      ),


      // Pestaña Modelos de Campos
      // Barra Modelos de Campos
      // Vista Administrativa para Modelos Campos
      MenuItem(
        titulo: 'Modelos Campos',
        subtitulo: '[Modelos de Campos/Modelos de Campos/Modelos Campos]',
        categoria: 'Modelos de Campos',
        ruta: FModelosCampos.ruta,
        constructor: (BuildContext context) => FModelosCampos(),
      ),
      // Interface de Usuario (UI) para Modelos Campos
      MenuItem(
        titulo: 'Modelos Campos',
        subtitulo: '',
        categoria: 'Modelos de Campos',
        ruta: UIModelosCamposForma.ruta,
        constructor: (BuildContext context) => UIModelosCamposForma(),
      ),

      // Vista Administrativa para Modelos Foráneos
      MenuItem(
        titulo: 'Modelos Foráneos',
        subtitulo: '[Modelos de Campos/Modelos de Campos/Modelos Foráneos]',
        categoria: 'Modelos de Campos',
        ruta: FModelosForaneos.ruta,
        constructor: (BuildContext context) => FModelosForaneos(),
      ),
      // Interface de Usuario (UI) para Modelos Foráneos
      MenuItem(
        titulo: 'Modelos Foráneos',
        subtitulo: '',
        categoria: 'Modelos de Campos',
        ruta: UIModelosForaneosForma.ruta,
        constructor: (BuildContext context) => UIModelosForaneosForma(),
      ),


      // Pestaña Clock PMS (Api Reservaciones)
      // Barra Clock PMS (Api Reservaciones)
      // Vista Administrativa para Room Types
      MenuItem(
        titulo: 'Room Types',
        subtitulo: '[Clock PMS (Api Reservaciones)/Clock PMS (Api Reservaciones)/Room Types]',
        categoria: 'Clock PMS (Api Reservaciones)',
        ruta: FRoomTypes.ruta,
        constructor: (BuildContext context) => FRoomTypes(),
      ),
      // Interface de Usuario (UI) para Room Types
      MenuItem(
        titulo: 'Room Types',
        subtitulo: '',
        categoria: 'Clock PMS (Api Reservaciones)',
        ruta: UIRoomTypesForma.ruta,
        constructor: (BuildContext context) => UIRoomTypesForma(),
      ),

      // Vista Administrativa para Rooms
      MenuItem(
        titulo: 'Rooms',
        subtitulo: '[Clock PMS (Api Reservaciones)/Clock PMS (Api Reservaciones)/Rooms]',
        categoria: 'Clock PMS (Api Reservaciones)',
        ruta: FRooms.ruta,
        constructor: (BuildContext context) => FRooms(),
      ),
      // Interface de Usuario (UI) para Rooms
      MenuItem(
        titulo: 'Rooms',
        subtitulo: '',
        categoria: 'Clock PMS (Api Reservaciones)',
        ruta: UIRoomsForma.ruta,
        constructor: (BuildContext context) => UIRoomsForma(),
      ),

      // Vista Administrativa para Room Rates
      MenuItem(
        titulo: 'Room Rates',
        subtitulo: '[Clock PMS (Api Reservaciones)/Clock PMS (Api Reservaciones)/Room Rates]',
        categoria: 'Clock PMS (Api Reservaciones)',
        ruta: FRoomRates.ruta,
        constructor: (BuildContext context) => FRoomRates(),
      ),
      // Interface de Usuario (UI) para Room Rates
      MenuItem(
        titulo: 'Room Rates',
        subtitulo: '',
        categoria: 'Clock PMS (Api Reservaciones)',
        ruta: UIRoomRatesForma.ruta,
        constructor: (BuildContext context) => UIRoomRatesForma(),
      ),

      // Vista Administrativa para Bookings
      MenuItem(
        titulo: 'Bookings',
        subtitulo: '[Clock PMS (Api Reservaciones)/Clock PMS (Api Reservaciones)/Bookings]',
        categoria: 'Clock PMS (Api Reservaciones)',
        ruta: FBookings.ruta,
        constructor: (BuildContext context) => FBookings(),
      ),
      // Interface de Usuario (UI) para Bookings
      MenuItem(
        titulo: 'Bookings',
        subtitulo: '',
        categoria: 'Clock PMS (Api Reservaciones)',
        ruta: UIBookingsForma.ruta,
        constructor: (BuildContext context) => UIBookingsForma(),
      ),


      // Pestaña Mensajería (Chats)
      // Barra Mensajería (Chats)
      // Vista Administrativa para Conversaciones
      MenuItem(
        titulo: 'Conversaciones',
        subtitulo: '[Mensajería (Chats)/Mensajería (Chats)/Conversaciones]',
        categoria: 'Mensajería (Chats)',
        ruta: FConversaciones.ruta,
        constructor: (BuildContext context) => FConversaciones(),
      ),
      // Interface de Usuario (UI) para Conversaciones
      MenuItem(
        titulo: 'Conversaciones',
        subtitulo: '',
        categoria: 'Mensajería (Chats)',
        ruta: UIConversacionesForma.ruta,
        constructor: (BuildContext context) => UIConversacionesForma(),
      ),

      // Vista Administrativa para Participantes
      MenuItem(
        titulo: 'Participantes',
        subtitulo: '[Mensajería (Chats)/Mensajería (Chats)/Participantes]',
        categoria: 'Mensajería (Chats)',
        ruta: FParticipantes.ruta,
        constructor: (BuildContext context) => FParticipantes(),
      ),
      // Interface de Usuario (UI) para Participantes
      MenuItem(
        titulo: 'Participantes',
        subtitulo: '',
        categoria: 'Mensajería (Chats)',
        ruta: UIParticipantesForma.ruta,
        constructor: (BuildContext context) => UIParticipantesForma(),
      ),

      // Vista Administrativa para Mensajes Automáticos
      MenuItem(
        titulo: 'Mensajes Automáticos',
        subtitulo: '[Mensajería (Chats)/Mensajería (Chats)/Mensajes Automáticos]',
        categoria: 'Mensajería (Chats)',
        ruta: FMensajesAutomaticos.ruta,
        constructor: (BuildContext context) => FMensajesAutomaticos(),
      ),
      // Interface de Usuario (UI) para Mensajes Automáticos
      MenuItem(
        titulo: 'Mensajes Automáticos',
        subtitulo: '',
        categoria: 'Mensajería (Chats)',
        ruta: UIMensajesAutomaticosForma.ruta,
        constructor: (BuildContext context) => UIMensajesAutomaticosForma(),
      ),

      // Vista Administrativa para Mensajes
      MenuItem(
        titulo: 'Mensajes',
        subtitulo: '[Mensajería (Chats)/Mensajería (Chats)/Mensajes]',
        categoria: 'Mensajería (Chats)',
        ruta: FMensajes.ruta,
        constructor: (BuildContext context) => FMensajes(),
      ),
      // Interface de Usuario (UI) para Mensajes
      MenuItem(
        titulo: 'Mensajes',
        subtitulo: '',
        categoria: 'Mensajería (Chats)',
        ruta: UIMensajesForma.ruta,
        constructor: (BuildContext context) => UIMensajesForma(),
      ),

      // Vista Administrativa para Opciones de Mensajería
      MenuItem(
        titulo: 'Opciones de Mensajería',
        subtitulo: '[Mensajería (Chats)/Mensajería (Chats)/Opciones de Mensajería]',
        categoria: 'Mensajería (Chats)',
        ruta: FOpcionesMensajeria.ruta,
        constructor: (BuildContext context) => FOpcionesMensajeria(),
      ),
      // Interface de Usuario (UI) para Opciones de Mensajería
      MenuItem(
        titulo: 'Opciones de Mensajería',
        subtitulo: '',
        categoria: 'Mensajería (Chats)',
        ruta: UIOpcionesMensajeriaForma.ruta,
        constructor: (BuildContext context) => UIOpcionesMensajeriaForma(),
      ),


      // Home
      MenuItem(
        titulo: 'Home',
        subtitulo: '',
        categoria: '',
        ruta: Inicio.ruta,
        constructor: (BuildContext context) => Inicio(),
      ),

      // Admin Menu
      MenuItem(
        titulo: 'Admin Menu',
        subtitulo: '',
        categoria: '',
        ruta: InicioAdmin.ruta,
        constructor: (BuildContext context) => InicioAdmin(),
        accesos: 'admin',
      ),
    ];

    listaItemsMenuAdmin.insertAll(0, _items);
  }
}
