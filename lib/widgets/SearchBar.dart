import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:<Widget>[
        Icon(Icons.search,color: Colors.black45,),
        SizedBox(width: 20,),
        Expanded(child: TextField(
          decoration: InputDecoration(hintText: 'Search...',contentPadding: EdgeInsets.symmetric(vertical: 10),hintStyle: TextStyle(color: Colors.black87)),
        ))
      ],
    );
  }
}
