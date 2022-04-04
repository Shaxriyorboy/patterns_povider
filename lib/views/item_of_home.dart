import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patterns_povider/pages/detaile_page.dart';

import '../view_models/view_model_home.dart';

Widget itemOfPost(int index,ViewModelHome viewModelHome) {
  return Slidable(
    child: ListTile(
      title: Text(viewModelHome.listPost[index].title!),
      subtitle: Text(viewModelHome.listPost[index].body!),
    ),
    endActionPane: ActionPane(
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {
            int _id = viewModelHome.listPost[index].id!;
            viewModelHome.apiDelete(_id);
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
    ),
    startActionPane: ActionPane(
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) async {
            var result = await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return DetailPage(
                post: viewModelHome.listPost[index],
              );
            }));
            if (result) {
              viewModelHome.apiPostList();
            }
          },
          backgroundColor: Color(0xFF0392CF),
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edit',
        ),
      ],
    ),
  );
}