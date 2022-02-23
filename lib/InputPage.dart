import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_beklentisi/ContainerYaziIcon.dart';
import 'package:yasam_beklentisi/MyContainer.dart';
import 'package:yasam_beklentisi/constans.dart';
import 'package:yasam_beklentisi/result_page.dart';
import 'package:yasam_beklentisi/user_data.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 0;
  double yapilanSpor = 3;
  int boy = 170;
  int kilo = 85;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: YaziSayiIcon("BOY"),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: YaziSayiIcon("KİLO"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Haftada Kaç Gün Spor Yapıyorsun?",
                    style: kMetinStili,
                  ),
                  Text(
                    yapilanSpor.toInt().toString(),
                    style: kSayiStili,
                  ),
                  Slider(
                    divisions: 7,
                    min: 0,
                    max: 7,
                    value: yapilanSpor,
                    onChanged: (double newValue) {
                      setState(() {
                        yapilanSpor = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Günde Kaç Sigara İçiyorsunuz?",
                    style: kMetinStili,
                  ),
                  Text(
                    icilenSigara.toInt().toString(),
                    style: kSayiStili,
                  ),
                  Slider(
                    min: 0,
                    max: 30,
                    value: icilenSigara,
                    onChanged: (double newvalue) {
                      setState(() {
                        icilenSigara = newvalue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = "KADIN";
                      });
                    },
                    renk: seciliCinsiyet == "ERKEK"
                        ? Colors.lightBlue[100]!
                        : Colors.white,
                    child: ContainerYaziIcon(
                      icon: FontAwesomeIcons.venus,
                      cinsiyet: "KADIN",
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = "ERKEK";
                      });
                    },
                    renk: seciliCinsiyet == "KADIN"
                        ? Colors.lightBlue[100]!
                        : Colors.white,
                    child: ContainerYaziIcon(
                      icon: FontAwesomeIcons.mars,
                      cinsiyet: "ERKEK",
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(30),
              primary: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(UserData(
                            kilo: kilo,
                            boy: boy,
                            seciliCinsiyet: seciliCinsiyet,
                            yapilanSpor: yapilanSpor,
                            icilenSigara: icilenSigara,
                          ))));
            },
            child: Text("HESAPLA"),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  Row YaziSayiIcon(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label,
            style: kMetinStili,
          ),
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label == "BOY" ? boy.toString() : kilo.toString(),
            style: kSayiStili,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 1,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                setState(() {
                  label == "BOY" ? boy++ : kilo++;
                });
              },
              child: Icon(
                FontAwesomeIcons.plus,
                size: 20,
                color: Colors.black,
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 1,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                setState(() {
                  label == "BOY" ? boy-- : kilo--;
                });
              },
              child: Icon(
                FontAwesomeIcons.minus,
                size: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
