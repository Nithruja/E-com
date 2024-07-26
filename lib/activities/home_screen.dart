import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'helping_widgets/bottom_screen.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> carouselItems = [];
  List<dynamic> categories = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/home/withoutPrice'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        carouselItems = data['carouselItems'] ?? [];
        categories = data['categories'] ?? [];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {

                  },
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(

                    
                  ),

                ),
              ],
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications_none),
                  onPressed: () {

                  },
                ),
              ],
            ),
          ],
        ),
        // backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [


            CarouselSlider(
              options: CarouselOptions(height: 200, autoPlay: true),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Image.asset(
                        'assets/first.jpg',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height:20),
            CategoryList(),
            SizedBox(height:20),
            buildKycNotification(),
            SizedBox(height:20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Card(
                // margin: EdgeInsets.only(left: 40, right: 30),

                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 135,
                                  width: 85,
                                  child: Stack(
                                    children: [

                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10)),
                                          height: 130,
                                          width: 80,
                                          child: Image.asset(
                                            'assets/decor.jpg',
                                            fit: BoxFit.cover,
                                          )),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 135,
                                  width: 85,
                                  child: Stack(
                                    children: [

                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10)),
                                          height: 130,
                                          width: 80,
                                          child: Image.asset(
                                            'assets/decor.jpg',
                                            fit: BoxFit.cover,
                                          )),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 135,
                                  width: 85,
                                  child: Stack(
                                    children: [

                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10)),
                                          height: 130,
                                          width: 80,
                                          child: Image.asset(
                                            'assets/decor.jpg',
                                            fit: BoxFit.cover,
                                          )),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 135,
                                  width: 85,
                                  child: Stack(
                                    children: [

                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10)),
                                          height: 130,
                                          width: 80,
                                          child: Image.asset(
                                            'assets/decor.jpg',
                                            fit: BoxFit.cover,
                                          )),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height:20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Card(
                // margin: EdgeInsets.only(left: 40, right: 30),

                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 135,
                                  width: 85,
                                  child: Stack(
                                    children: [

                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10)),
                                          height: 130,
                                          width: 80,
                                          child: Image.asset(
                                            'assets/decor.jpg',
                                            fit: BoxFit.cover,
                                          )),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 135,
                                  width: 85,
                                  child: Stack(
                                    children: [

                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10)),
                                          height: 130,
                                          width: 80,
                                          child: Image.asset(
                                            'assets/decor.jpg',
                                            fit: BoxFit.cover,
                                          )),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 135,
                                  width: 85,
                                  child: Stack(
                                    children: [

                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10)),
                                          height: 130,
                                          width: 80,
                                          child: Image.asset(
                                            'assets/decor.jpg',
                                            fit: BoxFit.cover,
                                          )),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 135,
                                  width: 85,
                                  child: Stack(
                                    children: [

                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10)),
                                          height: 130,
                                          width: 80,
                                          child: Image.asset(
                                            'assets/decor.jpg',
                                            fit: BoxFit.cover,
                                          )),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
            buildExclusiveOffers(),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildCarousel() {
    return CarouselSlider(
      items: carouselItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network(
              item['imageUrl'],
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }

  Widget buildKycNotification() {
    return Container(
      color: Colors.blueAccent,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'KYC Pending',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'You need to provide the required documents for your account activation.',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              // Implement KYC action
            },
            child: Text(
              'Click Here',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }





  Widget buildExclusiveOffers()  {
    // Implement exclusive offers section
    return Container(); // Placeholder
  }


}



class CategoryList extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'title': 'Mobiles', 'image': 'assets/mobile.jpg'},
    {'title': 'Electronics', 'image': 'assets/electronics.jpeg'},
    {'title': 'Fashion', 'image': 'assets/fashion.jpeg'},
    {'title': 'Furniture', 'image': 'assets/furniture.jpeg'},
    {'title': 'Grocery', 'image': 'assets/gerocry.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.pink[50],
                    backgroundImage: AssetImage(category['image']!),
                  ),
                  SizedBox(height: 8),
                  Text(
                    category['title']!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}










