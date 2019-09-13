/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Room Rates
 [//Room Rates]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIRoomRatesLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIRoomRatesListaState createState() => _UIRoomRatesListaState();
}

class _UIRoomRatesListaState extends State<UIRoomRatesLista> {

  _RoomRatesDataSource _clientesDataSource;

  List<RoomRate> listaRoomRates = List<RoomRate>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(RoomRate d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    RoomRates.todos(listaRoomRates).then((r) {
      _clientesDataSource.listaRoomRates.clear();
      _clientesDataSource.listaRoomRates.addAll(this.listaRoomRates);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _RoomRatesDataSource(context, List<RoomRate>());
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
                          label: UI__EtiquetaColumna(ROOMRATES.ETIQUETA_NAME),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((RoomRate d) => d.name,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(ROOMRATES.ETIQUETA_ROOM_TYPE_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((RoomRate d) => d.room_type_id,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(ROOMRATES.ETIQUETA_HOUSEKEEPING_WARNING),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((RoomRate d) => d.housekeeping_warning,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(ROOMRATES.ETIQUETA_HOUSEKEEPING_STATUS),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((RoomRate d) => d.housekeeping_status,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(ROOMRATES.ETIQUETA_DESCRIPTION),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((RoomRate d) => d.description,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(ROOMRATES.ETIQUETA_SORT_ORDER),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((RoomRate d) => d.sort_order,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(ROOMRATES.ETIQUETA_LOCATION_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((RoomRate d) => d.location_id,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaRoomRates.length == 0,
          'Leyendo ${ROOMRATES.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _RoomRatesDataSource extends DataTableSource {
  _RoomRatesDataSource(this.context, this.listaRoomRates);

  final List<RoomRate> listaRoomRates; 
  final BuildContext context;

  _editarRoomRate(RoomRate registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIRoomRateEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(RoomRate d), bool ascending) {
    listaRoomRates.sort((RoomRate a, RoomRate b) {
      if (!ascending) {
        final RoomRate c = a;
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
    if (index >= listaRoomRates.length) return null;
    final RoomRate roomRate = listaRoomRates[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(roomRate.name == null
              ? ''
              : '${roomRate.name}'),
          onTap: _editarRoomRate(roomRate),
        ),
        DataCell(
          UI__EtiquetaCelda(roomRate.room_type_id == null
              ? ''
              : '${roomRate.room_type_id}'),
          onTap: _editarRoomRate(roomRate),
        ),
        DataCell(
          UI__EtiquetaCelda(roomRate.housekeeping_warning == null
              ? ''
              : '${roomRate.housekeeping_warning}'),
          onTap: _editarRoomRate(roomRate),
        ),
        DataCell(
          UI__EtiquetaCelda(roomRate.housekeeping_status == null
              ? ''
              : '${roomRate.housekeeping_status}'),
          onTap: _editarRoomRate(roomRate),
        ),
        DataCell(
          UI__EtiquetaCelda(roomRate.description == null
              ? ''
              : '${roomRate.description}'),
          onTap: _editarRoomRate(roomRate),
        ),
        DataCell(
          UI__EtiquetaCelda(roomRate.sort_order == null
              ? ''
              : '${roomRate.sort_order}'),
          onTap: _editarRoomRate(roomRate),
        ),
        DataCell(
          UI__EtiquetaCelda(roomRate.location_id == null
              ? ''
              : '${roomRate.location_id}'),
          onTap: _editarRoomRate(roomRate),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaRoomRates.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

