import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dimen.dart' as dim;
import 'string.dart' as str;
import 'manager/seller.dart';
import 'ui/ui.dart';

main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  SystemChrome.setEnabledSystemUIOverlays([]);
  final gio = SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(gio);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SellerApp(),
  ));
}

class SellerApp extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    dim.Dimen.init(size);
    str.TString.init(str.Langue.FR);
    SellerManager smg = SellerManager(key: _key);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Container(
        color: Colors.white,
        width: 250.0,
      ),
      key: _key,
      // backgroundColor: Color(0xFF001422),
      backgroundColor: Color(0xFF000d1d),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          StreamBuilder<Map<String, dynamic>>(
              stream: smg.featureBar,
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return FeaturesBar(
                    callback: (String name) {
                      smg.onFeatureItemClicked(name);
                    },
                    nbrNewOrder: snapshot.data["newOrder"],
                    currentFeature: snapshot.data["currentFeature"],
                  );
                return Container();
              }),
          Expanded(
            child: StreamBuilder<String>(
              stream: smg.content,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data) {
                    case "order":
                      return OrderUi();
                      break;
                    case "product":
                      return Container(
                        child: Center(
                          child: Text("product",
                              style: TextStyle(color: Colors.white)),
                        ),
                      );
                      break;
                    case "customer":
                      return Container(
                        child: Center(
                          child: Text("customer",
                              style: TextStyle(color: Colors.white)),
                        ),
                      );
                      break;
                    case "provider":
                      return Container(
                        child: Center(
                          child: Text("provider",
                              style: TextStyle(color: Colors.white)),
                        ),
                      );
                      break;
                  }
                }
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
