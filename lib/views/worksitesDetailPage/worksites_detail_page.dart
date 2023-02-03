import 'package:flutter/material.dart';

import './worksites_detail_page_app_bar.dart';
import './worksites_detail_page_body.dart';

class WorksitesDetailPage extends StatelessWidget {
  const WorksitesDetailPage({
    super.key,
    required this.id,
  });
  final int id;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WorksitesDetailPageAppBar(),
      body: WorksitesDetailPageBody(id: id),
      backgroundColor: Colors.white,
    );
  }
}
