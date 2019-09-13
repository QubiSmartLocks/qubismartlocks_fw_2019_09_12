/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Reservaciones
 [//Reservaciones]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIReservacionesLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIReservacionesListaState createState() => _UIReservacionesListaState();
}

class _UIReservacionesListaState extends State<UIReservacionesLista> {

  _ReservacionesDataSource _clientesDataSource;

  List<Reservacion> listaReservaciones = List<Reservacion>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(Reservacion d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    Reservaciones.todos(listaReservaciones).then((r) {
      _clientesDataSource.listaReservaciones.clear();
      _clientesDataSource.listaReservaciones.addAll(this.listaReservaciones);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _ReservacionesDataSource(context, List<Reservacion>());
    _inicializar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    CD.iniciar(context);

    double headerHeight = AppRes.appResMap[Co.LISTA_ALTO_ENCABEZADO];
    double columnSpacing = AppRes.appResMap[Co.LISTA_ESPACIO_ENTRE_COLUMNAS];
    double dataRowHeight = AppRes.appResMap[Co.LISTA_ALTO_FILA];
    double headingRowHeight = AppRes.appResMap[Co.LISTA_ALTO_TITULOS];
    double altoTotal = CD.alto * AppRes.appResMap[Co.LISTA_FACTOR_ALTO_TOTAL];
    double anchoTotal = CD.ancho * AppRes.appResMap[Co.LISTA_FACTOR_ANCHO_TOTAL];
    double footerHeight = AppRes.appResMap[Co.LISTA_ALTO_PIE_PAGINACION];
    _rowsPerPage =
        ((altoTotal
            - headerHeight
            - headingRowHeight
            - footerHeight) / dataRowHeight).toInt() - 1;

    List<int> availableRowsPerPage = [_rowsPerPage];
    return Stack(
      children: <Widget>[
              Container(
                width: anchoTotal,
                height: altoTotal,
                padding: EdgeInsets.all(5),
                child: PaginatedDataTable(
                    header: Container(),
                    columnSpacing: columnSpacing,
                    dataRowHeight: dataRowHeight,
                    headingRowHeight: headingRowHeight,
                    horizontalMargin: 24.0,
                    rowsPerPage: _rowsPerPage,
                    onRowsPerPageChanged: (int value) {
                      setState(() {
                        _rowsPerPage = value;
                      });
                    },
                    sortColumnIndex: _sortColumnIndex,
                    sortAscending: _sortAscending,
                    onSelectAll: _clientesDataSource._selectAll,
                    availableRowsPerPage: availableRowsPerPage,
                    dragStartBehavior: DragStartBehavior.down,
                    columns: <DataColumn>[
                      DataColumn(
                          label: UI__EtiquetaColumna(RESERVACIONES.ETIQUETA_NUMERORESERVACION),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Reservacion d) => d.numeroReservacion,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(RESERVACIONES.ETIQUETA_FECHALLEGADA),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<DateTime>((Reservacion d) => d.fechaLlegada,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(RESERVACIONES.ETIQUETA_FECHASALIDA),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<DateTime>((Reservacion d) => d.fechaSalida,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(RESERVACIONES.ETIQUETA_TIPOUNIDADFUNCIONAL),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Reservacion d) => d.tipoUnidadFuncional.denomTipoUnidadFuncional,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(RESERVACIONES.ETIQUETA_UNIDADFUNCIONAL),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Reservacion d) => d.unidadFuncional.denomUnidadFuncional,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(RESERVACIONES.ETIQUETA_ADULTOS),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Reservacion d) => d.adultos,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(RESERVACIONES.ETIQUETA_NIYOS),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Reservacion d) => d.niyos,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(RESERVACIONES.ETIQUETA_REFERENCIANUMERO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Reservacion d) => d.referenciaNumero,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(RESERVACIONES.ETIQUETA_FECHAREFERENCIA),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<DateTime>((Reservacion d) => d.fechaReferencia,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(RESERVACIONES.ETIQUETA_ESTADORESERVACION),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Reservacion d) => d.estadoReservacion.denomEstadoReservacion,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaReservaciones.length == 0,
          'Leyendo ${RESERVACIONES.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _ReservacionesDataSource extends DataTableSource {
  _ReservacionesDataSource(this.context, this.listaReservaciones);

  final List<Reservacion> listaReservaciones; 
  final BuildContext context;

  _editarReservacion(Reservacion registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIReservacionEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(Reservacion d), bool ascending) {
    listaReservaciones.sort((Reservacion a, Reservacion b) {
      if (!ascending) {
        final Reservacion c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= listaReservaciones.length) return null;
    final Reservacion reservacion = listaReservaciones[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(reservacion.numeroReservacion == null
              ? ''
              : '${reservacion.numeroReservacion}'),
          onTap: _editarReservacion(reservacion),
        ),
        DataCell(
          UI__EtiquetaCelda(reservacion.fechaLlegada == null
              ? ''
              : '${reservacion.fechaLlegada}'),
          onTap: _editarReservacion(reservacion),
        ),
        DataCell(
          UI__EtiquetaCelda(reservacion.fechaSalida == null
              ? ''
              : '${reservacion.fechaSalida}'),
          onTap: _editarReservacion(reservacion),
        ),
        DataCell(
          UI__EtiquetaCelda(reservacion.tipoUnidadFuncional == null
              ? ''
              : '${reservacion.tipoUnidadFuncional.denomTipoUnidadFuncional}'),
          onTap: _editarReservacion(reservacion),
        ),
        DataCell(
          UI__EtiquetaCelda(reservacion.unidadFuncional == null
              ? ''
              : '${reservacion.unidadFuncional.denomUnidadFuncional}'),
          onTap: _editarReservacion(reservacion),
        ),
        DataCell(
          UI__EtiquetaCelda(reservacion.adultos == null
              ? ''
              : '${reservacion.adultos}'),
          onTap: _editarReservacion(reservacion),
        ),
        DataCell(
          UI__EtiquetaCelda(reservacion.niyos == null
              ? ''
              : '${reservacion.niyos}'),
          onTap: _editarReservacion(reservacion),
        ),
        DataCell(
          UI__EtiquetaCelda(reservacion.referenciaNumero == null
              ? ''
              : '${reservacion.referenciaNumero}'),
          onTap: _editarReservacion(reservacion),
        ),
        DataCell(
          UI__EtiquetaCelda(reservacion.fechaReferencia == null
              ? ''
              : '${reservacion.fechaReferencia}'),
          onTap: _editarReservacion(reservacion),
        ),
        DataCell(
          UI__EtiquetaCelda(reservacion.estadoReservacion == null
              ? ''
              : '${reservacion.estadoReservacion.denomEstadoReservacion}'),
          onTap: _editarReservacion(reservacion),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaReservaciones.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

