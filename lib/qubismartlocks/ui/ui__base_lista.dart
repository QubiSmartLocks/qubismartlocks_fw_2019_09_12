/*
 Proyecto: Qubi Smart Locks
 Version: 0.0.2
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Tipos de Edificaciones
 [Qubi Smart Locks/Qubi Smart Locks/Tipos de Edificaciones]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UI_Base_Lista<T> extends StatefulWidget {
  UI_Base_Lista({
    this.header,
    this.clientOnSelectAll,
    this.client,
    this.columns,
    this.list,
    this.releerDatos,
    this.message,
  });

  final Widget header;
  final OnSelectAllCallback clientOnSelectAll;
  final DataTableSource client;
  final List<DataColumCellFieldBase> columns;
  final List<T> list;
  final VoidCallback releerDatos;
  final String message;

  @override
  _UI_Base_ListaState createState() => _UI_Base_ListaState();
}

class _UI_Base_ListaState extends State<UI_Base_Lista> {
  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    //
    CD.iniciar(context);
    //
    double headerHeight = AppRes.appResMap[Co.LISTA_ALTO_ENCABEZADO];
    double columnSpacing = AppRes.appResMap[Co.LISTA_ESPACIO_ENTRE_COLUMNAS];
    double dataRowHeight = AppRes.appResMap[Co.LISTA_ALTO_FILA];
    double headingRowHeight = AppRes.appResMap[Co.LISTA_ALTO_TITULOS];
    double altoTotal = CD.alto * AppRes.appResMap[Co.LISTA_FACTOR_ALTO_TOTAL];
    double anchoTotal =
        CD.ancho * AppRes.appResMap[Co.LISTA_FACTOR_ANCHO_TOTAL];
    double footerHeight = AppRes.appResMap[Co.LISTA_ALTO_PIE_PAGINACION];
    _rowsPerPage =
        (altoTotal - headerHeight - headingRowHeight - footerHeight) ~/
                dataRowHeight -
            1;

    List<int> availableRowsPerPage = [_rowsPerPage];
    return Stack(
      children: <Widget>[
        Container(
          width: anchoTotal,
          height: altoTotal,
          padding: EdgeInsets.all(5),
          child: PaginatedDataTable(
              header: widget.header,
              columnSpacing: columnSpacing,
              dataRowHeight: dataRowHeight,
              headingRowHeight: headingRowHeight,
              horizontalMargin: AppRes.appResMap[Co.LISTA_MARGEN_HORIZONTAL],
              rowsPerPage: _rowsPerPage,
              onRowsPerPageChanged: (int value) {
                setState(() {
                  _rowsPerPage = value;
                });
              },
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              onSelectAll: widget.clientOnSelectAll,
              availableRowsPerPage: availableRowsPerPage,
              dragStartBehavior: DragStartBehavior.down,
              columns: widget.columns.map((column) {
                return DataColumn(
                  label: column.label,
                  tooltip: column.tooltip,
                  numeric: column.numeric,
                  onSort: column.onSort,
                );
              }).toList(),
              source: widget.client),
        ),
        widget.list.length == 0
            ? Container(
                width: anchoTotal,
                height: altoTotal,
                color: Colors.grey.withOpacity(0.3),
                child: Center(
                  child: Container(
                    height: 100,
                    width: 150,
                    child: GestureDetector(
                      onTap: widget.releerDatos,
                      child: Card(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('${widget.message}'),
                              Icon(
                                Icons.refresh,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

typedef OnSortCallback = void Function(int, bool);
typedef OnSelectAllCallback = void Function(bool);

class DataColumCellFieldBase {
  DataColumCellFieldBase({
    this.list,
    this.detail,
    this.label,
    this.tooltip,
    this.numeric = false,
    this.onSort,
    this.child,
    this.placeHolder,
    this.showEditIcon,
    this.onTap,
  });

  bool list;
  bool detail;
  Widget label;
  String tooltip;
  bool numeric;
  OnSortCallback onSort;
  Widget child;
  bool placeHolder;
  bool showEditIcon;
  VoidCallback onTap;
}

class DataTableSourceBase<T> extends DataTableSource {
  DataTableSourceBase(this.dataList);

  final List<T> dataList;

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= dataList.length) return null;
    final T e = dataList[index];
    return DataRow.byIndex(
      index: index,
//      cells: columnasSegunModelo(e).where((c) => c.list == true).toList().map((column) {
//        return DataCell(
//          column.child,
//          onTap: column.onTap,
//          showEditIcon: column.showEditIcon,
//          placeholder: column.placeHolder,
//        );
//      }).toList(),
    );
  }

  @override
  int get rowCount => dataList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

//  void _selectAll(bool checked) {}
}

class UI__EtiquetaColumna extends StatefulWidget {
  UI__EtiquetaColumna(this.texto);

  final String texto;

  @override
  _UI__EtiquetaColumnaState createState() => _UI__EtiquetaColumnaState();
}

class _UI__EtiquetaColumnaState extends State<UI__EtiquetaColumna> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.texto,
        style: AppRes.appResMap[Co.ESTILO_FUENTE_TITULO_TABLA]);
  }
}

class UI__EtiquetaCelda extends StatefulWidget {
  UI__EtiquetaCelda(this.texto);

  final String texto;

  @override
  _UI__EtiquetaCeldaState createState() => _UI__EtiquetaCeldaState();
}

class _UI__EtiquetaCeldaState extends State<UI__EtiquetaCelda> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.texto,
      style: AppRes.appResMap[Co.ESTILO_FUENTE_REGISTRO_TABLA],
    );
  }
}
