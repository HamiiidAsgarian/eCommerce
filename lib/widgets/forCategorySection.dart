import 'package:commerce_app/consts.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/item.dart';
import 'package:flutter/material.dart';

class HorizontalItemsList extends StatelessWidget {
  HorizontalItemsList(
      {this.sectionTitle,
      this.itemsList,
      this.ListFramePadding = const EdgeInsets.all(0),
      this.ListItemsMargin = const EdgeInsets.all(0)});
  final String? sectionTitle;
  final List<String>? itemsList;
  final EdgeInsets ListFramePadding;
  final EdgeInsets ListItemsMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ListFramePadding,
      color: cBackgroundGrey,
      child: Column(children: [
        // SizedBox(height: 10),
        CategoryTitle(sectionTitle: sectionTitle),
        Container(
          // height: 270,
          child: RowListedItems(itemsList: itemsList, margin: ListItemsMargin),
        ),
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //       children: itemsList!
        //           .map((e) => Container(
        //               // color: Colors.white,
        //               padding:
        //                   const EdgeInsets.only(right: 10, bottom: 10, top: 10),
        //               child: Item(title: e)))
        //           .toList()),
        // ),
      ]),
    );
  }
}

//////*********************************************************/*///////////////////////////////////////////////////////
class RowListedItems extends StatelessWidget {
  RowListedItems(
      {Key? key, this.itemsList, this.margin = const EdgeInsets.all(0)})
      : super(key: key);
  final List<String>? itemsList;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: itemsList!
              .map((e) => Container(
                  margin: margin,
                  // color: Colors.red,
                  // padding: const EdgeInsets.only(right: 0, bottom: 0, top: 0),
                  child: Item(title: e)))
              .toList()),
    );

    // ListView.builder(
    //     // cacheExtent: 500,
    //     // addAutomaticKeepAlives: false,
    //     shrinkWrap: true,
    //     scrollDirection: Axis.horizontal,
    //     itemCount: itemsList!.length,
    //     itemBuilder: (context, index) => Container(
    //         // color: Colors.white,
    //         // padding: const EdgeInsets.only(right: 0, bottom: 10, top: 10),
    //         child: Item(title: itemsList![index])));
  }
}

//////*********************************************************/*///////////////////////////////////////////////////////
class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    Key? key,
    required this.sectionTitle,
  }) : super(key: key);

  final String? sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionTitle != null ? sectionTitle! : "",
          style: forMenFontStyle,
        ),
        RawMaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, "/ListedItems");
          },
          child: Row(
            children: const [
              Text(
                "View More ",
                style: viewMoreFontStyle,
              ),
              Icon(
                MyFlutterApp.right_open,
                size: 13,
                color: appBargrey,
              )
            ],
          ),
        )
      ],
    );
  }
}
