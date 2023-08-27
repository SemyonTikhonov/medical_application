import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class ToothProductsState extends Equatable {
  final product;

  static var defaultProduct;

  const ToothProductsState._(this.product, {required this.isLoading});
  ToothProductsState.initial()
      : isLoading = true,
        product = defaultProduct;

  final bool isLoading;
  ToothProductsState copyWith({bool? isLoading}) =>
      ToothProductsState._(product, isLoading: isLoading ?? this.isLoading);

  @override
  List<Object?> get props => [product];
}

class ToothProductsCubit extends Cubit<ToothProductsState> {
  ToothProductsCubit() : super(ToothProductsState.initial());
  void displayLoading() {
    emit(state.copyWith(isLoading: true));
  }

  void hideLoading() {
    emit(state.copyWith(isLoading: false));
  }
}

void loadProducts() {
  // Метод загрузки товаров из API или другого источника данных

  List<String> products = [
    '',
    '', // наименование товаров писать здесь
  ];
}

@override
Stream<ToothProductsState> mapToState(ToothProductsState products) async* {
  if (products is ToothProductsState) {
    loadProducts();
  }
}
