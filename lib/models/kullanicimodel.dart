import 'dart:core';

import 'package:flutter/material.dart';

class Kullanici {
  late final String? ad;
  late final String soyad;
  late final String? eposta;
  late final String? calistigibirim;
  late final String? telefon;
  late final String? parola;

  Kullanici({
    required this.ad,
    required this.soyad,
    this.eposta,
    this.calistigibirim,
    this.telefon,
    this.parola,
  });

  Map<String, dynamic> toMap() {
    return {
      'ad': ad,
      'soyad': soyad,
      'eposta': eposta,
      'calistigibirim': calistigibirim,
      'telefon': telefon,
      'parola': parola,
    };
  }

//mapten obje oluşturma kısmı
  factory Kullanici.fromMap(Map<String, dynamic> map) {
    return Kullanici(
      ad: map['ad'],
      soyad: map['soyad'],
      eposta: map['eposta'],
      calistigibirim: map['calistigibirim'],
      telefon: map['telefon'],
      parola: map['parola'],
    );
  }
}
