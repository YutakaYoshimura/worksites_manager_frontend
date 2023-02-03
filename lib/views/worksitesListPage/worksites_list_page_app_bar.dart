import 'package:flutter/material.dart';

class WorksitesListPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WorksitesListPageAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        '現場情報一覧',
      ),
    );
  }
}
