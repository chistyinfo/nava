import 'package:flutter/material.dart';

class AudioList extends StatelessWidget {
  final bank;
  AudioList(this.bank);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.00),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Image.network('https://images.app.goo.gl/uvFmvrTfsWpkHX928'),
              Container(
                height: 8.0,
              ),
              Text(bank["name"],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
