import 'dart:convert';

import 'package:api/Data/data_models/product_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
  }

class _HomeState extends State<Home> {
  List<DataModel> mylist = [

  ];
  Future<void> getPData() async {
    var response = await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> prolist = data['products'];

      for (Map<String, dynamic> item in prolist) {

        DataModel p1 = DataModel.fromMapJson(item);
        mylist.add(p1);
      }

      setState(() {

      });
      print('success ${response.body}');

    } else {
      print('error ${response.statusCode}');
      print('error ${response.body}');
    }
  }
  @override
  void initState() {
    super.initState();
    getPData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 400,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,),
              itemCount: mylist.length,
          itemBuilder: (context, index) {
            return Column(

              children: [
                Container(
                    decoration: BoxDecoration(color: Colors.amberAccent,borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
                    child: Expanded(child: Image.network('${mylist[index].imageUrl}', fit: BoxFit.contain,),)),

                Container(
                  decoration: BoxDecoration(color: Colors.black),
                  child: Padding(padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text('${mylist[index].name}',
                          style: TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold,),
                          maxLines: 1,overflow: TextOverflow.clip,),
                      )
                      ),
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Padding(padding: EdgeInsets.all(8),
                  child: Text('${mylist[index].description}',maxLines: 2,overflow: TextOverflow.ellipsis,),
                  ),
                ),
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  child: Center(
                    child: Padding(padding: EdgeInsets.all(8),
                      child: Text('price ${mylist[index].price} ',
                        style:TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 20) ,) ,),
                  ),
                )
              ],
            );

          },)
      ),

    );
  }
}

    