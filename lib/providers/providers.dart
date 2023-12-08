import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/order/orders.dart';
import '../services/auth_api_service.dart';
import '../services/order_cart_api_service.dart';

final loginProvider =
    FutureProvider.autoDispose.family<String, Map<String, String>>(
  (ref, mp) {
    final apiRespository = ref.watch(authApiService);

    return apiRespository.login(mp);
  },
);

final fetchOrdersProvider =
    FutureProvider.autoDispose.family<List<Orders>, String>(
  (ref, status) {
    final apiRespository = ref.watch(ordercartApiService);

    return apiRespository.fetchOrdersByStatus(status);
  },
);

final orderdetailProvider = FutureProvider.autoDispose.family<Orders, String>(
  (ref, orderId) {
    final apiRespository = ref.watch(ordercartApiService);

    return apiRespository.orderdetailProvider(orderId);
  },
);

final orderApproveProvider = Provider.autoDispose.family<Future<String>, String>(
  (ref, orderId)  async{
    final apiRespository = ref.watch(ordercartApiService);

    String result = await apiRespository.orderapproveProvider(orderId);

    return result;
    // return await apiRespository.orderapproveProvider(orderId);
  },
);

final orderSettleProvider = Provider.autoDispose.family<Future<String>, String>(
  (ref, orderId)  async{
    final apiRespository = ref.watch(ordercartApiService);

    String result = await apiRespository.ordersettleProvider(orderId);

    return result;
    // return await apiRespository.orderapproveProvider(orderId);
  },
);
