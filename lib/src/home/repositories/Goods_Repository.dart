import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// События Cubit
abstract class GoodsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadGoodsEvent extends GoodsEvent {}

class AddToCartEvent extends GoodsEvent {
  final GoodItem item;
  AddToCartEvent(this.item);

  @override
  List<Object> get props => [item];
}

// Состояния Cubit
enum GoodsStatus {
  loading,
  success,
  error,
  addToCart,
}

class GoodsState extends Equatable {
  final List<GoodItem> goodsList;
  final GoodsStatus status;
  final String error;

  GoodsState(
      {this.goodsList = const [],
      this.status = GoodsStatus.loading,
      this.error = ''});

  GoodsState copyWith({
    required List<GoodItem> goodsList,
    required GoodsStatus status,
    required String error,
  }) {
    return GoodsState(
      goodsList: goodsList ?? this.goodsList,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [goodsList, status, error];
}

// Класс Cubit
class GoodsModel extends Cubit<GoodsState> {
  GoodsModel() : super(GoodsState());

  Future<void> loadGoods() async {
    try {
      // Загрузка данных о товарах из API или другого источника
      List<GoodItem> goodsList = await _fetchGoods();

      // Обновление состояния
      emit(state.copyWith(
          goodsList: goodsList, status: GoodsStatus.success, error: ''));
    } catch (error) {
      // Обработка ошибки
      emit(state.copyWith(
          status: GoodsStatus.error, error: error.toString(), goodsList: []));
    }
  }

  Future<void> addToCart(GoodItem item) async {
    // Добавление товара в корзину
    // Можно использовать реализацию с базой данных или сохранением данных на сервере

    // Допустим, у нас есть поле в состоянии, представляющее корзину
    List<GoodItem> cartItems =
        state.goodsList.where((good) => good.isInCart).toList();
    cartItems.add(item);

    // Обновление состояния
    emit(state.copyWith(
      goodsList: state.goodsList.map((good) {
        if (good.id == item.id) {
          return good.copyWith(isInCart: true);
        }
        return good;
      }).toList(),
      status: GoodsStatus.addToCart,
      error: '',
    ));
  }

  Future<List<GoodItem>> _fetchGoods() async {
    // Пример загрузки данных из API

    // Вернуть список товаров
    return [
      GoodItem(id: 1, name: "Товар 1", price: 10, isInCart: false),
      GoodItem(id: 2, name: "Товар 2", price: 20, isInCart: false),
      GoodItem(id: 3, name: "Товар 3", price: 30, isInCart: false),
    ];
  }
}

// Модель товара
class GoodItem extends Equatable {
  final int id;
  final String name;
  final double price;
  final bool isInCart;

  GoodItem({
    required this.id,
    required this.name,
    required this.price,
    required this.isInCart,
  });

  GoodItem copyWith({
    int? id,
    String? name,
    double? price,
    bool? isInCart,
  }) {
    return GoodItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      isInCart: isInCart ?? this.isInCart,
    );
  }

  @override
  List<Object?> get props => [id, name, price, isInCart];
}
