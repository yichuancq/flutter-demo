import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//me
class TopicListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(

        title: Text("专题", style: TextStyle(fontSize: 15)),
        //new Icon(Icons.border_inner),
      ),
      //body: initView(),
    );
  }
}
