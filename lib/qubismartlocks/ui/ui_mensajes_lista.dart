/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Mensajes
 [//Mensajes]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIMensajesLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIMensajesListaState createState() => _UIMensajesListaState();
}

class _UIMensajesListaState extends State<UIMensajesLista> {

  _MensajesDataSource _clientesDataSource;

  List<Mensaje> listaMensajes = List<Mensaje>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(Mensaje d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    Mensajes.todos(listaMensajes).then((r) {
      _clientesDataSource.listaMensajes.clear();
      _clientesDataSource.listaMensajes.addAll(this.listaMensajes);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _MensajesDataSource(context, List<Mensaje>());
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
                          label: UI__EtiquetaColumna(MENSAJES.ETIQUETA_PARTICIPANTE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Mensaje d) => d.participante.nombre,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(MENSAJES.ETIQUETA_MOMENTO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<DateTime>((Mensaje d) => d.momento,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(MENSAJES.ETIQUETA_MENSAJETEXTO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Mensaje d) => d.mensajeTexto,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(MENSAJES.ETIQUETA_KEYCONVERSACION),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Mensaje d) => d.keyConversacion,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(MENSAJES.ETIQUETA_KEYPARTICIPANTE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Mensaje d) => d.keyParticipante,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaMensajes.length == 0,
          'Leyendo ${MENSAJES.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _MensajesDataSource extends DataTableSource {
  _MensajesDataSource(this.context, this.listaMensajes);

  final List<Mensaje> listaMensajes; 
  final BuildContext context;

  _editarMensaje(Mensaje registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIMensajeEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(Mensaje d), bool ascending) {
    listaMensajes.sort((Mensaje a, Mensaje b) {
      if (!ascending) {
        final Mensaje c = a;
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
    if (index >= listaMensajes.length) return null;
    final Mensaje mensaje = listaMensajes[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(mensaje.participante == null
              ? ''
              : '${mensaje.participante.nombre}'),
          onTap: _editarMensaje(mensaje),
        ),
        DataCell(
          UI__EtiquetaCelda(mensaje.momento == null
              ? ''
              : '${mensaje.momento}'),
          onTap: _editarMensaje(mensaje),
        ),
        DataCell(
          UI__EtiquetaCelda(mensaje.mensajeTexto == null
              ? ''
              : '${mensaje.mensajeTexto}'),
          onTap: _editarMensaje(mensaje),
        ),
        DataCell(
          UI__EtiquetaCelda(mensaje.keyConversacion == null
              ? ''
              : '${mensaje.keyConversacion}'),
          onTap: _editarMensaje(mensaje),
        ),
        DataCell(
          UI__EtiquetaCelda(mensaje.keyParticipante == null
              ? ''
              : '${mensaje.keyParticipante}'),
          onTap: _editarMensaje(mensaje),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaMensajes.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

