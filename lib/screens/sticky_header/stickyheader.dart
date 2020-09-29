import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';

class StickyHeader extends StatefulWidget {
  @override
  _StickyHeaderState createState() => _StickyHeaderState();
}

class _StickyHeaderState extends State<StickyHeader>
    with SingleTickerProviderStateMixin {
  final List<String> imageList = [
    "lib/assets/images/s1.png",
    "lib/assets/images/s2.png",
    "lib/assets/images/s3.png",
    "lib/assets/images/s4.png",
    "lib/assets/images/s5.png",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: GFColors.DARK,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Icon(
                  CupertinoIcons.back,
                  color: GFColors.SUCCESS,
                ),
              )),
          title: const Text(
            'Sticky Header',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: Container(
            // alignment: AlignmentDirectional.center,
            child: ListView.builder(
                itemCount: imageList.length,
                itemBuilder: (context, index) => GFStickyHeaderBuilder(
                      direction: Axis.vertical,
                      // enableHeaderOverlap: true,
                      // stickyContentPosition: GFPosition.end,
                      stickyContentBuilder:
                          (BuildContext context, double stuckValue) {
                        stuckValue = 1.0 - stuckValue.clamp(0.0, 1.0);
                        return Center(
                          child: Container(
                            height: 50.0,
                            width: MediaQuery.of(context).size.width,
                            color: Color(0xFF42335d)
                                .withOpacity(0.6 + stuckValue * 0.4),
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Product #$index',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                      content: Container(
                        // margin: EdgeInsets.all(8),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.teal,
                        child: Image.asset(imageList[index],
                            fit: BoxFit.cover, width: 300, height: 200.0),
                      ),
                    ))),
      );
}
