/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Tipos de Identificación
 [//Tipos de Identificación]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UITiposIdentLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UITiposIdentListaState createState() => _UITiposIdentListaState();
}

class _UITiposIdentListaState extends State<UITiposIdentLista> {

  _TiposIdentDataSource _clientesDataSource;

  List<TipoIdent> listaTiposIdent = List<TipoIdent>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(TipoIdent d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    TiposIdent.todos(listaTiposIdent).then((r) {
      _clientesDataSource.listaTiposIdent.clear();
      _clientesDataSource.listaTiposIdent.addAll(this.listaTiposIdent);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _TiposIdentDataSource(context, List<TipoIdent>());
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
                          label: UI__EtiquetaColumna(TIPOSIDENT.ETIQUETA_DENOMTIPOIDENT),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((TipoIdent d) => d.denomTipoIdent,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaTiposIdent.length == 0,
          'Leyendo ${TIPOSIDENT.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _TiposIdentDataSource extends DataTableSource {
  _TiposIdentDataSource(this.context, this.listaTiposIdent);

  final List<TipoIdent> listaTiposIdent; 
  final BuildContext context;

  _editarTipoIdent(TipoIdent registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UITipoIdentEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(TipoIdent d), bool ascending) {
    listaTiposIdent.sort((TipoIdent a, TipoIdent b) {
      if (!ascending) {
        final TipoIdent c = a;
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
    if (index >= listaTiposIdent.length) return null;
    final TipoIdent tipoIdent = listaTiposIdent[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(tipoIdent.denomTipoIdent == null
              ? ''
              : '${tipoIdent.denomTipoIdent}'),
          onTap: _editarTipoIdent(tipoIdent),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaTiposIdent.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

