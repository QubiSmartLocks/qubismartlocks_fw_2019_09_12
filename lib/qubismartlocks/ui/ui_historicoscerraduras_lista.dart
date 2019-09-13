/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Históricos de Cerraduras
 [//Históricos de Cerraduras]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIHistoricosCerradurasLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIHistoricosCerradurasListaState createState() => _UIHistoricosCerradurasListaState();
}

class _UIHistoricosCerradurasListaState extends State<UIHistoricosCerradurasLista> {

  _HistoricosCerradurasDataSource _clientesDataSource;

  List<HistoricoCerradura> listaHistoricosCerraduras = List<HistoricoCerradura>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(HistoricoCerradura d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    HistoricosCerraduras.todos(listaHistoricosCerraduras).then((r) {
      _clientesDataSource.listaHistoricosCerraduras.clear();
      _clientesDataSource.listaHistoricosCerraduras.addAll(this.listaHistoricosCerraduras);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _HistoricosCerradurasDataSource(context, List<HistoricoCerradura>());
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
                          label: UI__EtiquetaColumna(HISTORICOSCERRADURAS.ETIQUETA_CERRADURA),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((HistoricoCerradura d) => d.cerradura.denomCerradura,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(HISTORICOSCERRADURAS.ETIQUETA_FECHA),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<DateTime>((HistoricoCerradura d) => d.fecha,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(HISTORICOSCERRADURAS.ETIQUETA_HORA),),
                      DataColumn(
                          label: UI__EtiquetaColumna(HISTORICOSCERRADURAS.ETIQUETA_USUARIO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((HistoricoCerradura d) => d.usuario,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(HISTORICOSCERRADURAS.ETIQUETA_FUNCION),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((HistoricoCerradura d) => d.funcion,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaHistoricosCerraduras.length == 0,
          'Leyendo ${HISTORICOSCERRADURAS.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _HistoricosCerradurasDataSource extends DataTableSource {
  _HistoricosCerradurasDataSource(this.context, this.listaHistoricosCerraduras);

  final List<HistoricoCerradura> listaHistoricosCerraduras; 
  final BuildContext context;

  _editarHistoricoCerradura(HistoricoCerradura registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIHistoricoCerraduraEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(HistoricoCerradura d), bool ascending) {
    listaHistoricosCerraduras.sort((HistoricoCerradura a, HistoricoCerradura b) {
      if (!ascending) {
        final HistoricoCerradura c = a;
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
    if (index >= listaHistoricosCerraduras.length) return null;
    final HistoricoCerradura historicoCerradura = listaHistoricosCerraduras[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(historicoCerradura.cerradura == null
              ? ''
              : '${historicoCerradura.cerradura.denomCerradura}'),
          onTap: _editarHistoricoCerradura(historicoCerradura),
        ),
        DataCell(
          UI__EtiquetaCelda(historicoCerradura.fecha == null
              ? ''
              : '${historicoCerradura.fecha}'),
          onTap: _editarHistoricoCerradura(historicoCerradura),
        ),
        DataCell(
          UI__EtiquetaCelda(historicoCerradura.hora == null
              ? ''
              : '${historicoCerradura.hora}'),
          onTap: _editarHistoricoCerradura(historicoCerradura),
        ),
        DataCell(
          UI__EtiquetaCelda(historicoCerradura.usuario == null
              ? ''
              : '${historicoCerradura.usuario}'),
          onTap: _editarHistoricoCerradura(historicoCerradura),
        ),
        DataCell(
          UI__EtiquetaCelda(historicoCerradura.funcion == null
              ? ''
              : '${historicoCerradura.funcion}'),
          onTap: _editarHistoricoCerradura(historicoCerradura),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaHistoricosCerraduras.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

