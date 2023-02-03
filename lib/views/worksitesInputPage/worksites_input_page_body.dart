import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../validators/required_validator.dart';
import '../../validators/max_length_validator.dart';
import '../../validators/datetime_format_validator.dart';
import '../../viewModels/worksites_detail_view_model.dart';
import '../../viewModels/worksites_input_view_model.dart';
import '../../viewModels/worksites_list_view_model.dart';

class WorksitesInputPageBody extends ConsumerWidget {
  const WorksitesInputPageBody({
    super.key,
    required this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final inputNotifier = ref.read(worksitesInputPageProvider(id).notifier);
    final inputState = ref.watch(worksitesInputPageProvider(id));

    TextEditingController name = TextEditingController(text: inputState.name);
    TextEditingController subName = TextEditingController(text: inputState.subName);
    TextEditingController type = TextEditingController(text: inputState.type);
    TextEditingController staffName = TextEditingController(text: inputState.staffName);
    TextEditingController address = TextEditingController(text: inputState.address);
    TextEditingController status = TextEditingController(text: inputState.status);
    DateFormat dateFormat = DateFormat('yyyy年MM月dd日');
    String startAtStr = dateFormat.format(inputState.startAt ?? DateTime.now());
    String endAtStr = dateFormat.format(inputState.endAt ?? DateTime.now());
    TextEditingController startAt = TextEditingController(text: inputState.startAt == null ? '' : startAtStr);
    TextEditingController endAt = TextEditingController(text: inputState.endAt == null ? '' : endAtStr);
    
    return SingleChildScrollView(
      child: Card(
        margin: const EdgeInsets.all(20),
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 現場名
                const SizedBox(
                  width: double.infinity,
                  child: Text('現場名', style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: name,
                    decoration: const InputDecoration(
                      hintText: '現場名称を入力してください',
                      hintStyle: TextStyle(color: Colors.black26),
                    ),
                    validator: (value) {
                      if (! RequiredValidator().variable(value)) {
                        return RequiredValidator().getMessage();
                      }
                      if (! MaxLengthValidator(255).variable(value)) {
                        return MaxLengthValidator(255).getMessage();
                      }
                      return null;
                    },
                  ),
                ),
                // 施工箇所
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 40),
                  child: const Text('施工箇所', style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: subName,
                    decoration: const InputDecoration(
                      hintText: '施工箇所を入力してください',
                      hintStyle: TextStyle(color: Colors.black26),
                    ),
                    validator: (value) {
                      if (! RequiredValidator().variable(value)) {
                        return RequiredValidator().getMessage();
                      }
                      if (! MaxLengthValidator(255).variable(value)) {
                        return MaxLengthValidator(255).getMessage();
                      }
                      return null;
                    },
                  ),
                ),
                // 種別
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 40),
                  child: const Text('種別', style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
                ),
                Column(
                  children: <Widget>[
                    FormBuilderRadioGroup<String>(
                      name: 'type',
                      initialValue: type.text,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: (String? value) {
                        type.text = value ?? '';
                      },
                      validator:(value) {
                        if (! RequiredValidator().variable(value)) {
                          return RequiredValidator().getMessage();
                        }
                        return null;
                      },
                      options: const [
                        FormBuilderFieldOption(
                          value: '1',
                          child: SizedBox(
                            width: double.infinity,
                            child: Text('新築'),
                          ),
                        ),
                        FormBuilderFieldOption(
                          value: '2',
                          child: SizedBox(
                            width: double.infinity,
                            child: Text('改築'),
                          ),
                        ),
                        FormBuilderFieldOption(
                          value: '3',
                          child: SizedBox(
                            width: double.infinity,
                            child: Text('その他'),
                          ),
                        ),
                      ]
                    ),
                  ],
                ),
                // 担当者
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 40),
                  child: const Text('担当', style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: staffName,
                    decoration: const InputDecoration(
                      hintText: '担当者を入力してください',
                      hintStyle: TextStyle(color: Colors.black26),
                    ),
                    onFieldSubmitted:(value) {
                      inputNotifier.setStateStaffName(value);
                    },
                    validator: (value) {
                      if (! RequiredValidator().variable(value)) {
                        return RequiredValidator().getMessage();
                      }
                      if (! MaxLengthValidator(255).variable(value)) {
                        return MaxLengthValidator(255).getMessage();
                      }
                      return null;
                    },
                  ),
                ),
                // 現場写真
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 40),
                  child: const Text('現場写真', style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: inputState.photo != ""
                    ? Image.memory(base64.decode(inputState.photo))
                    : const Text('写真が洗濯されていません', style: TextStyle(fontSize: 14), textAlign: TextAlign.left)
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(60, 60),
                      elevation: 5,
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(Icons.add_a_photo, color: Colors.white),
                    onPressed: () {
                      inputNotifier.getImageFromGallery();
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: FormBuilderTextField(
                    name: 'photo',
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    validator:(value) {
                      if (! RequiredValidator().variable(inputState.photo)) {
                        return RequiredValidator().getMessage();
                      }
                      return null;
                    },
                  ),
                ),
                // 住所
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 40),
                  child: const Text('住所', style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: address,
                    decoration: const InputDecoration(
                      hintText: '住所を入力してください',
                      hintStyle: TextStyle(color: Colors.black26),
                    ),
                    onFieldSubmitted: (value) {
                      inputNotifier.setStateAddress(value);
                    },
                    validator: (value) {
                      if (! RequiredValidator().variable(value)) {
                        return RequiredValidator().getMessage();
                      }
                      if (! MaxLengthValidator(255).variable(value)) {
                        return MaxLengthValidator(255).getMessage();
                      }
                      return null;
                    },
                  ),
                ),
                // ステータス
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 40),
                  child: const Text('ステータス', style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
                ),
                Column(
                  children: <Widget>[
                    FormBuilderRadioGroup<String>(
                      name: 'status',
                      initialValue: status.text,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: (String? value) {
                        status.text = value ?? '';
                      },
                      validator:(value) {
                        if (! RequiredValidator().variable(value)) {
                          return RequiredValidator().getMessage();
                        }
                        return null;
                      },
                      options: const [
                        FormBuilderFieldOption(
                          value: '1',
                          child: SizedBox(
                            width: double.infinity,
                            child: Text('未着手'),
                          ),
                        ),
                        FormBuilderFieldOption(
                          value: '2',
                          child: SizedBox(
                            width: double.infinity,
                            child: Text('進行中'),
                          ),
                        ),
                        FormBuilderFieldOption(
                          value: '3',
                          child: SizedBox(
                            width: double.infinity,
                            child: Text('保留'),
                          ),
                        ),
                        FormBuilderFieldOption(
                          value: '4',
                          child: SizedBox(
                            width: double.infinity,
                            child: Text('完了'),
                          ),
                        ),
                      ]
                    ),
                  ],
                ),
                // 開始日（予定日）
                Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: TextFormField(
                    controller: startAt,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: '開始日（予定日）',
                      hintText: '開始日（予定日）',
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.date_range),
                        onPressed: () async {
                          DateTime initDate = DateTime.now();
                          final newDate = await showDatePicker(
                            context: context,
                            initialDate: initDate,
                            firstDate: DateTime(DateTime.now().year - 2),
                            lastDate: DateTime(DateTime.now().year + 2)
                          );
                          if (newDate == null) return;
                          var dtFormat = DateFormat("yyyy年MM月dd日");
                          String strDate = dtFormat.format(newDate); 
                          startAt.text = strDate;
                        },
                      ),
                      suffixIcon: IconButton(
                        onPressed: () async {
                          DateTime initDate = DateTime.now();
                          final newDate = await showDatePicker(
                            context: context,
                            initialDate: initDate,
                            firstDate: DateTime(DateTime.now().year - 2),
                            lastDate: DateTime(DateTime.now().year + 2)
                          );
                          if (newDate == null) return;
                          var dtFormat = DateFormat("yyyy年MM月dd日");
                          String strDate = dtFormat.format(newDate); 
                          startAt.text = strDate;
                        },
                        icon: const Icon(Icons.arrow_drop_down)
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (! RequiredValidator().variable(value)) {
                        return RequiredValidator().getMessage();
                      }
                      if (! DatetimeFormatValidator().variable(value)) {
                        return DatetimeFormatValidator().getMessage();
                      }
                      return null;
                    },
                  ),
                ),
                // 終了日（予定日）
                Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: TextFormField(
                    controller: endAt,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: '終了日（予定日）',
                      hintText: '終了日（予定日）',
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.date_range),
                        onPressed: () async {
                          DateTime initDate = DateTime.now();
                          final newDate = await showDatePicker(
                            context: context,
                            initialDate: initDate,
                            firstDate: DateTime(DateTime.now().year - 2),
                            lastDate: DateTime(DateTime.now().year + 2)
                          );
                          if (newDate == null) return;
                          var dtFormat = DateFormat("yyyy年MM月dd日");
                          String strDate = dtFormat.format(newDate); 
                          endAt.text = strDate;
                        },
                      ),
                      suffixIcon: IconButton(
                        onPressed: () async {
                          DateTime initDate = DateTime.now();
                          final newDate = await showDatePicker(
                            context: context,
                            initialDate: initDate,
                            firstDate: DateTime(DateTime.now().year - 2),
                            lastDate: DateTime(DateTime.now().year + 2)
                          );
                          if (newDate == null) return;
                          var dtFormat = DateFormat("yyyy年MM月dd日");
                          String strDate = dtFormat.format(newDate); 
                          endAt.text = strDate;
                        },
                        icon: const Icon(Icons.arrow_drop_down)
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (! DatetimeFormatValidator().variable(value)) {
                        return DatetimeFormatValidator().getMessage();
                      }
                      return null;
                    },
                  ),
                ),
                // 保存ボタン
                Container(
                  padding: const EdgeInsets.all(30),
                  child: SizedBox(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          inputNotifier.setStateName(name.text);
                          inputNotifier.setStateSubName(subName.text);
                          inputNotifier.setStateType(type.text);
                          inputNotifier.setStateStaffName(staffName.text);
                          inputNotifier.setStateAddress(address.text);
                          inputNotifier.setStateStatus(status.text);
                          inputNotifier.setStateStartAt(startAt.text);
                          inputNotifier.setStateEndAt(endAt.text);
                          if (inputState.id == 0) {
                            await inputNotifier.add();
                            await ref.read(worksitesListViewModelProvider.notifier).refresh();
                          } else {
                            await inputNotifier.edit();
                            await ref.read(worksitesDetailPageProvider(inputState.id).notifier).get();
                            await ref.read(worksitesListViewModelProvider.notifier).refresh();
                          }
                          context.pop();
                        }
                      },
                      child: const Text('保存する', style: TextStyle(color: Colors.white)),
                    ),
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
