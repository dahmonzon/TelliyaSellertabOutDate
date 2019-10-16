import 'package:flutter/material.dart';
import 'package:seller_tab/dimen.dart' as dim;
import 'package:seller_tab/manager/order.dart';
import 'package:seller_tab/style.dart' as stl;

class OrderUi extends StatefulWidget {
  _OrderUiState createState() => _OrderUiState();
}

class _OrderUiState extends State<OrderUi> {
  Widget menu;
  Widget orderList;
  Widget arrivingRiderBar;
  Widget orderDetaille;
  OrderManager orm;

  @override
  void initState() {
    orm = OrderManager();
    super.initState();
  }

  Widget menuButton(String title, bool isCurrent, Function callback) {
    return GestureDetector(
        onTap: () {
          callback(title);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isCurrent ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(2.0)),
          child: Text(
            title,
            style: isCurrent
                ? stl.TStyle.n1.copyWith(color: Colors.black)
                : stl.TStyle.n1,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    menu = Container(
      alignment: Alignment.center,
      width: dim.Dimen.orderMenuSize.width,
      height: dim.Dimen.orderMenuSize.height,
      child: Container(
        width: dim.Dimen.orderMenuButtonSize.width,
        height: dim.Dimen.orderMenuButtonSize.height,
        decoration: BoxDecoration(
            color: Color(0xFF000d1d).withBlue(60),
            borderRadius: BorderRadius.circular(2.0)),
        child: StreamBuilder<List<bool>>(
            stream: orm.activeButton,
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return Row(
                  children: <Widget>[
                    Expanded(
                        child: menuButton(
                      "Ventes",
                      snapshot.data[0],
                      orm.onMenuButtonClick,
                    )),
                    Expanded(
                      child: menuButton(
                          "Achats", snapshot.data[1], orm.onMenuButtonClick),
                    )
                  ],
                );
              return Container();
            }),
      ),
    );

    arrivingRiderBar = Container(
      height: dim.Dimen.orderRiderBarSize.height,
      width: dim.Dimen.orderRiderBarSize.width,
      // color: Colors.white,
    );
    orderDetaille = Container(
      margin: EdgeInsets.only(top: dim.Dimen.yblocSize * 3),
      width: dim.Dimen.orderDetailSize.width,
      height: dim.Dimen.orderDetailSize.height,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(3.0)),
    );
    orderList = Container(
      width: dim.Dimen.orderListSize.width,
      height: dim.Dimen.orderListSize.height,
      child: Column(
        children: <Widget>[
          Container(
            height: dim.Dimen.orderListheaderHeight,
            child: Row(
              children: <Widget>[
                Text("Nouveau", style: stl.TStyle.n1),
                SizedBox(
                  width: 10.0,
                ),
                Icon(Icons.expand_more, size: 23.0, color: Colors.white)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0),
            height: dim.Dimen.orderListcontentHeight,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  height: 45.0,
                  margin: EdgeInsets.symmetric(vertical: 3.0),
                  color: Colors.white,
                );
              },
            ),
          )
        ],
      ),
      // color: Colors.white,
    );

    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            menu,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: dim.Dimen.orderListLeftMargin,
                ),
                orderList,
                SizedBox(
                  width: dim.Dimen.orderListRightMargin,
                ),
                orderDetaille
              ],
            )
          ],
        ),
        arrivingRiderBar,
      ],
    );
  }
}
