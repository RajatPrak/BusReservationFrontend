import 'package:busreservationapp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getFormattedDate(DateTime dt, {String pattern = 'dd/MM/yyyy'}) {
  return DateFormat(pattern).format(dt);
}

String getFormattedTime(TimeOfDay tm, {String pattern = 'HH:mm'}) {
  return DateFormat(pattern).format(DateTime(0,0,0,tm.hour,tm.minute));
}

void showMsg(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));

int getGrandTotal(int discount, int totalSeatBooked, int price, int fee) {
  final subTotal = totalSeatBooked * price;
  final priceAfterDiscount =
      subTotal - ((subTotal * discount) / 100);
  return (priceAfterDiscount + fee).toInt();
}

Future<bool> saveToken(String token)async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.setString(accessToken,token);
}

Future<String> getToken()async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(accessToken)??"";
}

Future<bool>saveLoginTime(int time)async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.setInt(loginTime, time);
}

Future<int> getLoginTime()async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt(loginTime)??0;
}

Future<bool>saveExpirationDuration(int time)async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.setInt(expirationDuration, time);
}

Future<int>getExpirationTime()async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt(expirationDuration)??0;
}

Future<bool> hasTokenExpired()async{
  final loginTime = await getLoginTime();
  final expirationDuration = await getExpirationTime();

  return DateTime.now().millisecondsSinceEpoch - loginTime > expirationDuration;
}