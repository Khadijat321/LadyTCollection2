import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterproject2_app/provider/change_value_price.dart';

class SettingScreen extends StatelessWidget {

  const SettingScreen({
    super.key,
  });
  
  @override
  Widget build(BuildContext context){
    final TextEditingController priceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('SETTINGS')),
      body:Center(
        child:Column(children:[
          TextField(
            controller:priceController,
            style:TextStyle(fontSize:20, fontWeight:FontWeight.bold),
          ),
          ElevatedButton(onPressed:(){ context.read<ChangeValuePrice>().setValuePrice(double.parse(priceController.text));},child:Text('change Price'),)
        ],
        ),
      ),
    );
  }
}
