import 'package:flutter/foundation.dart';
import 'package:patterns_povider/models/post_model.dart';
import 'package:patterns_povider/services/http_service.dart';

class ViewModelDetail extends ChangeNotifier{
  void apiEdit(String title,String body, Post? post){
    if(post != null){
      Post post2 = Post(id: post.id,title: title,body: body,userId: post.userId);
      Network.PUT(Network.API_UPDATE+post2.id.toString(), Network.paramsUpdate(post)).then((value){
      });
    }
  }

  void apiCreate(String title,String body, Post? post){
    if(post != null){
      Post post = Post(title: title,body: body,userId: title.hashCode);
      Network.POST(Network.API_CREATE.toString(), Network.paramsCreate(post)).then((value){
      });
    }
  }
}