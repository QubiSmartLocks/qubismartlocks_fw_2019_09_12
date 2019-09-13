/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Zonas en Edificaciones
 [//Zonas en Edificaciones]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIZonasEdificacionesLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIZonasEdificacionesListaState createState() => _UIZonasEdificacionesListaState();
}

class _UIZonasEdificacionesListaState extends State<UIZonasEdificacionesLista> {

  _ZonasEdificacionesDataSource _clientesDataSource;

  List<ZonaEdificacion> listaZonasEdificaciones = List<ZonaEdificacion>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(ZonaEdificacion d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    ZonasEdificaciones.todos(listaZonasEdificaciones).then((r) {
      _clientesDataSource.listaZonasEdificaciones.clear();
      _clientesDataSource.listaZonasEdificaciones.addAll(this.listaZonasEdificaciones);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _ZonasEdificacionesDataSource(context, List<ZonaEdificacion>());
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
                          label: UI__EtiquetaColumna(ZONASEDIFICACIONES.ETIQUETA_DENOMZONA),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((ZonaEdificacion d) => d.denomZona,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaZonasEdificaciones.length == 0,
          'Leyendo ${ZONASEDIFICACIONES.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _ZonasEdificacionesDataSource extends DataTableSource {
  _ZonasEdificacionesDataSource(this.context, this.listaZonasEdificaciones);

  final List<ZonaEdificacion> listaZonasEdificaciones; 
  final BuildContext context;

  _editarZonaEdificacion(ZonaEdificacion registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIZonaEdificacionEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(ZonaEdificacion d), bool ascending) {
    listaZonasEdificaciones.sort((ZonaEdificacion a, ZonaEdificacion b) {
      if (!ascending) {
        final ZonaEdificacion c = a;
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
    if (index >= listaZonasEdificaciones.length) return null;
    final ZonaEdificacion zonaEdificacion = listaZonasEdificaciones[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(zonaEdificacion.denomZona == null
              ? ''
              : '${zonaEdificacion.denomZona}'),
          onTap: _editarZonaEdificacion(zonaEdificacion),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaZonasEdificaciones.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

