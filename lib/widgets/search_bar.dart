
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final IconData icon;
  final String helperText;
  
  const SearchBar({
    Key key, this.icon, this.helperText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white.withOpacity(.6),
              size: 24,
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(0),
                  border: InputBorder.none,
                  hintText: helperText,
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(.6),
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
