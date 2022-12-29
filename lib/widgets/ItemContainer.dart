import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Models/fooditems.dart';
import 'package:foodapp/bloc/cartListBloc.dart';

class ItemContainer extends StatelessWidget {
   ItemContainer({Key? key,required this.foodItem}) : super(key: key);

   final FoodItem foodItem;

   final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

   addToCart(FoodItem foodItem){
      bloc.addToList(foodItem);
   }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        addToCart(foodItem);
        final snackBar = SnackBar(content: Text("${foodItem.title} added to cart"),
        duration: Duration(milliseconds: 550),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Items(
        hotel:foodItem.hotel,
        itemName:foodItem.title,
        itemPrice:foodItem.price,
        imgUrl:foodItem.imgUrl,
        leftAligned:(foodItem.id % 2 == 0) ? true : false
      ),
    );
  }
}

class Items extends StatelessWidget {
   Items({Key? key,required this.leftAligned,required this.hotel , required this.itemName ,required this.itemPrice ,required this.imgUrl}) : super(key: key);

  final bool leftAligned;
  final String itemName;
  final String hotel;
  final double itemPrice;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    double containerPadding = 45;
    double containerBorderRadius = 10;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: leftAligned ? 0 :containerPadding,
            right: leftAligned?containerPadding :0
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius:BorderRadius.horizontal(
                    left: leftAligned ? Radius.circular(0) : Radius.circular(containerBorderRadius),
                    right: leftAligned ? Radius.circular(containerBorderRadius) : Radius.circular(0)
                  ),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(padding: EdgeInsets.only(
                left: leftAligned ? 20 : 0,
                right: leftAligned ?0 :20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: Text(
                        itemName,
                        style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),
                      ),
                      ),
                      Text("\$$itemPrice",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color:Colors.black45,fontSize: 15
                        ),
                        children: [
                          TextSpan(text: "by "),
                        TextSpan(
                          text: hotel,
                          style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18)
                        )
                        ]
                      ),
                    ),
                  ),
                  SizedBox(height: containerPadding,)
                ],
              ),
              ),

            ],
          ),
        )
      ],
    );
  }
}

