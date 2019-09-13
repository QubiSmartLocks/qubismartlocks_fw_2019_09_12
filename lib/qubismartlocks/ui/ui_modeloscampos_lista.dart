/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Modelos Campos
 [//Modelos Campos]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIModelosCamposLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIModelosCamposListaState createState() => _UIModelosCamposListaState();
}

class _UIModelosCamposListaState extends State<UIModelosCamposLista> {

  _ModelosCamposDataSource _clientesDataSource;

  List<ModeloCampo> listaModelosCampos = List<ModeloCampo>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(ModeloCampo d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    ModelosCampos.todos(listaModelosCampos).then((r) {
      _clientesDataSource.listaModelosCampos.clear();
      _clientesDataSource.listaModelosCampos.addAll(this.listaModelosCampos);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _ModelosCamposDataSource(context, List<ModeloCampo>());
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
                          label: UI__EtiquetaColumna(MODELOSCAMPOS.ETIQUETA_DENOMMODELO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((ModeloCampo d) => d.denomModelo,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(MODELOSCAMPOS.ETIQUETA_FECHA),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<DateTime>((ModeloCampo d) => d.fecha,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(MODELOSCAMPOS.ETIQUETA_HORA),),
                      DataColumn(
                          label: UI__EtiquetaColumna(MODELOSCAMPOS.ETIQUETA_ENTERO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((ModeloCampo d) => d.entero,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(MODELOSCAMPOS.ETIQUETA_LOGICO),),
                      DataColumn(
                          label: UI__EtiquetaColumna(MODELOSCAMPOS.ETIQUETA_MODELOFORANEO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((ModeloCampo d) => d.modeloForaneo.denomModeloForaneo,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaModelosCampos.length == 0,
          'Leyendo ${MODELOSCAMPOS.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _ModelosCamposDataSource extends DataTableSource {
  _ModelosCamposDataSource(this.context, this.listaModelosCampos);

  final List<ModeloCampo> listaModelosCampos; 
  final BuildContext context;

  _editarModeloCampo(ModeloCampo registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIModeloCampoEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(ModeloCampo d), bool ascending) {
    listaModelosCampos.sort((ModeloCampo a, ModeloCampo b) {
      if (!ascending) {
        final ModeloCampo c = a;
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
    if (index >= listaModelosCampos.length) return null;
    final ModeloCampo modeloCampo = listaModelosCampos[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(modeloCampo.denomModelo == null
              ? ''
              : '${modeloCampo.denomModelo}'),
          onTap: _editarModeloCampo(modeloCampo),
        ),
        DataCell(
          UI__EtiquetaCelda(modeloCampo.fecha == null
              ? ''
              : '${modeloCampo.fecha}'),
          onTap: _editarModeloCampo(modeloCampo),
        ),
        DataCell(
          UI__EtiquetaCelda(modeloCampo.hora == null
              ? ''
              : '${modeloCampo.hora}'),
          onTap: _editarModeloCampo(modeloCampo),
        ),
        DataCell(
          UI__EtiquetaCelda(modeloCampo.entero == null
              ? ''
              : '${modeloCampo.entero}'),
          onTap: _editarModeloCampo(modeloCampo),
        ),
        DataCell(
          UI__EtiquetaCelda(modeloCampo.logico == null
              ? ''
              : '${modeloCampo.logico}'),
          onTap: _editarModeloCampo(modeloCampo),
        ),
        DataCell(
          UI__EtiquetaCelda(modeloCampo.modeloForaneo == null
              ? ''
              : '${modeloCampo.modeloForaneo.denomModeloForaneo}'),
          onTap: _editarModeloCampo(modeloCampo),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaModelosCampos.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

