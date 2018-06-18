import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class FadeImage extends StatelessWidget {
  int indexNum;
  FadeImage(int index) {
    indexNum = index;
  }
  @override
  Widget build(BuildContext context) {
    final title = 'Fade in images';

    return MaterialApp(
      title: title,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text(title),
        // ),
        body: Stack(
          children: <Widget>[
            Text(indexNum.toString()),
            Center(child: CircularProgressIndicator()),
            Center(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image:
                    'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
