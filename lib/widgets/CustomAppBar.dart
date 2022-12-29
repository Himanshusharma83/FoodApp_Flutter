import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Models/fooditems.dart';
import 'package:foodapp/bloc/Provider.dart';
import 'package:foodapp/bloc/cartListBloc.dart';
import 'package:foodapp/widgets/Cart.dart';

class CustomAppBar extends StatelessWidget {
   CustomAppBar({Key? key}) : super(key: key);

  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu),
        StreamBuilder(
          stream: bloc.listStream,
          builder: (context,snapshot)
          {
          List<FoodItem>? fooditems = snapshot.data;
          int length = fooditems != null ? fooditems.length : 0;
          return buildGestureDetector(length,context,fooditems);
        },

        ),
        ],
      ),
    );
  }
}
GestureDetector buildGestureDetector(int length,BuildContext context , List<FoodItem>? fooditems){
return GestureDetector(
onTap: (){
  if(length>0){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
  }
  else{
    return;
  }
},
  child: Container(
    margin: EdgeInsets.only(right: 30),
    child: Text(length.toString()),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.yellow[800],borderRadius: BorderRadius.circular(50),
    ),
  ),
);
}
