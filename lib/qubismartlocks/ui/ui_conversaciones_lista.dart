/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Conversaciones
 [//Conversaciones]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIConversacionesLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIConversacionesListaState createState() => _UIConversacionesListaState();
}

class _UIConversacionesListaState extends State<UIConversacionesLista> {

  _ConversacionesDataSource _clientesDataSource;

  List<Conversacion> listaConversaciones = List<Conversacion>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(Conversacion d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    Conversaciones.todos(listaConversaciones).then((r) {
      _clientesDataSource.listaConversaciones.clear();
      _clientesDataSource.listaConversaciones.addAll(this.listaConversaciones);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _ConversacionesDataSource(context, List<Conversacion>());
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
                          label: UI__EtiquetaColumna(CONVERSACIONES.ETIQUETA_DENOMCONVERSACION),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Conversacion d) => d.denomConversacion,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(CONVERSACIONES.ETIQUETA_ORDENPRIORIDAD),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Conversacion d) => d.ordenPrioridad,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(CONVERSACIONES.ETIQUETA_FECHAULTIMOMENSAJE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<DateTime>((Conversacion d) => d.fechaUltimoMensaje,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(CONVERSACIONES.ETIQUETA_NOTA),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Conversacion d) => d.nota,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaConversaciones.length == 0,
          'Leyendo ${CONVERSACIONES.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _ConversacionesDataSource extends DataTableSource {
  _ConversacionesDataSource(this.context, this.listaConversaciones);

  final List<Conversacion> listaConversaciones; 
  final BuildContext context;

  _editarConversacion(Conversacion registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIConversacionEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(Conversacion d), bool ascending) {
    listaConversaciones.sort((Conversacion a, Conversacion b) {
      if (!ascending) {
        final Conversacion c = a;
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
    if (index >= listaConversaciones.length) return null;
    final Conversacion conversacion = listaConversaciones[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(conversacion.denomConversacion == null
              ? ''
              : '${conversacion.denomConversacion}'),
          onTap: _editarConversacion(conversacion),
        ),
        DataCell(
          UI__EtiquetaCelda(conversacion.ordenPrioridad == null
              ? ''
              : '${conversacion.ordenPrioridad}'),
          onTap: _editarConversacion(conversacion),
        ),
        DataCell(
          UI__EtiquetaCelda(conversacion.fechaUltimoMensaje == null
              ? ''
              : '${conversacion.fechaUltimoMensaje}'),
          onTap: _editarConversacion(conversacion),
        ),
        DataCell(
          UI__EtiquetaCelda(conversacion.nota == null
              ? ''
              : '${conversacion.nota}'),
          onTap: _editarConversacion(conversacion),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaConversaciones.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

