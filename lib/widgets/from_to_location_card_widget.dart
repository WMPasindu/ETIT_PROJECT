import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';

import 'flat_button_widget.dart';

class FromToLocationCard extends StatelessWidget {
  final String fromLocation;
  final String toLocation;
  final Function onTapSwitch;
  final bool isPlusVisible;

  FromToLocationCard({
    Key key,
    @required this.fromLocation,
    @required this.toLocation,
    this.isPlusVisible = true,
    this.onTapSwitch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //Main Card
        Container(
          height: 110,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 0, top: 15, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: 20,
                        height: 130,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8 / 2),
                                  color: Colors.black),
                            ),
                            MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                removeRight: true,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 18,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 1,
                                          ),
                                          Container(
                                            height: 2,
                                            width: 2,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        2 / 2),
                                                color: Colors.black),
                                          )
                                        ],
                                      );
                                    })),
                            SizedBox(
                              height: 1,
                            ),
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8 / 2),
                                  color: Colors.red),
                            ),
                          ],
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Opacity(
                                child: Text(
                                  fromLocation,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                        fontSize: 16,
                                        color: kLoginBlack,
                                      ),
                                ),
                                opacity: 0.64,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(
                                  Viiticons.star,
                                  size: 20,
                                  color: kAccentColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),

                        //Devider
                        Container(
                            height: 0.5,
                            color: Colors.black12,
                            width: MediaQuery.of(context).size.width - 126),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 120,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Opacity(
                                child: Text(
                                  toLocation,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                        fontSize: 16,
                                        color: kLoginBlack,
                                      ),
                                ),
                                opacity: 0.64,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),

        // Switch up-down icon
        Positioned(
          right: 40,
          top: 40,
          child: GestureDetector(
            onTap: onTapSwitch,
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0XFF275687),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: IconButton(
                        iconSize: 16,
                        onPressed: () => {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: new Text("Mode of transporting"),
                                  content: Container(
                                    height: 100,
                                    width: 200,
                                    child: Column(
                                      children: <Widget>[
                                        new Text("Transport mode"),
                                        new DropdownButton<String>(
                                          underline: Container(),
                                          items: <String>[
                                            'Bus',
                                            'Bus A/C',
                                            'Train',
                                            'Train A/C',
                                            'Taxi (Three Wheel)',
                                            'Taxi (Car)',
                                            'Taxi (Van)',
                                          ].map((String value) {
                                            return new DropdownMenuItem<String>(
                                              value: value,
                                              child: new Text(
                                                value,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String value) {},
                                        )
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    FlatButtonWidget(
                                      btnTxt: "Ok",
                                      btnColor: kAccentColor,
                                      btnOnTap: () {
                                        Navigator.of(context, rootNavigator: true).pop('dialog');
                                      },
                                    )
                                  ],
                                );
                              }),
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
