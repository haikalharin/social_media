import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/injector/injector.dart';

class AppSharedPreference {
  static const String user = "user";
  static const String _userFirebase = "user";
  static const String _usernameRegister = "_usernameRegister";
  static const String userRegister = "_userRegister";
  static const String loginResponse = "_loginResponse";
  static const String role = "role";
  static const String baby = "baby";
  static const String babyProgress = "babyProfress";
  static const String _person = "person";
  static const String otp = "otp";
  static const String bmSignature = "bm_signature";
  static const String checkIn = "checkin";
  static const String hospital = "hospital";
  static const String dateTime = "dateTime";
  static const String haveBpjsorKis = "haveBpjsorKis";
  static const String token = "token";
  static const String newInstall = "new_install";
  static const String isFirstLaunch = "isFirstLaunch";
  static const String isShowGuide = "show_guide";
  static const String cookie = "cookie";

  static clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static remove(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(key);
  }

  static Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<bool?> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }


}
