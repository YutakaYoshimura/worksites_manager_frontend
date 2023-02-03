import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './worksites_list_page_list.dart';
import '../../viewModels/worksites_list_view_model.dart';
import '../../models/worksites_model.dart';

class WorksitesListPageBody extends HookConsumerWidget {
  const WorksitesListPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // AsyncValueの変更を監視
    final AsyncValue<List<WorksitesModel>> asyncValue = ref.watch(worksitesListViewModelProvider);
    
    return NotificationListener<ScrollEndNotification>(
      child: Scrollbar(
        child: CustomScrollView(
          restorationId: 'worksitess',
          slivers: <Widget>[
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                ref.read(worksitesListViewModelProvider.notifier).refresh();
              },
            ),
            asyncValue.when(
              // データ取得完了
              data: (data) {
                return WorksitesList(data: data);
              },
              // エラー発生
              error: ((error, stackTrace) {
                // 取得済みのデータがあるならデータ表示
                if (asyncValue.hasValue) {
                  return WorksitesList(data: asyncValue.value ?? []);
                }

                return const SliverPadding(
                  padding: EdgeInsets.all(24.0),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: Text('エラーが発生しました'),
                    ),
                  ),
                );
              }),
              // 初回ローディング
              loading: () {
                return const SliverPadding(
                  padding: EdgeInsets.all(24.0),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      onNotification: (notification) {
        // 一番下までスクロールしたとき
        if (notification.metrics.extentAfter == 0) {
          // 追加でローディング
          ref.read(worksitesListViewModelProvider.notifier).refresh();
          return true;
        }

        return false;
      },
    );
  }
}
