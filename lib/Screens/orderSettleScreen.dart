// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/order/orders.dart';
import '../providers/providers.dart';

class OrderSettleScreen extends ConsumerWidget {
  OrderSettleScreen({super.key});

  Widget orderSummary(WidgetRef ref, BuildContext context, String orderId) {
    final data = ref.watch(orderdetailProvider(orderId));

    return data.when(
      data: (order) {
        return orderDetail(order);
      },
      error: (_, __) => Center(child: const Text('Error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget orderDetail(Orders order) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* ------------------------- Order Summary Container ------------------------ */
          /* -------------------------------------------------------------------------- */
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                boxShadow: const [BoxShadow(blurRadius: 1, spreadRadius: 0)],
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Requested Products",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.symmetric(vertical: 8),
                  child: Text(
                    "${order.productsItem.length} items in this order",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),

                /* --------------------------- List tile for item --------------------------- */
                Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            child: Image.network(
                                order.productsItem[i]['product']['imageUrl']),
                          ),
                          title:
                              Text(order.productsItem[i]['product']['name']),
                          subtitle: Text(
                              "${order.productsItem[i]['quantity'].toString()} ${order.productsItem[i]['product']['quantityType'].toString()}"),
                        );
                      },
                      itemCount: order.productsItem.length,
                    ),
                  ],
                ),
              ],
            ),
          ),
          /* ----------------------------- Upper container ---------------------------- */
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                boxShadow: const [BoxShadow(blurRadius: 1, spreadRadius: 0)],
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Billed Products",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.symmetric(vertical: 8),
                  child: Text(
                    "${order.billedItems.length} items in this order",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),

                /* --------------------------- List tile for item --------------------------- */
                Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            child: Image.network(
                                order.billedItems[i]['product']['imageUrl']),
                          ),
                          title:
                              Text(order.billedItems[i]['product']['name']),
                          subtitle: Text(
                              "${order.billedItems[i]['quantity'].toString()} ${order.billedItems[i]['product']['quantityType'].toString()}"),
                          trailing: Text(
                              "₹${order.billedItems[i]['price'].toString()}"),
                        );
                      },
                      itemCount: order.billedItems.length,
                    ),
                  ],
                ),
              ],
            ),
          ),
          /* ----------------------------- Upper container ---------------------------- */
          SizedBox(height: 20),
          /* ----------------------- Container For Bill Details ----------------------- */
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                boxShadow: const [BoxShadow(blurRadius: 1, spreadRadius: 0)],
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bill Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("MRP"),
                    Text("₹${order.bill}"),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery Charges"),
                    Text("₹${order.deliveryCharges}"),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bill Total",
                      style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₹${order.bill + order.deliveryCharges}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20),

          /* ----------------------- Container For Order Details ---------------------- */
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                boxShadow: const [BoxShadow(blurRadius: 1, spreadRadius: 0)],
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Divider(
                  thickness: 1,
                  color: Color.fromARGB(255, 241, 237, 237),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order id",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 137, 137, 137)),
                    ),
                    Text("${order.orderId}"),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order placed",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 137, 137, 137)),
                    ),
                    Text(
                        "Placed on ${DateFormat('yyyy-MM-dd').format(order.date)} at ${DateFormat('hh:mm:ss').format(order.date)}"),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Status",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 137, 137, 137)),
                    ),
                    Text(
                      order.orderStatus,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: order.orderStatus == 'Ordered'
                              ? Color.fromARGB(255, 127, 118, 39)
                              : order.orderStatus == 'Delivered'
                                  ? Colors.green
                                  : Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var orderData = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    String orderId = orderData['orderId'];
    String status = orderData['status'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Settle Order'),
      ),
      body: SingleChildScrollView(child: orderSummary(ref, context, orderId)),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          String msg = await ref.watch(orderSettleProvider(orderId));

          if (msg == 'success') {
            Navigator.of(context).pushNamed('/orderSuccessScreen',
                arguments: {'type': 'settled'});
          } else {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Some Error Occured')));
          }
        },
        child: Container(
          height: 60,
          alignment: Alignment(0, 0),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Text(
            'Settle Order',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
