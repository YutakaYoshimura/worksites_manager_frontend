import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/worksites_model.dart';

class WorksitesItem extends HookConsumerWidget {
  const WorksitesItem({
    super.key,
    required this.worksites,
  });

  final WorksitesModel worksites;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        context.go("/worksites_detail", extra: worksites.id);
      },
      child: Card(
        margin: const EdgeInsets.all(5.0),
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 80, height: 60, child: Image.memory(base64.decode(worksites.photo))),
              Container(
                width: 300,
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(worksites.name, style: const TextStyle(fontSize: 16), textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(worksites.staffName, style: TextStyle(color: Colors.grey[700]), textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text('${worksites.createdAt?.year}年${worksites.createdAt?.month}月${worksites.createdAt?.day}日', style: TextStyle(color: Colors.grey[700]), textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
