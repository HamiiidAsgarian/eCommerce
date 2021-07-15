import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/screens/02_category_screen2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryFramePage extends StatefulWidget {
  const CategoryFramePage({this.hasBack = false});
  final bool hasBack;

  @override
  _CategoryFramePageState createState() => _CategoryFramePageState();
}

class _CategoryFramePageState extends State<CategoryFramePage> {
  var _secondPageData;
  @override
  void initState() {
    super.initState();

    _secondPageData = Provider.of<ProviderModel>(context,
            listen:
                false) //NOTE maybe better to delete this and pass it to provider totally
        .getDataFromApi(url: "http://localhost:3000/secondPage");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, vals, child) {
      return Navigator(onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () async {
                print("object");
              },
              child: FutureBuilder(
                  future: _secondPageData,
                  builder: (context, AsyncSnapshot<Map> snapshot) {
                    if (snapshot.hasData) {
                      return CategoryScreen(data: snapshot.data);
                    }
                    return CircularProgressIndicator();
                  }),
            ),
          );
        });
      });
    });
  }
}