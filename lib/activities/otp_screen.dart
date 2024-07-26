import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OTPVerificationPage extends StatefulWidget {
  final String contact;

  OTPVerificationPage({required this.contact});

  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;
  bool _isResendEnabled = false;
  late Timer _timer;
  int _start = 120;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _start = 120;
    _isResendEnabled = false;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isResendEnabled = true;
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _verifyOTP() async {
    setState(() {
      _isLoading = true;
    });

    String url = 'http://devapiv4.dealsdray.com/api/v2/user/otp/verification';
    Map<String, String> headers = {"Content-Type": "application/json"};
    Map<String, String> body = {
      "contact": widget.contact,
      "otp": _otpController.text
    };

    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(body),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      print('OTP verified successfully.');
    } else {
      print('Failed to verify OTP: ${response.statusCode}');
      print('Error: ${response.body}');
    }
  }

  void _resendOTP() async {
    setState(() {
      _isLoading = true;
    });

    String url = 'http://devapiv4.dealsdray.com/api/v2/user/otp';
    Map<String, String> headers = {"Content-Type": "application/json"};
    Map<String, String> body = {"contact": widget.contact};

    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(body),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      // OTP resent successfully
      print('OTP resent to: ${widget.contact}');
      startTimer();
    } else {
      // Error resending OTP
      print('Failed to resend OTP: ${response.statusCode}');
      print('Error: ${response.body}');
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.sms,
              size: 80,
              color: Colors.red,
            ),
            SizedBox(height: 20),
            Text(
              'OTP Verification',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'We have sent a unique OTP number to your ${widget.contact}',
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  width: 50,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      counterText: "",
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _verifyOTP,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text('VERIFY OTP'),
            ),
            SizedBox(height: 20),
            Text(
              '$_start : ${_start % 60 < 10 ? '0' : ''}${_start % 60}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: _isResendEnabled ? _resendOTP : null,
              child: Text(
                'SEND AGAIN',
                style: TextStyle(color: _isResendEnabled ? Colors.red : Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
