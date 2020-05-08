import 'package:flutter/material.dart';
import 'package:plant_shop/constants/custom_colors.dart';
import 'package:plant_shop/widgets/home_screen_header.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTagIndex = 1;
  List<String> _searchTags = ['Popular', 'New', 'Sale'];

  @override
  void initState() {
    super.initState();
    final Future<http.Response> response = http.get('https://trefle.io/api/plants?q=torch&token=a0N3VTI0YzBBQlFYSmFQQnBhbGFIUT09');

    response.then((data) => print(data.body));
  }

  List<Widget> _buildSearchTags() {
    return _searchTags.asMap().entries.map((entry) {
      int index = entry.key;
      String value = entry.value;

      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: _selectedTagIndex == index
              ? CustomColors.primaryColor
              : Colors.grey.withOpacity(.5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          value,
          style: TextStyle(
              color: _selectedTagIndex == index
                  ? Colors.white
                  : CustomColors.primaryColor),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HomeScreenHeader(),
          Container(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: CustomColors.backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _buildSearchTags(),
                ),
                SizedBox(height: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}
