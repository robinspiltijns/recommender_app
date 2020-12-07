import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {

  final ValueChanged<String> onSubmit;
  final String query;

  const SearchFieldWidget({this.onSubmit, this.query});

  String generateHintText() {
    if (query == null) {
      return 'Title, description, genre, ...';
    } else {
      return query;
    }
  }

  TextStyle generateHintStyle() {
    if (query == null) {
      return TextStyle(color: Colors.white.withOpacity(0.5));
    } else {
      return TextStyle(color: Colors.white.withOpacity(1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return  TextField(
      onSubmitted: onSubmit,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        prefixIcon:
        Icon(Icons.search, color: Colors.white.withOpacity(0.5)),
        hintText: generateHintText(),
        hintStyle: generateHintStyle(),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.8),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        contentPadding: const EdgeInsets.only(left: 14.0, right: 14.0),
      ),
    );
  }

}