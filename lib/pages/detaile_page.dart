import 'package:flutter/material.dart';
import 'package:patterns_povider/models/post_model.dart';
import 'package:patterns_povider/view_models/view_model_detaile.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  static const String id = "/detail_page";
  Post? post;
  DetailPage({Key? key,this.post}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ViewModelDetail viewModelDetail = ViewModelDetail();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.post != null){
      viewModelDetail.titleController.text = widget.post!.title!;
      viewModelDetail.bodyController.text = widget.post!.body!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detaile Page"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              if(widget.post != null){
                viewModelDetail.apiEdit(viewModelDetail.titleController.text,viewModelDetail.bodyController.text,widget.post);
              }else{
                viewModelDetail.apiCreate(viewModelDetail.titleController.text,viewModelDetail.bodyController.text,widget.post);
              }
              Navigator.of(context).pop(true);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (context) => viewModelDetail,
        child: Consumer<ViewModelDetail>(
          builder: (ctx,model,child){
            return Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(
                    controller: viewModelDetail.titleController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Title",
                    ),
                  ),
                  TextFormField(
                    controller: viewModelDetail.bodyController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Body",
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ),
    );
  }
}
