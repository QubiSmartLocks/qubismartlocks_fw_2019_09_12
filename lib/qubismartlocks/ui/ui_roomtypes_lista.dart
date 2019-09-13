/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Room Types
 [//Room Types]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIRoomTypesLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIRoomTypesListaState createState() => _UIRoomTypesListaState();
}

class _UIRoomTypesListaState extends State<UIRoomTypesLista> {

  _RoomTypesDataSource _clientesDataSource;

  List<RoomType> listaRoomTypes = List<RoomType>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(RoomType d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    RoomTypes.todos(listaRoomTypes).then((r) {
      _clientesDataSource.listaRoomTypes.clear();
      _clientesDataSource.listaRoomTypes.addAll(this.listaRoomTypes);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _RoomTypesDataSource(context, List<RoomType>());
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
                          label: UI__EtiquetaColumna(ROOMTYPES.ETIQUETA_NAME),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((RoomType d) => d.name,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(ROOMTYPES.ETIQUETA_LOCATION_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((RoomType d) => d.location_id,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaRoomTypes.length == 0,
          'Leyendo ${ROOMTYPES.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _RoomTypesDataSource extends DataTableSource {
  _RoomTypesDataSource(this.context, this.listaRoomTypes);

  final List<RoomType> listaRoomTypes; 
  final BuildContext context;

  _editarRoomType(RoomType registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIRoomTypeEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(RoomType d), bool ascending) {
    listaRoomTypes.sort((RoomType a, RoomType b) {
      if (!ascending) {
        final RoomType c = a;
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
    if (index >= listaRoomTypes.length) return null;
    final RoomType roomType = listaRoomTypes[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(roomType.name == null
              ? ''
              : '${roomType.name}'),
          onTap: _editarRoomType(roomType),
        ),
        DataCell(
          UI__EtiquetaCelda(roomType.location_id == null
              ? ''
              : '${roomType.location_id}'),
          onTap: _editarRoomType(roomType),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaRoomTypes.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

