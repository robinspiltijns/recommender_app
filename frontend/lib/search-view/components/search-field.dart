import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {

  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: _controller,
      onSubmitted: (value) {
        Navigator.pushNamed(context, "/search-results", arguments: value);
        _controller.clear();
      },
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.5)),
        suffixIcon: IconButton(
          splashRadius: 25,
          color: Colors.white.withOpacity(0.5),
          onPressed: () => _controller.clear(),
          icon: Icon(Icons.clear),
        ),
        hintText: "Title, description, genre, ...",
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
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