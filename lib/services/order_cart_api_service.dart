import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';
import '../models/order/orders.dart';

final ordercartApiService = Provider((ref) => APIServiceOrderCart());

class APIServiceOrderCart {
  static var client = http.Client();

  Future<List<Orders>> fetchOrdersByStatus(String status) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = "${Config.apiURL}${Config.fetchAllordersbystatus}";
    var url = Uri.parse(ur);

    print('url is: $url');

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode({'status': status}));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return ordersFromJson(data['data']);
    } else {
      return [];
    }
  }

  Future<Orders> orderdetailProvider(String orderId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = "${Config.apiURL}${Config.fetchorderdetail}";
    var url = Uri.parse(ur);

    print('url is: $url');

    print(orderId);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode({'orderId': orderId}));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return Orders.fromJson(data['data']);
    } else {
      return Orders(
          orderId: 'orderId',
          date: DateTime(DateTime.april),
          orderStatus: 'orderStatus',
          productsItem: [],
          billedItems: [],
          bill: 0,
          deliveryCharges: 0);
    }
  }

  Future<String> orderapproveProvider(String orderId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = "${Config.apiURL}${Config.orderApprovebyId}";
    var url = Uri.parse(ur);

    print('url is: $url');

    print(orderId);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode({'orderId': orderId}));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data['data'];
    } else {
      return 'failure';
    }
  }

  Future<String> ordersettleProvider(String orderId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = "${Config.apiURL}${Config.orderSettlebyId}";
    var url = Uri.parse(ur);

    print('url is: $url');

    print(orderId);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode({'orderId': orderId}));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data['data'];
    } else {
      return 'failure';
    }
  }
}
