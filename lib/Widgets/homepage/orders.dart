// ignore: file_names
// ignore_for_file: implementation_imports, file_names, duplicate_ignore, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/order/orders.dart';
import '../../providers/providers.dart';
import 'orderItem.dart';

class OrderWidget extends ConsumerStatefulWidget {
  String status;
  OrderWidget({super.key, required this.status});

  @override
  _OrderWidgetState createState() => _OrderWidgetState(status: status);
}

class _OrderWidgetState extends ConsumerState<OrderWidget>
    with SingleTickerProviderStateMixin {
  String status;
  _OrderWidgetState({required this.status});

  late final AnimationController _animationController;

  bool islistempty = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget orderList(
      WidgetRef ref, BuildContext context, double scHeight, String status) {
    final data = ref.watch(fetchOrdersProvider(status));

    return data.when(
      data: (list) {
        if (list == null || list.isEmpty) islistempty = true;
        return orderlistbuilder(list, context, scHeight);
      },
      error: (_, __) => Center(child: const Text('Error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget orderlistbuilder(List<Orders> list, contex, scHeight) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final order = list[index];
        return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: _animationController,
              curve: Interval(index / list.length, 1.0, curve: Curves.easeOut),
            )),
            child: OrderItem(
              order: order,
              status: status,
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return orderList(ref, context, scHeight, status);
  }
}
