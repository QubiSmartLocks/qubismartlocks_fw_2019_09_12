/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Tipos de Unidades Funcionales
 [//Tipos de Unidades Funcionales]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UITipUnidadesFuncionalesLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UITipUnidadesFuncionalesListaState createState() => _UITipUnidadesFuncionalesListaState();
}

class _UITipUnidadesFuncionalesListaState extends State<UITipUnidadesFuncionalesLista> {

  _TipUnidadesFuncionalesDataSource _clientesDataSource;

  List<TipoUnidadFuncional> listaTipUnidadesFuncionales = List<TipoUnidadFuncional>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(TipoUnidadFuncional d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    TipUnidadesFuncionales.todos(listaTipUnidadesFuncionales).then((r) {
      _clientesDataSource.listaTipUnidadesFuncionales.clear();
      _clientesDataSource.listaTipUnidadesFuncionales.addAll(this.listaTipUnidadesFuncionales);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _TipUnidadesFuncionalesDataSource(context, List<TipoUnidadFuncional>());
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
                          label: UI__EtiquetaColumna(TIPUNIDADESFUNCIONALES.ETIQUETA_DENOMTIPOUNIDADFUNCIONAL),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((TipoUnidadFuncional d) => d.denomTipoUnidadFuncional,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(TIPUNIDADESFUNCIONALES.ETIQUETA_MAXIMOCERRADURASASIGNADAS),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((TipoUnidadFuncional d) => d.maximoCerradurasAsignadas,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaTipUnidadesFuncionales.length == 0,
          'Leyendo ${TIPUNIDADESFUNCIONALES.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _TipUnidadesFuncionalesDataSource extends DataTableSource {
  _TipUnidadesFuncionalesDataSource(this.context, this.listaTipUnidadesFuncionales);

  final List<TipoUnidadFuncional> listaTipUnidadesFuncionales; 
  final BuildContext context;

  _editarTipoUnidadFuncional(TipoUnidadFuncional registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UITipoUnidadFuncionalEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(TipoUnidadFuncional d), bool ascending) {
    listaTipUnidadesFuncionales.sort((TipoUnidadFuncional a, TipoUnidadFuncional b) {
      if (!ascending) {
        final TipoUnidadFuncional c = a;
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
    if (index >= listaTipUnidadesFuncionales.length) return null;
    final TipoUnidadFuncional tipoUnidadFuncional = listaTipUnidadesFuncionales[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(tipoUnidadFuncional.denomTipoUnidadFuncional == null
              ? ''
              : '${tipoUnidadFuncional.denomTipoUnidadFuncional}'),
          onTap: _editarTipoUnidadFuncional(tipoUnidadFuncional),
        ),
        DataCell(
          UI__EtiquetaCelda(tipoUnidadFuncional.maximoCerradurasAsignadas == null
              ? ''
              : '${tipoUnidadFuncional.maximoCerradurasAsignadas}'),
          onTap: _editarTipoUnidadFuncional(tipoUnidadFuncional),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaTipUnidadesFuncionales.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

