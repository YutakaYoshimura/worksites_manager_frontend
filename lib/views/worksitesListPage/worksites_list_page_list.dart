import 'package:flutter/material.dart';

import './worksites_list_page_item.dart';
import '../../models/worksites_model.dart';

class WorksitesList extends StatelessWidget {
  const WorksitesList({
    super.key,
    required this.data,
  });

  final List<WorksitesModel> data;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return WorksitesItem(worksites: data[index]);
        },
        childCount: data.length,
      ),
    );
  }
}
