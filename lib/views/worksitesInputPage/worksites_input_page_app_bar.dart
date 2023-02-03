import 'package:flutter/material.dart';

class WorksitesInputPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WorksitesInputPageAppBar({
    super.key,
    required this.id,
  });
  final int id;

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: id == 0 ? const Text('現場追加') :  const Text('現場情報編集') ,
    );
  }
}
