/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Mensajes Automáticos
 [//Mensajes Automáticos]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIMensajesAutomaticosLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIMensajesAutomaticosListaState createState() => _UIMensajesAutomaticosListaState();
}

class _UIMensajesAutomaticosListaState extends State<UIMensajesAutomaticosLista> {

  _MensajesAutomaticosDataSource _clientesDataSource;

  List<MensajeAutomatico> listaMensajesAutomaticos = List<MensajeAutomatico>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(MensajeAutomatico d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    MensajesAutomaticos.todos(listaMensajesAutomaticos).then((r) {
      _clientesDataSource.listaMensajesAutomaticos.clear();
      _clientesDataSource.listaMensajesAutomaticos.addAll(this.listaMensajesAutomaticos);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _MensajesAutomaticosDataSource(context, List<MensajeAutomatico>());
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
                          label: UI__EtiquetaColumna(MENSAJESAUTOMATICOS.ETIQUETA_TIPOMENSAJE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((MensajeAutomatico d) => d.tipoMensaje,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(MENSAJESAUTOMATICOS.ETIQUETA_MENSAJE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((MensajeAutomatico d) => d.mensaje,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaMensajesAutomaticos.length == 0,
          'Leyendo ${MENSAJESAUTOMATICOS.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _MensajesAutomaticosDataSource extends DataTableSource {
  _MensajesAutomaticosDataSource(this.context, this.listaMensajesAutomaticos);

  final List<MensajeAutomatico> listaMensajesAutomaticos; 
  final BuildContext context;

  _editarMensajeAutomatico(MensajeAutomatico registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIMensajeAutomaticoEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(MensajeAutomatico d), bool ascending) {
    listaMensajesAutomaticos.sort((MensajeAutomatico a, MensajeAutomatico b) {
      if (!ascending) {
        final MensajeAutomatico c = a;
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
    if (index >= listaMensajesAutomaticos.length) return null;
    final MensajeAutomatico mensajeAutomatico = listaMensajesAutomaticos[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(mensajeAutomatico.tipoMensaje == null
              ? ''
              : '${mensajeAutomatico.tipoMensaje}'),
          onTap: _editarMensajeAutomatico(mensajeAutomatico),
        ),
        DataCell(
          UI__EtiquetaCelda(mensajeAutomatico.mensaje == null
              ? ''
              : '${mensajeAutomatico.mensaje}'),
          onTap: _editarMensajeAutomatico(mensajeAutomatico),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaMensajesAutomaticos.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

