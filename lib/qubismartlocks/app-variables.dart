// Proyecto: Qubi Smart Locks
// Version: 0.0.2
// Autor: Abner Hernández
// Unidad: app-variables.dart
// Variables de la Aplicación

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class App {
  static final AppVariables variables = AppVariables();
  static final String ESTILO_ITEM_TITULO = 'estiloItemTitulo';
  static final String ESTILO_ITEM_DATO = 'estiloItemTitulo';
}


class AppVariables {

  calculeAnchoResponsive(
      BuildContext context, double bp1, double bp2, double bp3, double bp4) {
    double retorno;
    if (MediaQuery.of(context).size.width <=
        AppRes.appResMap[Co.WEB_BREAK_POINT_4]) {
      retorno = MediaQuery.of(context).size.width * bp4;
    } else {
      if (MediaQuery.of(context).size.width <=
          AppRes.appResMap[Co.WEB_BREAK_POINT_3]) {
        retorno = MediaQuery.of(context).size.width * bp3;
      } else {
        if (MediaQuery.of(context).size.width <=
            AppRes.appResMap[Co.WEB_BREAK_POINT_2]) {
          retorno = MediaQuery.of(context).size.width * bp2;
        } else {
          retorno = MediaQuery.of(context).size.width * bp1;
        }
      }
    }
    return retorno;
  }

  calcular(BuildContext context) {
    if (!CD.iniciado) CD.iniciar(context);

    // TODO: Que se pudiera configurar todo desde base de datos

    AppRes.appResMap['AppName'] = 'QubiSmartLocks';
    AppRes.appResMap['AppDenom'] = 'Qubi Smart Locks';
    AppRes.appResMap[Co.LOGO_P] = 'assets/images/icono1.png';
    AppRes.appResMap[Co.LOGO_M] = 'assets/images/icono1.png';
    AppRes.appResMap[Co.LOGO_G] = 'assets/images/icono1.png'; // 1024x1024

    AppRes.appResMap[Co.BACKGROUND_1] = 'assets/images/background1.jpg';
    AppRes.appResMap[Co.BACKGROUND_2] = 'assets/images/background1.jpg';
    AppRes.appResMap[Co.BACKGROUND_3] = 'assets/images/background1.jpg';

    AppRes.appResMap[Co.BACKGROUND_ADMIN] = 'images/landscape-404072__340.jpg';
    AppRes.appResMap[Co.BACKGROUND_LOGIN] = 'imagenes/BACKGROUND_LOGIN.png';
    AppRes.appResMap[Co.BACKGROUND_DRAWER] = 'imagenes/BACKGROUND_DRAWER.png';
    AppRes.appResMap[Co.BACKGROUND_HOME] = 'imagenes/HOME.png';
//    AppRes.appResMap[Co.BACKGROUND_DASHBOARD] = 'imagenes/DASHBOARD.png';
//    AppRes.appResMap[Co.BACKGROUND_LIST] = 'imagenes/LISTAS.png';
//    AppRes.appResMap[Co.BACKGROUND_FORM] = 'imagenes/FORMULARIOS.png';
//    AppRes.appResMap[Co.BACKGROUND_REPORTS] = 'imagenes/REPORTES.png';
//    AppRes.appResMap[Co.BACKGROUND_GRAPH] = 'imagenes/GRAFICOS.png';


    AppRes.appResMap[Co.BACKGROUND_LATERAL] = 'images/web_qubi-28.png';
    AppRes.appResMap[Co.BACKGROUND_CLIENTES] = 'images/web_qubi-17.png';


    AppRes.appResMap[Co.BACKGROUND_SCREEN] = 'images/web_qubi-12.png';


    AppRes.appResMap[Co.FONT_1L] = 'QuicksandLight';
    AppRes.appResMap[Co.FONT_1R] = 'QuicksandRegular1x';
    AppRes.appResMap[Co.FONT_1M] = 'QuicksandMedium';
    AppRes.appResMap[Co.FONT_1B] = 'QuicksandBold';

    AppRes.appResMap[Co.FONT_2L] = 'QuicksandLight';
    AppRes.appResMap[Co.FONT_2R] = 'QuicksandRegular2';
    AppRes.appResMap[Co.FONT_2M] = 'QuicksandMedium';
    AppRes.appResMap[Co.FONT_2B] = 'QuicksandBold';

    AppRes.appResMap[Co.FONT_3L] = 'QuicksandLight';
    AppRes.appResMap[Co.FONT_3R] = 'QuicksandRegular3';
    AppRes.appResMap[Co.FONT_3M] = 'QuicksandMedium';
    AppRes.appResMap[Co.FONT_3B] = 'QuicksandBold';

    AppRes.appResMap[Co.FONT_4R] = 'PoppinsRegular';
    AppRes.appResMap[Co.FONT_4B] = 'PoppinsBold';

    var blanco = Colors.white;
    var negro = Colors.black;
    var gris = Colors.grey;
    var verde = Color(0xFF00B445);
    var azulMarino = Color(0xFF1F3C88);
    var azulOscuro = Color(0xFF283865);
    var azulClaro = Color(0xFF5893D4);
    var azulClarito = Color(0xFF7EB8C0);
    var azulLogo = Color(0xFF00ACDB);
    var grisClaro = Color(0xFFF1F0F0);


    AppRes.appResMap[Co.COLOR_1] = negro;
    AppRes.appResMap[Co.FONDO_1] = blanco;

    AppRes.appResMap[Co.COLOR_2] = azulClarito;
    AppRes.appResMap[Co.FONDO_2] = blanco;

    AppRes.appResMap[Co.COLOR_3] = blanco;
    AppRes.appResMap[Co.FONDO_3] = azulMarino;

    AppRes.appResMap[Co.COLOR_4] = blanco;
    AppRes.appResMap[Co.FONDO_4] = negro;

    AppRes.appResMap[Co.COLOR_5] = blanco;
    AppRes.appResMap[Co.FONDO_5] = verde;

    AppRes.appResMap[Co.COLOR_6] = azulOscuro;
    AppRes.appResMap[Co.FONDO_6] = blanco;

    AppRes.appResMap[Co.FONDO_7] = azulClaro;
    AppRes.appResMap[Co.FONDO_8] = grisClaro;
    AppRes.appResMap[Co.FONDO_9] = grisClaro;
    AppRes.appResMap[Co.FONDO_10] = grisClaro;

    AppRes.appResMap[Co.COLOR_ITEM_LISTA] = Colors.green;
    AppRes.appResMap[Co.COLOR_TITULO_LISTA] = Color(0xFFF7B633);
    AppRes.appResMap[Co.COLOR_TITULO_EDICION] = Color(0xFFF7B633);

    AppRes.appResMap[Co.COLOR_TEXTO_EDICION] = AppRes.appResMap[Co.COLOR_1];
    AppRes.appResMap[Co.COLOR_FONDO_TEXTO_EDICION] = AppRes.appResMap[Co.FONDO_10];

    AppRes.appResMap[Co.COLOR_FONDO_ITEM_LISTA] = azulClarito;
    AppRes.appResMap[Co.COLOR_FONDO_TITULO_LISTA] = azulMarino;
    AppRes.appResMap[Co.COLOR_FONDO_TITULO_EDICION] = Color(0xFF1F3C88);
    AppRes.appResMap[Co.COLOR_TEXTO_BOTON_PRINCIPAL] = negro;

    AppRes.appResMap[Co.COLOR_BORDE_ACTIVO] = azulLogo;
    AppRes.appResMap[Co.COLOR_BORDE_INACTIVO] = gris;
    AppRes.appResMap[Co.ANCHO_BORDE] = 3.0;
    AppRes.appResMap[Co.PORCENTAJE_RADIO_BORDE] = 25.0;


    // Login/Authentication providers
    AppRes.appResMap[Co.LOGIN_EMAIL] = true;
    AppRes.appResMap[Co.LOGIN_GOOGLE] = true;
    AppRes.appResMap[Co.LOGIN_FACEBOOK] = true;
    AppRes.appResMap[Co.LOGIN_TWITTER] = true;

    AppRes.appResMap[Co.TAMAYO_ICONOS_LOGIN] = 35;

    // Calcular Estilos
//    App.estilos.estilos();

    // Calcular Botones
//    App.botones.botones();

    AppRes.appResMap[Co.TAMAYO_FUENTE_EDICION] = 25.0;
    AppRes.appResMap[Co.TAMAYO_FUENTE_ETIQUETA] = 20.0;
    AppRes.appResMap[Co.ALTO_EDICION] = 55.0;


    // Estilo de Títulos de Formulario
    AppRes.appResMap[Co.ESTILO_TITULO] = TextStyle(
      fontFamily: AppRes.appResMap[Co.FONT_4B],
      fontSize: 30.0,
      color: AppRes.appResMap[Co.COLOR_6],
      //letterSpacing: 2.0,
    );

    // Estilo de Etiquetas de Formularios
    AppRes.appResMap[Co.ESTILO_ETIQUETA] = TextStyle(
      fontFamily: AppRes.appResMap[Co.FONT_4R],
      fontSize: AppRes.appResMap[Co.TAMAYO_FUENTE_ETIQUETA],
      color: AppRes.appResMap[Co.COLOR_2],
//      letterSpacing: 2.0,
      backgroundColor: AppRes.appResMap[Co.FONDO_2],
    );

    AppRes.appResMap[Co.ESTILO_BOTON] = TextStyle(
      fontFamily: AppRes.appResMap[Co.FONT_4R],
      fontSize: AppRes.appResMap[Co.TAMAYO_FUENTE_ETIQUETA],
      color: AppRes.appResMap[Co.COLOR_3],
//      letterSpacing: 2.0,
      backgroundColor: AppRes.appResMap[Co.COLOR_2],
    );

// Estilo de Fuentes del Título de la Tabla
    AppRes.appResMap[Co.ESTILO_FUENTE_TITULO_TABLA] =
        TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.blue
        );


// Estilo de Fuentes de los Registros de la Tabla
    AppRes.appResMap[Co.ESTILO_FUENTE_REGISTRO_TABLA] =
        TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Colors.grey,
        );




    ///////    ////////  ///////////  //  //         ///////     /////////
    //        //            //        //  //        //    //    //
    ////      ///////       //        //  //        //    //    /////////
    //              //      //        //  //        //   //            //
    ///////  ////////       //        //  //////// ///////     /////////

    /// Estilo de la fuente dentro del Textfield del campo de edicion de texto
    AppRes.appResMap[Co.ESTILO_EDICION] = TextStyle(
      fontFamily: AppRes.appResMap[Co.FONT_4R],
      fontSize: 20, //AppRes.appResMap[Co.TAMAYO_FUENTE_EDICION],
      color: AppRes.appResMap[Co.COLOR_1],
      //AppRes.appResMap[Co.COLOR_TEXTO_EDICION],
//      letterSpacing: 2.0,
      backgroundColor: Colors.transparent,
    );

    AppRes.appResMap[Co.ESTILO_DATO] = TextStyle(
      fontFamily: AppRes.appResMap[Co.FONT_1R],
      fontSize: 15.0,
      color: AppRes.appResMap[Co.COLOR_1],
    );

    // Estilo de botones bgb
    AppRes.appResMap[Co.ESTILO_BOTONES_BGB] = TextStyle(
      color: AppRes.appResMap[Co.COLOR_3],
      fontSize: 18,
      fontFamily: AppRes.appResMap[Co.FONT_4R],
      //fontWeight: FontWeight.w300
    );






    // Decoraciones

    // Decoración para TextFomrField
    AppRes.appResMap[Co.DECORACION_CAMPO_FORMULARIO] = TextStyle(
        color: AppRes.appResMap[Co.COLOR_1],
        fontSize: 22,
        fontFamily: AppRes.appResMap[Co.FONT_4R],
        fontWeight: FontWeight.w300);

// Decoración del menú QubiLocks
    AppRes.appResMap[Co.DECORACION_CAMPO_MENU] = TextStyle(
        color: AppRes.appResMap[Co.COLOR_2],
        fontSize: 25,
        fontFamily: AppRes.appResMap[Co.FONT_4R],
        fontWeight: FontWeight.w300);



    // Decoración de Container con bordes circular
    AppRes.appResMap[Co.DECORACION_CAJA_CIRCULAR] = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppRes.appResMap[Co.FONDO_8],
    );

    AppRes.appResMap[Co.DECORACION_CAJA_RECTANGULAR_BORDE_REDONDEADO] = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppRes.appResMap[Co.FONDO_8],
    );

    AppRes.appResMap[Co.DECORACION_EDICION] =
        BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: AppRes.appResMap[Co.COLOR_1],
        );

    /*AppRes.appResMap[Co.DECORACION_EDICION] = decoracionEdicion;
      BoxShape shape; BoxShape.rectangle;
    ;*/

    AppRes.appResMap[Co.DECORACION_CONTENEDOR_EDICION] = BoxDecoration(
      border: Border.all(
        width: 2.0,
        color: AppRes.appResMap[Co.COLOR_TEXTO_EDICION],),
//      borderRadius: BorderRadius.all(Radius.circular(AppRes.appResMap[Co.ALTO_EDICION] / 2)),
      color: AppRes.appResMap[Co.COLOR_FONDO_TEXTO_EDICION],
    );

    // WEB RESPONSIVE

    // TODO: Cambiar de acuerdo a calculos reales o a variables en la BD
    // Vertical break point according the width of the screen
    AppRes.appResMap[Co.WEB_BREAK_POINT_1] = 100000;
    AppRes.appResMap[Co.WEB_BREAK_POINT_2] = 800;
    AppRes.appResMap[Co.WEB_BREAK_POINT_3] = 800;
    AppRes.appResMap[Co.WEB_BREAK_POINT_4] = 800;

    // Horizontal break point according the height of the screen
    AppRes.appResMap[Co.WEB_VERTICAL_BREAK_POINT_1] = 100000;
    AppRes.appResMap[Co.WEB_VERTICAL_BREAK_POINT_2] = 800;
    AppRes.appResMap[Co.WEB_VERTICAL_BREAK_POINT_3] = 600;
    AppRes.appResMap[Co.WEB_VERTICAL_BREAK_POINT_4] = 500;


    // Mensajes de campos nulos
    AppRes.appResMap[Co.MENSAJE_FECHA_NULA] = '<Fecha NO definida>';
//    AppRes.appResMap[Co.MENSAJE_HORA_NULA] = '<Hora no definida>';

    // Tipo de Base de Datos
    AppRes.appResMap[Co.TIPO_BASE_DATOS] = TipoBaseDatos.SQL;

    AppRes.appResMap[Co.LISTA_ALTO_ENCABEZADO] = 0.0;
    AppRes.appResMap[Co.LISTA_ESPACIO_ENTRE_COLUMNAS] = 5.0;
    AppRes.appResMap[Co.LISTA_ALTO_FILA] = 25.0;
    AppRes.appResMap[Co.LISTA_ALTO_TITULOS] = 25.0;
    AppRes.appResMap[Co.LISTA_FACTOR_ALTO_TOTAL] = .65;
    AppRes.appResMap[Co.LISTA_FACTOR_ANCHO_TOTAL] = .65;
    AppRes.appResMap[Co.LISTA_ALTO_PIE_PAGINACION] = 56;



    // Decoracion Gradiente
    AppRes.appResMap[Co.DECORACION_HORIZONTAL_GRADIENT_RTL] = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
//        stops: [0.9, 0.7, 0.5, 0.1],
        stops: [0.1, 0.3, 0.5, 0.7],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.indigo[800],
          Colors.indigo[700],
          Colors.indigo[600],
          Colors.indigo[400],
        ],
      ),
      border: Border.all(
        color: Colors.transparent,
      ),
    );

    AppRes.appResMap[Co.DECORACION_HORIZONTAL_GRADIENT_LTR] = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.9, 0.7, 0.5, 0.1],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.indigo[800],
          Colors.indigo[700],
          Colors.indigo[600],
          Colors.indigo[400],
        ],
      ),
      border: Border.all(
        color: Colors.transparent,
      ),
    );


    AppRes.appResMap[Co.DECORACION_GRADIENTE] = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.9, 0.7, 0.5, 0.1],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.indigo[800],
          Colors.indigo[700],
          Colors.indigo[600],
          Colors.indigo[400],
        ],
      ),
      border: Border.all(
        color: Colors.transparent,
      ),
    );

    // Mensajes sobremontados en Listados y otros
    AppRes.appResMap[Co.FONDO_CONTENEDOR_MENSAJE] = AppRes.appResMap[Co.FONDO_2];
    AppRes.appResMap[Co.FONDO_MENSAJE] = AppRes.appResMap[Co.FONDO_1];
    AppRes.appResMap[Co.ESTILO_MENSAJE] = TextStyle(
      fontSize: 15,
      color: AppRes.appResMap[Co.COLOR_1],
      fontWeight: FontWeight.bold,
    );


  }
}

double AltoFormaLogin() {
  return 400;
}

InputDecoration decoracionEdicion(String ayuda) {
//  return null;
//  return InputDecoration(
//    focusedBorder: InputBorder.none,
//    hintText: ayuda,
//    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  // border: InputBorder.none,

//    OutlineInputBorder(
//      borderRadius: BorderRadius.circular(AppRes.appResMap[Co.ALTO_EDICION]/2),
//      borderSide: BorderSide(color: AppRes.appResMap[Co.COLOR_FONDO_TEXTO_EDICION], width: 10, style: BorderStyle.solid),
////      gapPadding: 3,
//    ),
  // borderRadius: BorderRadius.circular(32.0)),
//  );
}
