import 'package:flutter/material.dart';
import 'package:patterns_povider/pages/detaile_page.dart';
import 'package:patterns_povider/view_models/view_model_home.dart';
import 'package:patterns_povider/views/item_of_home.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ViewModelHome viewModelHome = ViewModelHome();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModelHome.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pattern Provider"),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => viewModelHome,
        child: Consumer<ViewModelHome>(
          builder: (ctx, model, child) => Container(
              margin: EdgeInsets.all(10),
              child: Stack(
                children: [
                  !viewModelHome.isLoading
                      ? ListView.builder(
                          itemCount: viewModelHome.listPost.length,
                          itemBuilder: (context, index) {
                            return itemOfPost(index,viewModelHome);
                          })
                      : SizedBox.shrink(),
                  viewModelHome.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox.shrink(),
                ],
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.of(context).pushNamed(DetailPage.id);
          if (result == true) {
            viewModelHome.apiPostList();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

}
