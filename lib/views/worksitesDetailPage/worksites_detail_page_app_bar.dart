import 'package:flutter/material.dart';

class WorksitesDetailPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WorksitesDetailPageAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        '現場情報詳細',
      ),
    );
  }
}
