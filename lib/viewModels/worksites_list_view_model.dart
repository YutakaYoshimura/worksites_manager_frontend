import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/worksites_model.dart';
import '../repositories/worksites_repository.dart';

final worksitesListViewModelProvider = StateNotifierProvider<WorksitesListViewModel, AsyncValue<List<WorksitesModel>>>(
  (ref) => WorksitesListViewModel(
    WorksitesRepository(),
  ),
);

class WorksitesListViewModel extends StateNotifier<AsyncValue<List<WorksitesModel>>> {
  WorksitesListViewModel(this._worksitesRepository)
       : super(const AsyncLoading<List<WorksitesModel>>()) {
    getAll();
  }
  final WorksitesRepository _worksitesRepository;

  Future<void> getAll({bool isLoadMore = false}) async {
    try{
      final data = await _worksitesRepository.getAll();
      state = AsyncData([...data]);
    } catch (error, stacktrace) {
      state = AsyncError(error, stacktrace);
    }
  }

  Future<void> add({bool isLoadMore = false}) async {
    // try{
    //   final data = await _worksitesRepository.add(worksites);
    //   state = AsyncData([
    //     if (isLoadMore) ...state.value ?? [], ...data
    //   ]);
    // } catch (error, stacktrace) {
    //   state = AsyncError(error, stacktrace);
    // }
  }

  void loadMore() {
    // ローディング中にローディングしないようにする
    if (state == const AsyncLoading<List<WorksitesModel>>().copyWithPrevious(state)) {
      return;
    }

    // 取得済みのデータを保持しならが状態をローディング中にする
    state = const AsyncLoading<List<WorksitesModel>>().copyWithPrevious(state);
    getAll(isLoadMore: true);
  }

  Future<void> refresh() async {
    // 取得済みのデータを保持しならが状態をローディング中にする
    state = const AsyncLoading<List<WorksitesModel>>().copyWithPrevious(state);
    await getAll(isLoadMore: true);
  }
}
