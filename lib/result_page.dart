import 'package:flutter/material.dart';
import 'package:yasam_beklentisi/constans.dart';
import 'package:yasam_beklentisi/hesap.dart';
import 'package:yasam_beklentisi/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;

  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Sayfası"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
                child: Text(
              "Beklenen Yaşam Süresi : ${Hesap(_userData).Hesaplama().toInt()}",
              style: kMetinStili,
            )),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Geri Dön"),
            ),
          ),
        ],
      ),
    );
  }
}
