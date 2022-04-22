import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/upcoming_ride_itmelayout_widget.dart';


class UpComingRideScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<UpComingRideScreen> {
  List<String> rideTimes = [
    "Today, 9:30 AM",
    "Feb 6, 2022 11:25 AM",
    "Feb 5, 2022 8:25 AM"
  ];
  List<String> rideType = ["Train First Class", "Taxi (Car)", "Bus A/C"];
  List<String> pickUpAdd = [
    "Pettah, Colombo",
    "Pettah, Colombo",
    "Pettah, Colombo",
  ];
  List<String> dropUpAdd = [
    "Naanu Oya, Sri Lanka",
    "Ella, Sri Lanka",
    "Anuradhapura, Sri Lanka"
  ];
  List<String> amount = ["LKR 430.99", "LKR 330.60", "LKR 1200.4"];
  List<String> image = [
    "assets/mapiamge.jpeg",
    "assets/mapiamge.jpeg",
    "assets/mapiamge.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return UpcomingRideItmeLayoutWidget(
            rideTime: rideTimes[index],
            rideName: rideType[index],
            droopupAddress: dropUpAdd[index],
            pickupAddress: pickUpAdd[index],
            rideAmount: amount[index],
            rideImage: image[index],
          );
        });
  }
}
