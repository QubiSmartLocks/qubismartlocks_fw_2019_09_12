/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Paquetería
 [//Paquetería]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIPaqueteriaLista extends StatefulWidget {
  // TODO: resolver si va o no la linea de ruta aquí abajo
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIPaqueteriaListaState createState() => _UIPaqueteriaListaState();
}

class _UIPaqueteriaListaState extends State<UIPaqueteriaLista> {

  _PaqueteriaDataSource _clientesDataSource;

  List<Paquete> listaPaqueteria = List<Paquete>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(Paquete d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    Paqueteria.todos(listaPaqueteria).then((r) {
      _clientesDataSource.listaPaqueteria.clear();
      _clientesDataSource.listaPaqueteria.addAll(this.listaPaqueteria);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _PaqueteriaDataSource(context, List<Paquete>());
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
                height: CD.ancho < 800 ? CD.alto * .8 : altoTotal,
                padding: EdgeInsets.all(5), // TODO: Los paddings también?
                child: PaginatedDataTable(
                    header: Container(),
                    columnSpacing: columnSpacing,
                    dataRowHeight: dataRowHeight,
                    headingRowHeight: headingRowHeight,
                    horizontalMargin: 24.0,   // TODO: Margenes del Paginated???
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
                          label: UI__EtiquetaColumna(PAQUETERIA.ETIQUETA_ORIGENPAQUETE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Paquete d) => d.origenPaquete.denomOrigenPaquete,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(PAQUETERIA.ETIQUETA_NUMERORASTREO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Paquete d) => d.numeroRastreo,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(PAQUETERIA.ETIQUETA_DESTINATARIO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Paquete d) => d.destinatario,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(PAQUETERIA.ETIQUETA_FECHAHORARECEPCION),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Paquete d) => GuardarFechaHora(d.fechaHoraRecepcion),
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(PAQUETERIA.ETIQUETA_FECHAHORAENTREGADO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Paquete d) => GuardarFechaHora(d.fechaHoraEntregado),
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(PAQUETERIA.ETIQUETA_PASAJERO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Paquete d) => d.pasajero.apellidos,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(PAQUETERIA.ETIQUETA_RECIBIDOPASAJERO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Paquete d) => GuardarFechaHora(d.recibidoPasajero),
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(PAQUETERIA.ETIQUETA_MENSAJEENVIADO),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaPaqueteria.length == 0,
          'Leyendo ${PAQUETERIA.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _PaqueteriaDataSource extends DataTableSource {
  _PaqueteriaDataSource(this.context, this.listaPaqueteria);

  final List<Paquete> listaPaqueteria; 
  final BuildContext context;

  _editarPaquete(Paquete registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIPaqueteriaForma(edicion: true, registro: registro,)),
    );
  }

  void _sort<T>(Comparable<T> getField(Paquete d), bool ascending) {
    listaPaqueteria.sort((Paquete a, Paquete b) {
      if (!ascending) {
        final Paquete c = a;
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
    if (index >= listaPaqueteria.length) return null;
    final Paquete paquete = listaPaqueteria[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(paquete.origenPaquete == null
              ? ''
              : '${paquete.origenPaquete.denomOrigenPaquete}'),
          onTap: _editarPaquete(paquete),
        ),
        DataCell(
          UI__EtiquetaCelda(paquete.numeroRastreo == null
              ? ''
              : '${paquete.numeroRastreo}'),
          onTap: _editarPaquete(paquete),
        ),
        DataCell(
          UI__EtiquetaCelda(paquete.destinatario == null
              ? ''
              : '${paquete.destinatario}'),
          onTap: _editarPaquete(paquete),
        ),
        DataCell(
          UI__EtiquetaCelda(paquete.fechaHoraRecepcion == null
              ? ''
              : '${paquete.fechaHoraRecepcion}'),
          onTap: _editarPaquete(paquete),
        ),
        DataCell(
          UI__EtiquetaCelda(paquete.fechaHoraEntregado == null
              ? ''
              : '${paquete.fechaHoraEntregado}'),
          onTap: _editarPaquete(paquete),
        ),
        DataCell(
          UI__EtiquetaCelda(paquete.pasajero == null
              ? ''
              : '${paquete.pasajero.apellidos}'),
          onTap: _editarPaquete(paquete),
        ),
        DataCell(
          UI__EtiquetaCelda(paquete.recibidoPasajero == null
              ? ''
              : '${paquete.recibidoPasajero}'),
          onTap: _editarPaquete(paquete),
        ),
        DataCell(
          UI__EtiquetaCelda(paquete.mensajeenviado == null
              ? ''
              : '${paquete.mensajeenviado}'),
          onTap: _editarPaquete(paquete),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaPaqueteria.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}
