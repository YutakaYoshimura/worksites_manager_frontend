import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:worksites_manager/viewModels/worksites_detail_view_model.dart';
import 'package:worksites_manager/views/worksitesDetailPage/component/delete_alert_dialog.dart';

import '../../models/worksites_model.dart';
import '../../viewModels/worksites_list_view_model.dart';
import '../../enums/type_enum.dart';
import '../../enums/status_enum.dart';

class WorksitesDetailPageBody extends HookConsumerWidget {
  const WorksitesDetailPageBody({
    super.key,
    required this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailNotifier = ref.read(worksitesDetailPageProvider(id).notifier);
    final detailState = ref.watch(worksitesDetailPageProvider(id));
    
    if (detailState.errorFlg) {
      return Container(
        child: Center(
          child: Text(detailState.errorMsg, style: TextStyle(fontSize: 30)),
        ),
      );
    }
    return SingleChildScrollView(
      reverse: true,
      child: Card(
        margin: const EdgeInsets.all(20),
        elevation: 3,
        child:  Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 現場名
                const SizedBox(
                  width: double.infinity,
                  child: Text('現場名称：', style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(detailState.worksites!.name , style: const TextStyle(fontSize: 20), textAlign: TextAlign.left),
                ),
                // 施工箇所
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 10),
                  child: const Text('施工箇所：', style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(detailState.worksites!.subName, style: const TextStyle(fontSize: 20), textAlign: TextAlign.left),
                ),
                // 種別
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 10),
                  child: const Text('種別：', style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text('${detailState.worksites!.type}:${typeInfoList[detailState.worksites!.type]}', style: const TextStyle(fontSize: 20), textAlign: TextAlign.left),
                ),
                // 担当者
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 10),
                  child: const Text('担当者：', style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(detailState.worksites!.staffName, style: const TextStyle(fontSize: 20), textAlign: TextAlign.left),
                ),
                // 現場写真
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 10),
                  child: const Text('現場写真：', style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: detailState.worksites!.photo == ""
                    ? const Text('読み込み中です', style: TextStyle(fontSize: 14), textAlign: TextAlign.left)
                    : Image.memory(base64.decode(detailState.worksites!.photo)),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 10),
                  child: const Text('住所：', style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(detailState.worksites!.address, style: const TextStyle(fontSize: 20), textAlign: TextAlign.left),
                ),
                // ステータス
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 10),
                  child: const Text('ステータス：', style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text('${detailState.worksites!.status}：${statusInfoList[detailState.worksites!.status]}', style: TextStyle(fontSize: 20), textAlign: TextAlign.left),
                ),
                // 開始日（予定日）
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 10),
                  child: const Text('開始日：', style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text('${detailState.worksites!.startAt?.year}-${detailState.worksites!.startAt?.month}-${detailState.worksites!.startAt?.day}', style: const TextStyle(fontSize: 20), textAlign: TextAlign.left),
                ),
                // 終了日（予定日）
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 10),
                  child: const Text('終了日：', style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
                ),
                SizedBox(
                  width: double.infinity,
                  child: detailState.worksites!.endAt != null
                    ? Text('${detailState.worksites!.endAt?.year}-${detailState.worksites!.endAt?.month}-${detailState.worksites!.endAt?.day}', style: const TextStyle(fontSize: 20), textAlign: TextAlign.left)
                    : const Text('未定', style: TextStyle(fontSize: 20), textAlign: TextAlign.left)
                ),
                // 保存ボタン
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 30, left: 15, bottom: 20),
                  child: Row(
                    children: [
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            context.go('/worksites_detail/worksites_edit', extra: detailState.worksites!.id);
                          },
                          child: const Text('編集する', style: TextStyle(color: Colors.white)),
                        )
                      ),
                      Container(padding: const EdgeInsets.only(left: 15),),
                      SizedBox(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey
                          ),
                          onPressed: () async {
                            //final bool? delflg = false;
                            final bool? delflg = await showDialog<bool>(
                              context: context,
                              builder: (_) {
                                return const DeleteAlertDialog();
                              }
                            );
                            if (delflg!) {
                              await detailNotifier.del();
                              await ref.read(worksitesListViewModelProvider.notifier).refresh();
                              context.pop();
                            }
                          },
                          child: const Text('削除する'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
