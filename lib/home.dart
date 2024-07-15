import 'package:api/Data/data_models/product_data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
  }

class _HomeState extends State<Home> {
  List<DataModel> mylist = [
    DataModel(
      name: 'First prod',
      description: 'Gamed',
      price: 20,
      imageUrl: 'lib/assets/images/thumb-1920-910148.jpg'
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,),
              itemCount: mylist.length,
          itemBuilder: (context, index) {
            return Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Colors.indigoAccent,borderRadius: BorderRadius.circular(10)),
                  width: 100,
                  height: 100,
              child: Text('${mylist[index].name}'),
            );

          },)
      ),

    );
  }
}

    