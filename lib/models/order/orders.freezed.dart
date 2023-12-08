// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Orders _$OrdersFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Orders {
  String get orderId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get orderStatus => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get productsItem =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get billedItems =>
      throw _privateConstructorUsedError;
  double get bill => throw _privateConstructorUsedError;
  double get deliveryCharges => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrdersCopyWith<Orders> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersCopyWith<$Res> {
  factory $OrdersCopyWith(Orders value, $Res Function(Orders) then) =
      _$OrdersCopyWithImpl<$Res, Orders>;
  @useResult
  $Res call(
      {String orderId,
      DateTime date,
      String orderStatus,
      List<Map<String, dynamic>> productsItem,
      List<Map<String, dynamic>> billedItems,
      double bill,
      double deliveryCharges});
}

/// @nodoc
class _$OrdersCopyWithImpl<$Res, $Val extends Orders>
    implements $OrdersCopyWith<$Res> {
  _$OrdersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? date = null,
    Object? orderStatus = null,
    Object? productsItem = null,
    Object? billedItems = null,
    Object? bill = null,
    Object? deliveryCharges = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      productsItem: null == productsItem
          ? _value.productsItem
          : productsItem // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      billedItems: null == billedItems
          ? _value.billedItems
          : billedItems // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      bill: null == bill
          ? _value.bill
          : bill // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryCharges: null == deliveryCharges
          ? _value.deliveryCharges
          : deliveryCharges // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrdersCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      DateTime date,
      String orderStatus,
      List<Map<String, dynamic>> productsItem,
      List<Map<String, dynamic>> billedItems,
      double bill,
      double deliveryCharges});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrdersCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? date = null,
    Object? orderStatus = null,
    Object? productsItem = null,
    Object? billedItems = null,
    Object? bill = null,
    Object? deliveryCharges = null,
  }) {
    return _then(_$OrderImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      productsItem: null == productsItem
          ? _value._productsItem
          : productsItem // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      billedItems: null == billedItems
          ? _value._billedItems
          : billedItems // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      bill: null == bill
          ? _value.bill
          : bill // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryCharges: null == deliveryCharges
          ? _value.deliveryCharges
          : deliveryCharges // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  _$OrderImpl(
      {required this.orderId,
      required this.date,
      required this.orderStatus,
      required final List<Map<String, dynamic>> productsItem,
      required final List<Map<String, dynamic>> billedItems,
      required this.bill,
      required this.deliveryCharges})
      : _productsItem = productsItem,
        _billedItems = billedItems;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final String orderId;
  @override
  final DateTime date;
  @override
  final String orderStatus;
  final List<Map<String, dynamic>> _productsItem;
  @override
  List<Map<String, dynamic>> get productsItem {
    if (_productsItem is EqualUnmodifiableListView) return _productsItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsItem);
  }

  final List<Map<String, dynamic>> _billedItems;
  @override
  List<Map<String, dynamic>> get billedItems {
    if (_billedItems is EqualUnmodifiableListView) return _billedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_billedItems);
  }

  @override
  final double bill;
  @override
  final double deliveryCharges;

  @override
  String toString() {
    return 'Orders(orderId: $orderId, date: $date, orderStatus: $orderStatus, productsItem: $productsItem, billedItems: $billedItems, bill: $bill, deliveryCharges: $deliveryCharges)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            const DeepCollectionEquality()
                .equals(other._productsItem, _productsItem) &&
            const DeepCollectionEquality()
                .equals(other._billedItems, _billedItems) &&
            (identical(other.bill, bill) || other.bill == bill) &&
            (identical(other.deliveryCharges, deliveryCharges) ||
                other.deliveryCharges == deliveryCharges));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderId,
      date,
      orderStatus,
      const DeepCollectionEquality().hash(_productsItem),
      const DeepCollectionEquality().hash(_billedItems),
      bill,
      deliveryCharges);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Orders {
  factory _Order(
      {required final String orderId,
      required final DateTime date,
      required final String orderStatus,
      required final List<Map<String, dynamic>> productsItem,
      required final List<Map<String, dynamic>> billedItems,
      required final double bill,
      required final double deliveryCharges}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  String get orderId;
  @override
  DateTime get date;
  @override
  String get orderStatus;
  @override
  List<Map<String, dynamic>> get productsItem;
  @override
  List<Map<String, dynamic>> get billedItems;
  @override
  double get bill;
  @override
  double get deliveryCharges;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
