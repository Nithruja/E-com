import 'dart:convert';
import 'package:deals_dray/activities/splash_screenn.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'otp_screen.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPhoneSelected = true;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();


  void _sendCode() async {
    String input = isPhoneSelected ? _phoneController.text : _emailController.text;
    String url = 'http://devapiv4.dealsdray.com/api/v2/user/otp';

    Map<String, String> headers = {"Content-Type": "application/json"};
    Map<String, String> body = isPhoneSelected
        ? {"phone": input}
        : {"email": input};

    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      print('OTP sent to: $input');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPVerificationPage(contact: input),
        ),
      );
    } else {
      // Error sending OTP
      print('Failed to send OTP: ${response.statusCode}');
      print('Error: ${response.body}');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/dealsdray_logo.png'),
            SizedBox(height: 20),
            ToggleButtons(
              isSelected: [isPhoneSelected, !isPhoneSelected],
              selectedColor: Colors.white,
              fillColor: Colors.red,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Phone'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Email'),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  isPhoneSelected = index == 0;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Glad to see you!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Please provide your ${isPhoneSelected ? 'phone number' : 'email'}',
            ),
            SizedBox(height: 20),
            TextField(
              controller: isPhoneSelected ? _phoneController : _emailController,
              keyboardType: isPhoneSelected ? TextInputType.phone : TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: isPhoneSelected ? 'Phone' : 'Email',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendCode,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),

              child: Text('SEND CODE'),
              onLongPress: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => OTPVerificationPage(contact: '',)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
