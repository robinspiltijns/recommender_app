import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/buttons/custom-text-button.dart';


class Screen0neWidget extends StatefulWidget {

  @override
  _Screen0neWidgetState createState() => _Screen0neWidgetState();
}

class _Screen0neWidgetState extends State<Screen0neWidget> {

  @override
  void initState() {
    super.initState();
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }


  onPressed(BuildContext context) {
    //todo: persist name
    Navigator.pushNamed(
        context,
        "/screen-2"
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff221E48), Color(0xff0F0C26)])),
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 50, right: 50),
                child: Text("Welcome!",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline1,),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 45, right: 50),
                child: Text("Could we get your name?",
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1,),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 40,right: 10, top: 10),
                      height: 40,
                      child: TextField(
                        controller: myController,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                            hintText: "e.g. John Johnsson",
                            hintStyle: Theme.of(context).textTheme.bodyText2,
                            filled: true,
                            fillColor: Theme.of(context).buttonColor,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      width: 70,
                      height: 40,
                      margin: EdgeInsets.only(top: 10, right: 40),
                      child: InkWell(
                          onTap: () {onPressed(context);},
                          child: CustomTextButton("Next", color: Colors.white,)
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}