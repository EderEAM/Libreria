import 'package:flutter/material.dart';
import 'package:sqliteflutter/body/librost.dart';
import 'package:sqliteflutter/constants.dart';
import 'package:sqliteflutter/db/database.dart';
import 'package:sqliteflutter/logins/logins.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


class AgrBook extends StatefulWidget {
  final bool edit;
  final Client client;

  AgrBook(this.edit, {this.client})
      : assert(edit == true || client == null);

  @override
  _AgrBookState createState() => _AgrBookState();
}

class _AgrBookState extends State<AgrBook> {
  final format = DateFormat("yyyy-MM-dd");
  TextEditingController nombrelibro = TextEditingController();
  TextEditingController autorlibro = TextEditingController();
  TextEditingController categorialibro = TextEditingController();
  TextEditingController FechaLibro = TextEditingController();
  TextEditingController EstadoLibro = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  DateTime date;
  TimeOfDay time;
  @override
  void initState() {
    super.initState();

    if (widget.edit == true) {
      nombrelibro.text = widget.client.NombreLibro;
      autorlibro.text = widget.client.autor;
      categorialibro.text = widget.client.cate;
      FechaLibro.text = widget.client.fecha;
      EstadoLibro.text = widget.client.estado;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.edit ? EdBook : Book),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(panEdge),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LoginLibro(nombrelibro, Book, "", Icons.book,
                    widget.edit ? widget.client.NombreLibro : Book),
                LoginAutor(
                  autorlibro,
                  Autor,
                  "",
                  Icons.person,
                  widget.edit ? widget.client.autor : Autor,
                ),
                LoginCategoria(
                  categorialibro,
                  Cate,
                  "",
                  Icons.category,
                  widget.edit ? widget.client.cate : Cate,
                ),
                LoginFecha(
                  FechaLibro,
                  Fecha,
                  "",
                  Icons.calendar_today,
                  widget.edit ? widget.client.fecha : Fecha,
                ),
                Loginestado(
                  EstadoLibro,
                  estado,
                  "",
                  Icons.ev_station_outlined,
                  widget.edit ? widget.client.estado : estado,
                ),


               /* DateTimeField(

                  format: format,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                ),*/
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(BordeRadi)),
                  child: Text(
                    save,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: TextSize,
                        color: Colors.white),
                  ),
                  onPressed: () async {
                    if (!_formKey.currentState.validate()) {
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text(Loan)));
                    } else if (widget.edit == true) {
                      DBBook.db.updateClient(new Client(
                          estado: EstadoLibro.text,
                          fecha: FechaLibro.text,
                          cate: categorialibro.text,
                          NombreLibro: nombrelibro.text,
                          autor: autorlibro.text,
                          id: widget.client.id));
                      Navigator.pop(context);
                    } else {
                      await DBBook.db.addClientToDatabase(
                          new Client(
                              estado: EstadoLibro.text,
                              fecha: FechaLibro.text,
                              cate: categorialibro.text,
                              NombreLibro: nombrelibro.text,
                              autor: autorlibro.text));
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
