/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Unidades Funcionales
 [//Unidades Funcionales]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIUnidadesFuncionalesLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIUnidadesFuncionalesListaState createState() => _UIUnidadesFuncionalesListaState();
}

class _UIUnidadesFuncionalesListaState extends State<UIUnidadesFuncionalesLista> {

  _UnidadesFuncionalesDataSource _clientesDataSource;

  List<UnidadFuncional> listaUnidadesFuncionales = List<UnidadFuncional>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(UnidadFuncional d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    UnidadesFuncionales.todos(listaUnidadesFuncionales).then((r) {
      _clientesDataSource.listaUnidadesFuncionales.clear();
      _clientesDataSource.listaUnidadesFuncionales.addAll(this.listaUnidadesFuncionales);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _UnidadesFuncionalesDataSource(context, List<UnidadFuncional>());
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
                          label: UI__EtiquetaColumna(UNIDADESFUNCIONALES.ETIQUETA_TIPOUNIDADFUNCIONAL),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((UnidadFuncional d) => d.tipoUnidadFuncional.denomTipoUnidadFuncional,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(UNIDADESFUNCIONALES.ETIQUETA_DENOMUNIDADFUNCIONAL),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((UnidadFuncional d) => d.denomUnidadFuncional,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaUnidadesFuncionales.length == 0,
          'Leyendo ${UNIDADESFUNCIONALES.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _UnidadesFuncionalesDataSource extends DataTableSource {
  _UnidadesFuncionalesDataSource(this.context, this.listaUnidadesFuncionales);

  final List<UnidadFuncional> listaUnidadesFuncionales; 
  final BuildContext context;

  _editarUnidadFuncional(UnidadFuncional registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIUnidadFuncionalEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(UnidadFuncional d), bool ascending) {
    listaUnidadesFuncionales.sort((UnidadFuncional a, UnidadFuncional b) {
      if (!ascending) {
        final UnidadFuncional c = a;
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
    if (index >= listaUnidadesFuncionales.length) return null;
    final UnidadFuncional unidadFuncional = listaUnidadesFuncionales[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(unidadFuncional.tipoUnidadFuncional == null
              ? ''
              : '${unidadFuncional.tipoUnidadFuncional.denomTipoUnidadFuncional}'),
          onTap: _editarUnidadFuncional(unidadFuncional),
        ),
        DataCell(
          UI__EtiquetaCelda(unidadFuncional.denomUnidadFuncional == null
              ? ''
              : '${unidadFuncional.denomUnidadFuncional}'),
          onTap: _editarUnidadFuncional(unidadFuncional),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaUnidadesFuncionales.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

