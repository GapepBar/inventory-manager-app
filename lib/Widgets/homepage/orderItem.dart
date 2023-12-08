// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import '../../models/order/orders.dart';

class OrderItem extends StatelessWidget {
  Orders order;
  String status;
  OrderItem({super.key, required this.order, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ListTile(
        onTap: () {
          if (status == 'requested') {
            Navigator.of(context).pushNamed('/orderApproveScreen',
                arguments: {'orderId': order.orderId, 'status': status});
          } else {
            Navigator.of(context).pushNamed('/orderSettleScreen',
                arguments: {'orderId': order.orderId, 'status': status});
          }
        },
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: Colors.grey[200],
          child: const ClipOval(
              child: Image(
                  image: CachedNetworkImageProvider(
                      'https://img.freepik.com/free-vector/delivery-service-illustrated_23-2148505081.jpg?w=2000'),
                  fit: BoxFit.contain)),
        ),
        title: Text('Order Id: ${order.orderId.toUpperCase()}'),
        subtitle: Container(
          margin: const EdgeInsets.only(top: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMd().format(order.date),
                style: const TextStyle(fontSize: 11),
              ),
            ],
          ),
        ),
        trailing: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.navigate_next),
          ],
        ),
        tileColor: Colors.white,
        minVerticalPadding: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
