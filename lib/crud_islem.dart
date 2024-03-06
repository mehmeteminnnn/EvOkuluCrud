import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projee/ekle.dart';

class EvOkulu extends StatefulWidget {
  const EvOkulu({Key? key}) : super(key: key);

  @override
  State<EvOkulu> createState() => _EvOkuluState();
}

final _database = FirebaseFirestore.instance;

class _EvOkuluState extends State<EvOkulu> {
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _birimController = TextEditingController();
  final TextEditingController _soyadController = TextEditingController();
  final TextEditingController _parolaController = TextEditingController();
  final TextEditingController _epostaController = TextEditingController();

  @override
  void dispose() {
    _adController.dispose();
    _birimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final evOkuluRef = _database.collection("Ev Okulu");
    //final kullaniciRef = evOkuluRef.doc("Kullanıcı");
    return Scaffold(
      appBar: AppBar(title: Text("Ev Okulu CRUD")),
      body: Center(
        child: Column(
          children: [
            Text("Veriler", style: TextStyle(fontSize: 30)),
            Divider(),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: evOkuluRef.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                      asyncSnapshot) {
                if (asyncSnapshot.hasError) {
                  return Text("Hata oluştu");
                }
                late var documentSnap = asyncSnapshot.data?.docs;
                return Flexible(
                  child: ListView.builder(
                    itemCount: documentSnap?.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        onDismissed: (_) {
                          documentSnap?[index].reference.delete();
                        },
                        key: UniqueKey(),
                        direction: DismissDirection.startToEnd,
                        background: Container(
                          color: Colors.red,
                          child: Icon(Icons.delete, color: Colors.black),
                        ),
                        child: Card(
                          child: ListTile(
                            title: documentSnap?[index].data == null
                                ? Center(child: CircularProgressIndicator())
                                : Text(documentSnap?[index].data()['ad']),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Bilgileri Düzenle"),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: _adController,
                                            decoration: InputDecoration(
                                              labelText: 'Ad',
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          TextField(
                                            controller: _birimController,
                                            decoration: InputDecoration(
                                              labelText: 'Çalıştığı Birim',
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          TextField(
                                            controller: _soyadController,
                                            decoration: InputDecoration(
                                              labelText: 'Soyad',
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          TextField(
                                            controller: _epostaController,
                                            decoration: InputDecoration(
                                              labelText: 'Eposta',
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          TextField(
                                            controller: _parolaController,
                                            decoration: InputDecoration(
                                              labelText: 'Parola',
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            documentSnap?[index]
                                                .reference
                                                .update({
                                              "ad": _adController.text,
                                              "calistigibirim":
                                                  _birimController.text,
                                              "soyad": _soyadController.text,
                                              "eposta": _epostaController.text,
                                              "parola": _parolaController.text,
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Text('Kaydet'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CrudIslem()),
                      );
                    },
                    child: Text('Yeni Kullanıcı Ekle'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
