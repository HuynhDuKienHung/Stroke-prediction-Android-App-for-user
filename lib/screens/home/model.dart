import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

class HTTP extends StatefulWidget {
  const HTTP({super.key});

  @override
  State<HTTP> createState() => _HTTPState();
}

class _HTTPState extends State<HTTP> {
  String name = ""; //user's response will be assigned to this variable
  String final_response =
      ""; //will be displayed on the screen once we get the data from the server
//------------------------------------------------------------------------
  dynamic result = " ";
  void display(dynamic Result) {
    setState(() {
      result = Result;
    });
  }
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------

  //function to add border and rounded edges to our form
//  OutlineInputBorder _inputformdeco() {
//    return OutlineInputBorder(
//      borderRadius: BorderRadius.circular(20.0),
//      borderSide:
//          BorderSide(width: 1.0, color: Colors.blue, style: BorderStyle.solid),
//    );
//  }
  void du_doan() async {
//----------------------------------------------------------------------------------------
    // Reference to the collection
    String Id = FirebaseAuth.instance.currentUser!.uid;
    DocumentReference userRef =
        FirebaseFirestore.instance.collection('User').doc(Id);
    DocumentSnapshot userSnapshot = await userRef.get();
    dynamic jsonObject = userSnapshot.data();
//-------------------lay du lieu nguoi dung ve app----------------------------------------
//----------------------------------------------------------------------------------------
    //url to send the post request to
    const String urlString =
        'https://neat-terrapin-absolutely.ngrok-free.app/predict';
    Uri uri = Uri.parse(urlString);
    final url = uri;
    //sending a post request to the url
    try {
      Map<dynamic, String> jsonData = {
        "arg_1": jsonObject['gender'],
        "arg_2": jsonObject['age'],
        "arg_3": jsonObject['hypertension'],
        "arg_4": jsonObject['heart_disease'],
        "arg_5": jsonObject['marrital_status'],
        "arg_6": jsonObject['work_type'],
        "arg_7": jsonObject['residence'],
        "arg_8": jsonObject['avg_glucose_level'],
        "arg_9": jsonObject['bmi'],
        "arg_10": jsonObject['smoking_status'],
        "arg_11": Id,
      };
//--------------------------http request --------------------------------------
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(jsonData),
      );

      dynamic Result = response.body;
      print(response.body);
      display(Result);
    } catch (e) {
      print('Lỗi: $e');
    }
  }

  void Start() async {
//----------------------------------------------------------------------------------------
    // Reference to the collection
    String Id = FirebaseAuth.instance.currentUser!.uid;
//-------------------lay du lieu nguoi dung ve app----------------------------------------
    //url to send the post request to

    const String urlString =
        'https://neat-terrapin-absolutely.ngrok-free.app/update_ID';
    Uri uri = Uri.parse(urlString);
    final url = uri;
    //sending a post request to the url
    try {
      Map<dynamic, String> jsonData = {
        "ma_nguoi_dung": Id,
      };
//--------------------------http request --------------------------------------
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(jsonData),
      );
    } catch (e) {
      print('Lỗi: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      alignment: Alignment.center,
      constraints: const BoxConstraints(maxHeight: 1000, maxWidth: 500),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          const Text(
            textAlign: TextAlign.center,
            '\nHƯỚNG DẪN ĐO HUYẾT ÁP VÀ NHỊP TIM',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 14, 76, 128)),
          ),

          const Text(
            'Quấn vòng Bít vào cánh tay, chú ý giữ vòng Bít ngang tầm tay với tim, khoảng cách từ mép vòng bít đến khuỷu tay là khoảng 1 - 2 cm.\n',
            style: TextStyle(color: Colors.black, fontSize: 20),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
              height: 200,
              width: 500,
              child: Image.asset('assets/huong_dan_do.png')),
          const Text(
            'Ấn nút Start dưới đây và nút bắt đầu từ bộ đo huyết áp để tiến hành đo',
            style: TextStyle(color: Colors.black, fontSize: 20),
            textAlign: TextAlign.justify,
          ),
          ElevatedButton(onPressed: Start, child: const Text('Start')),

          const Text(
            ' Thông tin về huyết áp và nhịp tim sẽ được lưu lại sau khi quá trình đo hoàn thành',
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),

          ElevatedButton(
              onPressed: du_doan,
              child: const Text(
                'Dự đoán',
              )),
          //displays the data on the screen
          const Text(
            "Kết quả sơ bộ:",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            '$result',
            style: const TextStyle(fontSize: 24),
          )
        ],
      ),
    ));
  }
}
