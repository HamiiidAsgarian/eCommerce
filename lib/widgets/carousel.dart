import 'package:flutter/material.dart';

import '../consts.dart';

////////////////////////////////////////////////////////////////////
class CarouselSection extends StatefulWidget {
  const CarouselSection(
      {Key? key, required this.items, this.sliderIndex = 1, this.itemIndex = 1})
      : super(key: key);

  final int sliderIndex;
  final int itemIndex;
  final List<dynamic> items;

  @override
  _CarouselSectionState createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  // late PageController controller;
  int currentpage = 1;
  PageController controller = PageController(
    initialPage: 1,
    keepPage: false,
    viewportFraction: 0.75, ////*fraction
  );

  // List carouselItems = widget.items;
  //  [
  //   {"hasLabel": true, "labelText": "New 1"},
  //   {"hasLabel": false},
  //   {"hasLabel": true, "labelText": "New 3"}
  // ];

  List<Widget> slideBuilder(List list, PageController controller) {
    final List<Widget> slideWidgets = [];
    list.asMap().forEach((index, element) {
      slideWidgets.add(Slide(
        controller: controller,
        index: index,
        // hasLabel: element["hasLabel"],
        label: element["label"],
        imageUrl: element["imageURL"],
      ));
    });
    // print(slideWidgets);
    return slideWidgets;
  }

  List<Widget> counterDotsBuilder(List list, int selectedIndex) {
    final List<Widget> counterDotsWidgets = [];
    list.asMap().forEach((index, element) {
      counterDotsWidgets.add(Padding(
        padding: const EdgeInsets.all(5),
        child: CircleAvatar(
          radius: 5,
          backgroundColor: selectedIndex == index
              ? greySelectedCircule
              : greyUnselectedCircule, ////////////////////* circules color
        ),
      ));
    });
    // print(counterDotsWidgets);
    return counterDotsWidgets;
  }

  @override
  // initState() {
  //   // if (controller.hasClients) {
  //   //   print("yes");
  //   //   // controller.jumpToPage(1);
  //   // }

  //   super.initState();
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      //////////////////////////////////////////* whole slider bar
      // color: Colors.amber, //NOTE: debuging color
      // color: cBackgroundGrey,
      child: Column(children: [
        Expanded(
          child: PageView
              // .builder
              (
            onPageChanged: (value) {
              // print(value);
              setState(() {
                currentpage = value;
              });
            },
            controller: controller,
            children: slideBuilder(widget.items, controller),
            // itemBuilder: (context, index) => builder(index)),
          ),
        ),
        Container(
          // width: 80,
          height: 25,
          // color: Colors.pink, //NOTE: counterDots Debug color
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: counterDotsBuilder(widget.items, currentpage),
          ),
        )
      ]),
    );
  }

  // slideBuilder(int index, bool hasLabel, String labelText) {}
}

////////////////////////////////////////////////////////////////////////*slide class
class Slide extends StatefulWidget {
  const Slide(
      {required this.controller,
      required this.index,
      // required this.hasLabel,
      this.label,
      this.imageUrl});

  final PageController controller;
  final int index;
  // final bool hasLabel;
  final String? label;
  final String? imageUrl;

  @override
  _SlideState createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        double value = 1.0;
        if (widget.controller.position.haveDimensions) {
          // print(controller.position.viewportDimension);
          value = widget.controller.page! - widget.index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        } else {
          value = widget.controller.initialPage.toDouble() - widget.index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }

        return Center(
          child: Container(
            ////////////////////////////////////////////////* slide's main frame
            // color: Colors.amber,
            height: Curves.easeOut.transform(value) * 200,
            width: 400,
            child: Stack(
              children: [
                Align(
                  child: Container(
                    height: Curves.easeOut.transform(value) * 200,
                    width: 400,

                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(widget.imageUrl ?? "",
                            fit: BoxFit.fill)),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    ////////////////////////////////////* main slide
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      // color: widget.index % 2 == 0
                      //     ? Colors.blue
                      //     : Colors.redAccent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7, // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
                //////////////////////////////////////////////////////// * label
                if ((widget.label != "") && (widget.label != null))
                  Align(
                    alignment: const Alignment(-0.7, 0.6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: Colors.white,
                        width: 80,
                        height: 25,
                        child: Center(
                          child: Text(
                            widget.label!, ////////////////////////* label text
                            style: standardSearchFontStyle,
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  const SizedBox()
              ],
            ),
          ),
        );
      },
      // child:
    );
  }
}
