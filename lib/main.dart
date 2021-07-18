import 'package:flutter/material.dart';
import 'package:sqliteflutter/constants.dart';
import 'package:sqliteflutter/nuevolibro.dart';
import 'package:sqliteflutter/body/librost.dart';
import 'package:sqliteflutter/db/database.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Libr,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Libr),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              DBBook.db.deleteAllClient();
              setState(() {});
            },
            child: Text(Elimi,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeTxli,
                    color: Colors.black)),
          )
        ],
      ),
      body: FutureBuilder<List<Client>>(
        future: DBBook.db.getAllClients(),
        builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Client item = snapshot.data[index];

                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (diretion) {
                    DBBook.db.deleteClientWithId(item.id);
                  },
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AgrBook(
                                  true,
                                  //Here is the record that we want to edit
                                  client: item,
                                )));
                      },
                      child: Column(
                        children: [
                          // CircleAvatar(child: Text(item.id.toString())),
                          Row(
                            children: [
                              Text(Books + item.NombreLibro),
                            ],
                          ),
                          Row(
                            children: [
                              Text(Autors + item.autor),
                            ],
                          ),
                          Row(
                            children: [
                              Text(Categos + item.cate),
                            ],
                          ),
                          Row(
                            children: [
                              Text(Fechap + item.fecha),
                            ],
                          ),
                          Row(
                            children: [
                              Text(estados + item.estado),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      //This button takes us to the method add new register, which is in the file nuevolibro.dart
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.book),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AgrBook(false)));
        },
      ),
    );
  }
}
