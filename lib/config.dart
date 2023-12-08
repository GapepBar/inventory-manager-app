import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Config {
  /* -------------------------------- app setup ------------------------------- */
  // ignore: constant_identifier_names
  static const String GrocApp = 'GrocApp';
  // static const String apiURL = '127.0.0.1:8000';
  // static const String apiURL = 'http://35.154.32.225:8000';
  // static const String apiURL = 'http://10.183.216.61:8000';
  // static const String apiURL = 'http://localhost:8000';
  // static const String apiURL = '127.0.0.1:8000';
  static const String apiURL = 'http://192.168.153.122:8000';
  // 127.0.0.1:8000
  // 192.168.1.16:8000
  // static const String apiURL =
  //     'https://i1fn4d1wa3.execute-api.ap-south-1.amazonaws.com/dev';

  /* -------------------------------------------------------------------------- */
  /*                               End Points                                   */
  /* -------------------------------------------------------------------------- */

  static Size scSize = WidgetsBinding.instance.window.physicalSize;
  static double scHeight =
      ui.window.physicalSize.height / ui.window.devicePixelRatio;
  static double scWidth =
      ui.window.physicalSize.width / ui.window.devicePixelRatio;

  /* ---------------------------------- AUth ---------------------------------- */
  static const String LoginAPI = '/Login';

  /* ------------------------------ Orders Api ------------------------------ */

  static const String fetchAllordersbystatus = '/order/getAllOrdersByStatus';
  static const String fetchorderdetail = '/order/getOrderById';
  static const String orderApprovebyId = '/order/orderApproveById';
  static const String orderSettlebyId = '/order/orderSettleById';
}
