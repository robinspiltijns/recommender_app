import 'package:flutter/cupertino.dart';
import 'package:frontend/common/components/buttons/custom-text-button.dart';

class PodcastDetails extends StatelessWidget {

  final String id;

  PodcastDetails(this.id);

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("test"),
        CustomTextButton("go back",
        callBack: () => {
          Navigator.pop(context)
        })
      ]
    );
  }
}