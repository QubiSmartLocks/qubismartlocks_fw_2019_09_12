/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Tipos de Edificaciones
 [//Tipos de Edificaciones]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UITiposEdificacionesLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UITiposEdificacionesListaState createState() => _UITiposEdificacionesListaState();
}

class _UITiposEdificacionesListaState extends State<UITiposEdificacionesLista> {

  _TiposEdificacionesDataSource _clientesDataSource;

  List<TipoEdificacion> listaTiposEdificaciones = List<TipoEdificacion>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(TipoEdificacion d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    TiposEdificaciones.todos(listaTiposEdificaciones).then((r) {
      _clientesDataSource.listaTiposEdificaciones.clear();
      _clientesDataSource.listaTiposEdificaciones.addAll(this.listaTiposEdificaciones);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _TiposEdificacionesDataSource(context, List<TipoEdificacion>());
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
                          label: UI__EtiquetaColumna(TIPOSEDIFICACIONES.ETIQUETA_DENOMTIPOEDIFICACION),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((TipoEdificacion d) => d.denomTipoEdificacion,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(TIPOSEDIFICACIONES.ETIQUETA_SEZONIFICA),),
                      DataColumn(
                          label: UI__EtiquetaColumna(TIPOSEDIFICACIONES.ETIQUETA_TIENEMULTIPLESUNIDADESFUNCIONALES),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaTiposEdificaciones.length == 0,
          'Leyendo ${TIPOSEDIFICACIONES.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _TiposEdificacionesDataSource extends DataTableSource {
  _TiposEdificacionesDataSource(this.context, this.listaTiposEdificaciones);

  final List<TipoEdificacion> listaTiposEdificaciones; 
  final BuildContext context;

  _editarTipoEdificacion(TipoEdificacion registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UITipoEdificacionEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(TipoEdificacion d), bool ascending) {
    listaTiposEdificaciones.sort((TipoEdificacion a, TipoEdificacion b) {
      if (!ascending) {
        final TipoEdificacion c = a;
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
    if (index >= listaTiposEdificaciones.length) return null;
    final TipoEdificacion tipoEdificacion = listaTiposEdificaciones[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(tipoEdificacion.denomTipoEdificacion == null
              ? ''
              : '${tipoEdificacion.denomTipoEdificacion}'),
          onTap: _editarTipoEdificacion(tipoEdificacion),
        ),
        DataCell(
          UI__EtiquetaCelda(tipoEdificacion.seZonifica == null
              ? ''
              : '${tipoEdificacion.seZonifica}'),
          onTap: _editarTipoEdificacion(tipoEdificacion),
        ),
        DataCell(
          UI__EtiquetaCelda(tipoEdificacion.tieneMultiplesUnidadesFuncionales == null
              ? ''
              : '${tipoEdificacion.tieneMultiplesUnidadesFuncionales}'),
          onTap: _editarTipoEdificacion(tipoEdificacion),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaTiposEdificaciones.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

