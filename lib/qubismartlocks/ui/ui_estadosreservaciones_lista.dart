/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Estados de Reservaciones
 [//Estados de Reservaciones]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIEstadosReservacionesLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIEstadosReservacionesListaState createState() => _UIEstadosReservacionesListaState();
}

class _UIEstadosReservacionesListaState extends State<UIEstadosReservacionesLista> {

  _EstadosReservacionesDataSource _clientesDataSource;

  List<EstadoReservacion> listaEstadosReservaciones = List<EstadoReservacion>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(EstadoReservacion d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    EstadosReservaciones.todos(listaEstadosReservaciones).then((r) {
      _clientesDataSource.listaEstadosReservaciones.clear();
      _clientesDataSource.listaEstadosReservaciones.addAll(this.listaEstadosReservaciones);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _EstadosReservacionesDataSource(context, List<EstadoReservacion>());
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
                          label: UI__EtiquetaColumna(ESTADOSRESERVACIONES.ETIQUETA_DENOMESTADORESERVACION),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((EstadoReservacion d) => d.denomEstadoReservacion,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(ESTADOSRESERVACIONES.ETIQUETA_DESCESTADORESERVACION),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((EstadoReservacion d) => d.descEstadoReservacion,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(ESTADOSRESERVACIONES.ETIQUETA_VISIBLE),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaEstadosReservaciones.length == 0,
          'Leyendo ${ESTADOSRESERVACIONES.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _EstadosReservacionesDataSource extends DataTableSource {
  _EstadosReservacionesDataSource(this.context, this.listaEstadosReservaciones);

  final List<EstadoReservacion> listaEstadosReservaciones; 
  final BuildContext context;

  _editarEstadoReservacion(EstadoReservacion registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIEstadoReservacionEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(EstadoReservacion d), bool ascending) {
    listaEstadosReservaciones.sort((EstadoReservacion a, EstadoReservacion b) {
      if (!ascending) {
        final EstadoReservacion c = a;
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
    if (index >= listaEstadosReservaciones.length) return null;
    final EstadoReservacion estadoReservacion = listaEstadosReservaciones[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(estadoReservacion.denomEstadoReservacion == null
              ? ''
              : '${estadoReservacion.denomEstadoReservacion}'),
          onTap: _editarEstadoReservacion(estadoReservacion),
        ),
        DataCell(
          UI__EtiquetaCelda(estadoReservacion.descEstadoReservacion == null
              ? ''
              : '${estadoReservacion.descEstadoReservacion}'),
          onTap: _editarEstadoReservacion(estadoReservacion),
        ),
        DataCell(
          UI__EtiquetaCelda(estadoReservacion.visible == null
              ? ''
              : '${estadoReservacion.visible}'),
          onTap: _editarEstadoReservacion(estadoReservacion),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaEstadosReservaciones.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

