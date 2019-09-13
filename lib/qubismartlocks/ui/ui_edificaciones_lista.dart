/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Edificaciones
 [//Edificaciones]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIEdificacionesLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIEdificacionesListaState createState() => _UIEdificacionesListaState();
}

class _UIEdificacionesListaState extends State<UIEdificacionesLista> {

  _EdificacionesDataSource _clientesDataSource;

  List<Edificacion> listaEdificaciones = List<Edificacion>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(Edificacion d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    Edificaciones.todos(listaEdificaciones).then((r) {
      _clientesDataSource.listaEdificaciones.clear();
      _clientesDataSource.listaEdificaciones.addAll(this.listaEdificaciones);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _EdificacionesDataSource(context, List<Edificacion>());
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
                          label: UI__EtiquetaColumna(EDIFICACIONES.ETIQUETA_DENOMEDIFICACION),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Edificacion d) => d.denomEdificacion,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(EDIFICACIONES.ETIQUETA_TIPOEDIFICACION),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Edificacion d) => d.tipoEdificacion.denomTipoEdificacion,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaEdificaciones.length == 0,
          'Leyendo ${EDIFICACIONES.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _EdificacionesDataSource extends DataTableSource {
  _EdificacionesDataSource(this.context, this.listaEdificaciones);

  final List<Edificacion> listaEdificaciones; 
  final BuildContext context;

  _editarEdificacion(Edificacion registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIEdificacionEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(Edificacion d), bool ascending) {
    listaEdificaciones.sort((Edificacion a, Edificacion b) {
      if (!ascending) {
        final Edificacion c = a;
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
    if (index >= listaEdificaciones.length) return null;
    final Edificacion edificacion = listaEdificaciones[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(edificacion.denomEdificacion == null
              ? ''
              : '${edificacion.denomEdificacion}'),
          onTap: _editarEdificacion(edificacion),
        ),
        DataCell(
          UI__EtiquetaCelda(edificacion.tipoEdificacion == null
              ? ''
              : '${edificacion.tipoEdificacion.denomTipoEdificacion}'),
          onTap: _editarEdificacion(edificacion),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaEdificaciones.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

