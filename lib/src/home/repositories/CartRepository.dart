import 'package:flutter_bloc/flutter_bloc.dart';

class GoodsCubit extends Cubit<List<GoodsModel>> {
  final GoodsRepository goodsRepository;

  GoodsCubit({required this.goodsRepository}) : super([]);

  Future<void> getGoods() async {
    try {
      final goods = await goodsRepository.fetchGoods();
      emit(goods);
    } catch (e) {
      // Обработка ошибок
    }
  }
}
