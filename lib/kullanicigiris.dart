import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KullaniciGiris extends StatelessWidget {
  final String ad;
  final String parola;

  KullaniciGiris({required this.ad, required this.parola});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kullanıcı Ekranı')),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('Ev Okulu').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                //var documentSnap = snapshot.data?.docs;
                else
                  return ListView(
                    children: snapshot.data?.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          if (data['ad'] == ad && data['parola'] == parola) {
                            return ListTile(
                              title: Text(data['ad']),
                              subtitle: Text(data['parola']),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        }).toList() ??
                        [],
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}
