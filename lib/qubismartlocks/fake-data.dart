import 'package:qubismartlocks_fw/qubismartlocks.dart';

class FakeData {
  FakeData({
    this.opcionMensajeria,
    this.listaConversaciones,
    this.listaMensajes,
    this.listaMensajesAutomaticos,
    this.listaParticipantes,
    this.recepcionista,
    this.usuarioActivo,
  }) {
    print('Creando la FakeData()...');
    this.usuarioActivo = Usuario(
      id: 1,
      nombres: 'Léyder',
      apellidos: 'Gallego',
      correoElectronico: 'leyder.gallego@gmail.com',
      celular: '3007654321',
    );
    print('Usuario Activo: ${this.usuarioActivo.nombres}');
    recepcionista = Usuario(
      id: 2,
      nombres: 'Marcela',
      apellidos: 'Carvajal',
      correoElectronico: 'marcela@email.com',
      celular: '3009876543',
    );
    print('Recepcionista: ${recepcionista.nombres}');
    listaMensajesAutomaticos = List<MensajeAutomatico>();
    listaMensajesAutomaticos.add(MensajeAutomatico(
      id: 1,
      tipoMensaje: 'Bienvenida',
      mensaje: 'Bienvenido a nuestro chat de QubismartLock',
    ));
    listaMensajesAutomaticos.add(MensajeAutomatico(
      id: 2,
      tipoMensaje: 'Despedida',
      mensaje: 'Gracias, hasta pronto',
    ));
    listaMensajesAutomaticos.add(MensajeAutomatico(
      id: 3,
      tipoMensaje: 'Paquete',
      mensaje: 'Tienes un paquete',
    ));
    listaMensajesAutomaticos.add(MensajeAutomatico(
      id: 4,
      tipoMensaje: 'Check In',
      mensaje: 'Recuerda que tu check in es...',
    ));
    listaMensajesAutomaticos.add(MensajeAutomatico(
      id: 5,
      tipoMensaje: 'Check Out',
      mensaje: 'Recuerda que tu check out es...',
    ));

    opcionMensajeria = OpcionMensajeria(
      id: 1,
      bienvenida: listaMensajesAutomaticos[0],
      despedida: listaMensajesAutomaticos[1],
      paquete: listaMensajesAutomaticos[2],
      proximoCheckIn: listaMensajesAutomaticos[3],
      proximoCheckOut: listaMensajesAutomaticos[4],
      participanteAutomatico: Participante(id: 1),
    );

    listaConversaciones = List<Conversacion>();
    listaConversaciones.add(Conversacion(
      id: 1,
      denomConversacion: 'Juan Pérez',
      ordenPrioridad: 1,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));

    listaConversaciones.add(Conversacion(
      id: 2,
      denomConversacion: 'Jorge Pérez',
      ordenPrioridad: 2,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));
    listaConversaciones.add(Conversacion(
      id: 3,
      denomConversacion: 'Manuela',
      ordenPrioridad: 3,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));
    listaConversaciones.add(Conversacion(
      id: 4,
      denomConversacion: 'Marcela',
      ordenPrioridad: 4,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));
    listaConversaciones.add(Conversacion(
      id: 5,
      denomConversacion: 'Carlos García',
      ordenPrioridad: 5,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));
    listaConversaciones.add(Conversacion(
      id: 6,
      denomConversacion: 'Juan Zapata',
      ordenPrioridad: 6,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));
    listaConversaciones.add(Conversacion(
      id: 7,
      denomConversacion: 'Juan Javier',
      ordenPrioridad: 7,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));
    listaConversaciones.add(Conversacion(
      id: 8,
      denomConversacion: 'Allison Pérez',
      ordenPrioridad: 8,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));
    listaConversaciones.add(Conversacion(
      id: 8,
      denomConversacion: 'Mariela Gómez',
      ordenPrioridad: 8,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));
    listaConversaciones.add(Conversacion(
      id: 9,
      denomConversacion: 'José María ',
      ordenPrioridad: 9,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));
    listaConversaciones.add(Conversacion(
      id: 10,
      denomConversacion: 'David Solano',
      ordenPrioridad: 10,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));
    listaConversaciones.add(Conversacion(
      id: 11,
      denomConversacion: 'Miriam Parson',
      ordenPrioridad: 11,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));
    listaConversaciones.add(Conversacion(
      id: 12,
      denomConversacion: 'Gerard Jason',
      ordenPrioridad: 12,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));
    listaConversaciones.add(Conversacion(
      id: 13,
      denomConversacion: 'William Duque',
      ordenPrioridad: 13,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));
    listaConversaciones.add(Conversacion(
      id: 14,
      denomConversacion: 'Fernando Soler',
      ordenPrioridad: 14,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));
    listaConversaciones.add(Conversacion(
      id: 15,
      denomConversacion: 'Bernardo Rúa',
      ordenPrioridad: 15,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));
    listaConversaciones.add(Conversacion(
      id: 16,
      denomConversacion: 'Diana M',
      ordenPrioridad: 16,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));
    listaConversaciones.add(Conversacion(
      id: 17,
      denomConversacion: 'Nina Ochoa',
      ordenPrioridad: 17,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));
    listaConversaciones.add(Conversacion(
      id: 18,
      denomConversacion: 'Saúl Viana',
      ordenPrioridad: 18,
      fechaCreacion: DateTime.parse('2019-08-21'),
      fechaUltimoMensaje: DateTime.parse('2019-08-21'),
    ));

    listaParticipantes = List<Participante>();
    listaParticipantes.add(Participante(
        id: 1,
        conversacion: listaConversaciones[0],
        nombre: listaConversaciones[0].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 2,
        conversacion: listaConversaciones[0],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));

    listaParticipantes.add(Participante(
        id: 3,
        conversacion: listaConversaciones[1],
        nombre: listaConversaciones[1].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 4,
        conversacion: listaConversaciones[1],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));

    listaParticipantes.add(Participante(
        id: 5,
        conversacion: listaConversaciones[2],
        nombre: listaConversaciones[2].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 6,
        conversacion: listaConversaciones[2],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));
    listaParticipantes.add(Participante(
        id: 7,
        conversacion: listaConversaciones[3],
        nombre: listaConversaciones[3].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 8,
        conversacion: listaConversaciones[3],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));
    listaParticipantes.add(Participante(
        id: 9,
        conversacion: listaConversaciones[4],
        nombre: listaConversaciones[4].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 10,
        conversacion: listaConversaciones[4],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));
    listaParticipantes.add(Participante(
        id: 11,
        conversacion: listaConversaciones[5],
        nombre: listaConversaciones[5].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 12,
        conversacion: listaConversaciones[5],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));
    listaParticipantes.add(Participante(
        id: 13,
        conversacion: listaConversaciones[6],
        nombre: listaConversaciones[6].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 14,
        conversacion: listaConversaciones[6],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));
    listaParticipantes.add(Participante(
        id: 15,
        conversacion: listaConversaciones[7],
        nombre: listaConversaciones[7].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 16,
        conversacion: listaConversaciones[7],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));
    listaParticipantes.add(Participante(
        id: 17,
        conversacion: listaConversaciones[8],
        nombre: listaConversaciones[8].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 18,
        conversacion: listaConversaciones[8],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));
    listaParticipantes.add(Participante(
        id: 19,
        conversacion: listaConversaciones[9],
        nombre: listaConversaciones[9].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 20,
        conversacion: listaConversaciones[9],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));
    listaParticipantes.add(Participante(
        id: 21,
        conversacion: listaConversaciones[10],
        nombre: listaConversaciones[10].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 22,
        conversacion: listaConversaciones[10],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));
    listaParticipantes.add(Participante(
        id: 23,
        conversacion: listaConversaciones[11],
        nombre: listaConversaciones[11].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 24,
        conversacion: listaConversaciones[11],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));
    listaParticipantes.add(Participante(
        id: 25,
        conversacion: listaConversaciones[12],
        nombre: listaConversaciones[12].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 26,
        conversacion: listaConversaciones[12],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));
    listaParticipantes.add(Participante(
        id: 27,
        conversacion: listaConversaciones[13],
        nombre: listaConversaciones[13].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 28,
        conversacion: listaConversaciones[13],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));
    listaParticipantes.add(Participante(
        id: 29,
        conversacion: listaConversaciones[14],
        nombre: listaConversaciones[14].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 30,
        conversacion: listaConversaciones[14],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));
    listaParticipantes.add(Participante(
        id: 31,
        conversacion: listaConversaciones[15],
        nombre: listaConversaciones[15].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 32,
        conversacion: listaConversaciones[15],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));
    listaParticipantes.add(Participante(
        id: 33,
        conversacion: listaConversaciones[16],
        nombre: listaConversaciones[16].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 34,
        conversacion: listaConversaciones[16],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));
    listaParticipantes.add(Participante(
        id: 35,
        conversacion: listaConversaciones[17],
        nombre: listaConversaciones[17].denomConversacion,
        usuario: 1));

    listaParticipantes.add(Participante(
        id: 36,
        conversacion: listaConversaciones[17],
        nombre: '${tituloRecepcionista} ${recepcionista.nombres}',
        usuario: 2));

    listaMensajes = List<Mensaje>();
    listaMensajes.add(Mensaje(
        id: 1,
        conversacion: listaConversaciones[0],
        momento: DateTime.now(),
        participante: listaParticipantes[0],
        mensajeTexto: 'Buenos días'));
    listaMensajes.add(Mensaje(
        id: 2,
        conversacion: listaConversaciones[0],
        momento: DateTime.now(),
        participante: listaParticipantes[1],
        mensajeTexto: 'Buenos días, en qué le puedo ayudar?'));

    listaMensajes.add(Mensaje(
        id: 3,
        conversacion: listaConversaciones[1],
        momento: DateTime.now(),
        participante: listaParticipantes[2],
        mensajeTexto: 'Podría decirme donde encuentro el bar?'));
    listaMensajes.add(Mensaje(
        id: 4,
        conversacion: listaConversaciones[1],
        momento: DateTime.now(),
        participante: listaParticipantes[3],
        mensajeTexto: 'Claro, en el primer piso al fondo junto a la fuente, al lado del restaurante'));


    listaMensajes.add(Mensaje(
        id: 5,
        conversacion: listaConversaciones[2],
        momento: DateTime.now(),
        participante: listaParticipantes[4],
        mensajeTexto: 'Buenas noches'));
    listaMensajes.add(Mensaje(
        id: 6,
        conversacion: listaConversaciones[2],
        momento: DateTime.now(),
        participante: listaParticipantes[5],
        mensajeTexto: 'Sí, buenas noches'));
    listaMensajes.add(Mensaje(
        id: 7,
        conversacion: listaConversaciones[2],
        momento: DateTime.now(),
        participante: listaParticipantes[4],
        mensajeTexto: 'Díscúlpame es que me enredé con algo'));
    listaMensajes.add(Mensaje(
        id: 8,
        conversacion: listaConversaciones[2],
        momento: DateTime.now(),
        participante: listaParticipantes[5],
        mensajeTexto: 'No se preocúpe, cuénteme, en qué le puedo ayudar?'));


    listaMensajes.add(Mensaje(
        id: 9,
        conversacion: listaConversaciones[2],
        momento: DateTime.now(),
        participante: listaParticipantes[4],
        mensajeTexto: 'Cómo se modifica la temperatura del aire?'));
    listaMensajes.add(Mensaje(
        id: 10,
        conversacion: listaConversaciones[2],
        momento: DateTime.now(),
        participante: listaParticipantes[5],
        mensajeTexto: 'Muy fácil.  El termostato está al lado de la puerta principal'));
    listaMensajes.add(Mensaje(
        id: 11,
        conversacion: listaConversaciones[2],
        momento: DateTime.now(),
        participante: listaParticipantes[4],
        mensajeTexto: 'ah, ya lo ví.  Muchas gracias'));
    listaMensajes.add(Mensaje(
        id: 12,
        conversacion: listaConversaciones[2],
        momento: DateTime.now(),
        participante: listaParticipantes[5],
        mensajeTexto: 'Con mucho gusto.  Cualquier duda me pregunta'));


    listaMensajes.add(Mensaje(
        id: 13,
        conversacion: listaConversaciones[2],
        momento: DateTime.now(),
        participante: listaParticipantes[4],
        mensajeTexto: 'Oh, sí.  Otra cosita.  Podría decirme a qué hora abren el restaurante en la mañana?  Y además hasta qué horas sirven desayunos?'));
    listaMensajes.add(Mensaje(
        id: 14,
        conversacion: listaConversaciones[2],
        momento: DateTime.now(),
        participante: listaParticipantes[5],
        mensajeTexto: 'Claro, no hay problema.  El restaurante abre a las 7:00 am y sirve desayunos hasta las 11:00 am'));


    listaMensajes.add(Mensaje(
        id: 15,
        conversacion: listaConversaciones[2],
        momento: DateTime.now(),
        participante: listaParticipantes[4],
        mensajeTexto: 'Perfecto.  Feliz noche'));
    listaMensajes.add(Mensaje(
        id: 16,
        conversacion: listaConversaciones[2],
        momento: DateTime.now(),
        participante: listaParticipantes[5],
        mensajeTexto: 'Igualmente, qué descanse'));



  }

  String tituloRecepcionista = 'Recepcionista';
  Usuario usuarioActivo;
  Usuario recepcionista;

  List<Conversacion> listaConversaciones;
  List<Participante> listaParticipantes;
  List<Mensaje> listaMensajes;
  OpcionMensajeria opcionMensajeria;
  List<MensajeAutomatico> listaMensajesAutomaticos;
}