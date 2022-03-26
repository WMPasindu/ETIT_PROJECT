import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/feel_good/bloc/feel_good_bloc.dart';

class FeelGoodScreen extends StatelessWidget {
  static const String routeName = "feelgood";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: FeelGood(),
      create: (context) => FeelGoodBloc(),
    );
  }
}

class FeelGood extends StatefulWidget {
  @override
  _FeelGoodState createState() => _FeelGoodState();
}

class _FeelGoodState extends State<FeelGood> {
  final imageArry = [
    "assets/wwf.png",
    "assets/greenpeace.png",
    "assets/les_rest.png"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/covid-19-avatar.png",
            width: 221,
            height: 221,
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  "Update Covid 19 Status",
                  style: Theme.of(context).textTheme.caption.copyWith(
                        fontWeight: FontWeight.w500,
                        color: kLoginBlack,
                        fontSize: 20,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "If you got infected with covid 19 recently you can let other know anonymously. This is kind remider of your social responsibility",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Date of infected ",
                  style: TextStyle(fontSize: 20),
                ),
                DatePickerDialog(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022, 01, 01),
                    lastDate: DateTime.now()),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      color: kPrimaryColor, borderRadius: BorderRadius.zero),
                  child: DropdownButton(
                      style: TextStyle(color: Colors.white),
                      items: <String>['Delta', 'Omicron', 'Other']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      underline: Container(),
                      hint: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          "Select the variant type",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                      isExpanded: true,
                      onChanged: (_) => {}),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
