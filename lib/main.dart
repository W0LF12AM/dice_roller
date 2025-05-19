// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.red, body: DicePage()),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1; // angka dice kiri
  int rightDiceNumber = 1; // angka dice kanan
  bool masihRoll = false; // status dice udah di roll atau belum

  void randomizeDice() {
    if (masihRoll) return; // kalau dice sudah di roll, tidak bisa di roll lagi

    masihRoll = true; // ngubah status menjadi sudah di roll

    const durasiRoll = Duration(seconds: 1);
    const interval = Duration(milliseconds: 100);
    final udahanRoll = DateTime.now().add(
        durasiRoll); // waktu akhir roll, dari waktu awal roll ditambah durasi roll

    Timer.periodic(interval, (timer) {
      //timer untuk roll
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
      });

      if (DateTime.now().isAfter(udahanRoll)) {
        // kalau waktu sudah lebih dari durasi roll maka nanti bakalan stop
        timer.cancel();
        masihRoll = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        leftDiceNumber = Random().nextInt(6) + 1;
                      });
                    },
                    child: Image.asset('images/dice$leftDiceNumber.png')),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        rightDiceNumber = Random().nextInt(6) + 1;
                      });
                    },
                    child: Image.asset('images/dice$rightDiceNumber.png')),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {
              randomizeDice();
            },
            child: Text(
              'Roll Dice',
              style: TextStyle(
                  fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
