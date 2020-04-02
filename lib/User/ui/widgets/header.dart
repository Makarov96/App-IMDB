import 'package:flutter/material.dart';


class Header extends StatefulWidget {
  final  String texto;
  Header({Key key, @required this.texto}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:30),
        child: Container(
          margin: EdgeInsets.only(top:30),
          width: double.infinity,
          child: Row(
            children:<Widget>[
                Text(widget.texto, style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Colors.black
                )),
                Spacer(),
                IconButton(icon: Icon(Icons.search), onPressed: (){},
                iconSize: 35,
                color: Colors.black,
                )
            ]
          ),
        ),
      ),
    );
  }
}