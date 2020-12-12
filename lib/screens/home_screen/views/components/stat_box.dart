import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatBox extends StatelessWidget {
  final String title;
  final int total;
  final Color backgroundColor;

  const StatBox({Key key, this.title, this.total, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Expanded(
            child: Text(
              "${NumberFormat("#,###").format(total) ?? "..."}",
              style: TextStyle(fontSize: 48, color: Colors.white),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}