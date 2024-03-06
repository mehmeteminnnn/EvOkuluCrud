import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CrudIslem extends StatelessWidget {
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _birimController = TextEditingController();
  final TextEditingController _soyadController = TextEditingController();
  final TextEditingController _parolaController = TextEditingController();
  final TextEditingController _epostaController = TextEditingController();
  final TextEditingController _telefonController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference evOkuluRef =
      FirebaseFirestore.instance.collection('evOkulu');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD İşlemleri'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
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
                    controller: _parolaController,
                    decoration: InputDecoration(
                      labelText: 'Parola',
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
                    controller: _telefonController,
                    decoration: InputDecoration(
                      labelText: 'Telefon',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      evOkuluRef.add({
                        "ad": _adController.text,
                        "calistigibirim": _birimController.text,
                        "soyad": _soyadController.text,
                        "parola": _parolaController.text,
                        "eposta": _epostaController.text,
                        "telefon": _telefonController.text,
                      });
                      _adController.clear();
                      _birimController.clear();
                      _soyadController.clear();
                      _parolaController.clear();
                      _epostaController.clear();
                      _telefonController.clear();
                    },
                    child: Text('Yeni Kullanıcı Ekle'),
                  ),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: evOkuluRef.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Hata: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                List<DocumentSnapshot>? documentSnap = snapshot.data?.docs;

                return Expanded(
                  child: ListView.builder(
                    itemCount: documentSnap?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
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
                                : Text((documentSnap![index].data()
                                    as Map<String, dynamic>)['ad']),
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
                                          SizedBox(height: 10),
                                          TextField(
                                            controller: _telefonController,
                                            decoration: InputDecoration(
                                              labelText: 'Telefon',
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
                                              "telefon":
                                                  _telefonController.text,
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
          ],
        ),
      ),
    );
  }
}
