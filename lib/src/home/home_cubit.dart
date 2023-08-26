import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class HomeScreenState extends Equatable {
  final List<String> products;

  const HomeScreenState({required this.products});

  HomeScreenState copyWith({List<String>? products}) {
    return HomeScreenState(products: products ?? this.products);
  }

  @override
  List<Object> get props => [products];
}

// Создаем Cubit для экрана HomeScreen
class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(const HomeScreenState(products: []));

  // Определяем метод для обновления списка товаров
  void updateProducts(List<String> newProducts) {
    emit(state.copyWith(products: newProducts));
  }
}
