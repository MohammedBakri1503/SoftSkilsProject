import 'package:flutter/material.dart';
import '../FruitDataModel.dart';

class SportDetail extends StatelessWidget {
  final SportDataModel sportDataModel;

  const SportDetail({Key? key, required this.sportDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sportDataModel.name),
      ),
      body: Column(
        children: [
          Image.network(sportDataModel.ImageUrl),
          SizedBox(
            height: 10,
          ),
          Text(
            sportDataModel.desc,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
