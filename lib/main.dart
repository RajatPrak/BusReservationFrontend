import 'package:busreservationapp/pages/add_bus_page.dart';
import 'package:busreservationapp/pages/add_route_page.dart';
import 'package:busreservationapp/pages/add_schedule_page.dart';
import 'package:busreservationapp/pages/booking_confirmation_page.dart';
import 'package:busreservationapp/pages/login_page.dart';
import 'package:busreservationapp/pages/reservation_page.dart';
import 'package:busreservationapp/pages/search_page.dart';
import 'package:busreservationapp/pages/search_result_page.dart';
import 'package:busreservationapp/pages/seat_plan_page.dart';
import 'package:busreservationapp/providers/app_data_provider.dart';
import 'package:busreservationapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppDataProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        brightness: Brightness.dark,
      ),
      initialRoute: routeNameHome,
      routes: {
        routeNameHome : (context) => const SearchPage(),
        routeNameSearchResultPage : (context) => const SearchResultPage(),
        routeNameSeatPlanPage : (context) => const SeatPlanPage(),
        routeNameBookingConfirmationPage : (context) => const BookingConfirmationPage(),
        routeNameAddBusPage : (context) => const AddBusPage(),
        routeNameAddRoutePage : (context) => const AddRoutePage(),
        routeNameAddSchedulePage : (context) => const AddSchedulePage(),
        routeNameReservationPage : (context) => const ReservationPage(),
        routeNameLoginPage : (context) => const LoginPage(),

      },
    );
  }
}
