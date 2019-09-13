/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Logs de Cerraduras
 [//Logs de Cerraduras]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UILogsCerradurasLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UILogsCerradurasListaState createState() => _UILogsCerradurasListaState();
}

class _UILogsCerradurasListaState extends State<UILogsCerradurasLista> {

  _LogsCerradurasDataSource _clientesDataSource;

  List<LogCerradura> listaLogsCerraduras = List<LogCerradura>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(LogCerradura d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    LogsCerraduras.todos(listaLogsCerraduras).then((r) {
      _clientesDataSource.listaLogsCerraduras.clear();
      _clientesDataSource.listaLogsCerraduras.addAll(this.listaLogsCerraduras);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _LogsCerradurasDataSource(context, List<LogCerradura>());
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
                          label: UI__EtiquetaColumna(LOGSCERRADURAS.ETIQUETA_CERRADURA),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((LogCerradura d) => d.cerradura.denomCerradura,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(LOGSCERRADURAS.ETIQUETA_FECHA),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<DateTime>((LogCerradura d) => d.fecha,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(LOGSCERRADURAS.ETIQUETA_HORA),),
                      DataColumn(
                          label: UI__EtiquetaColumna(LOGSCERRADURAS.ETIQUETA_DETLOG),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((LogCerradura d) => d.detLog,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaLogsCerraduras.length == 0,
          'Leyendo ${LOGSCERRADURAS.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _LogsCerradurasDataSource extends DataTableSource {
  _LogsCerradurasDataSource(this.context, this.listaLogsCerraduras);

  final List<LogCerradura> listaLogsCerraduras; 
  final BuildContext context;

  _editarLogCerradura(LogCerradura registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UILogCerraduraEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(LogCerradura d), bool ascending) {
    listaLogsCerraduras.sort((LogCerradura a, LogCerradura b) {
      if (!ascending) {
        final LogCerradura c = a;
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
    if (index >= listaLogsCerraduras.length) return null;
    final LogCerradura logCerradura = listaLogsCerraduras[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(logCerradura.cerradura == null
              ? ''
              : '${logCerradura.cerradura.denomCerradura}'),
          onTap: _editarLogCerradura(logCerradura),
        ),
        DataCell(
          UI__EtiquetaCelda(logCerradura.fecha == null
              ? ''
              : '${logCerradura.fecha}'),
          onTap: _editarLogCerradura(logCerradura),
        ),
        DataCell(
          UI__EtiquetaCelda(logCerradura.hora == null
              ? ''
              : '${logCerradura.hora}'),
          onTap: _editarLogCerradura(logCerradura),
        ),
        DataCell(
          UI__EtiquetaCelda(logCerradura.detLog == null
              ? ''
              : '${logCerradura.detLog}'),
          onTap: _editarLogCerradura(logCerradura),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaLogsCerraduras.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

