import 'package:flutter/material.dart';
import '../FruitDataModel.dart';
import '../FruitDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<String> sportname = [
    'Push-ups',
    'Cardio',
    'Bodyweight Squats',
    'Plank',
    'Yoga'
  ];
  static List url = [
    'https://blog.nasm.org/hubfs/power-pushups.jpg',
    'https://www.shape.com/thmb/qr6AnPByfid8VTqqv9nrKgJOUr0=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/best-cardio-exercises-promo-2000-498cbfb8f07541b78572bf810e7fb600.jpg',
    'https://static.strengthlevel.com/images/illustrations/bodyweight-squat-1000x1000.jpg',
    'https://blog-images-1.pharmeasy.in/blog/production/wp-content/uploads/2021/01/06152556/3.jpg',
    'https://www.womensrunning.co.uk/wp-content/uploads/2021/06/A68A3785-scaled.jpg'
  ];
  final List<SportDataModel> Sportdata = List.generate(
      sportname.length,
      (index) => SportDataModel('${sportname[index]}', '${url[index]}',
          '${sportname[index]} Description...'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pass Data from ListView to next Screen'),
        ),
        body: ListView.builder(
            itemCount: Sportdata.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(Sportdata[index].name),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: /*Image.asset((Sportdata[index]
                        .ImageUrl))*/
                        Image.network(Sportdata[index].ImageUrl),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SportDetail(
                              sportDataModel: Sportdata[index],
                            )));
                  },
                ),
              );
            }));
  }
}
