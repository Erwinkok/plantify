import 'package:flutter/material.dart';
import 'package:plant_shop/widgets/search_bar.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                size: 24,
                color: Colors.white,
              )
            ],
          ),
          SizedBox(height: 30),
          RichText(
            text: TextSpan(
              text: 'What Plants\nDo You Want?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 30),
          SearchBar(icon: Icons.search, helperText: 'Search what you need',)
        ],
      ),
    );
  }
}
