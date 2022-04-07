import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/home_viewmodel.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(context),
      child: Builder(
        builder: (context){
          return Consumer<HomeViewModel>(
              builder: (context, viewModel, child){
                return Scaffold(
                    resizeToAvoidBottomInset: false,
                    appBar: AppBar(
                      title: Text("List Kebun"),
                    ),
                    body: SafeArea(
                      //margin: const EdgeInsets.all(16),
                      child: ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.all(25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                //-------------------- ListView Vertical ---------------------
                                const Text("News Horizontal", style: TextStyle(fontWeight: FontWeight.bold),),
                                const SizedBox(height: 16,),
                                SizedBox(
                                    width: double.infinity,
                                    height: 180,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: viewModel.getNews.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {},
                                          child: Container(
                                              width: 300,
                                              alignment: Alignment.center,
                                              child: Card(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: double.infinity,
                                                  margin: const EdgeInsets.all(12),
                                                  child: Column(
                                                    children: [
                                                      Image.network(viewModel.getNews[index].newsImage.toString(), width: 70, height: 70,),
                                                      const SizedBox(height: 16,),
                                                      Text(viewModel.getNews[index].newsTitle.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                      const SizedBox(height: 8,),
                                                      Text(viewModel.getNews[index].newsDate.toString()),
                                                    ],
                                                  ),
                                                ),
                                              )
                                          ),
                                        );
                                      },
                                    )
                                ),
                                SizedBox(height: 15,),
                                const Text("News Vertical", style: TextStyle(fontWeight: FontWeight.bold),),
                                const SizedBox(height: 15,),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: viewModel.getNews.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: Container(
                                        margin: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            Image.network(viewModel.getNews[index].newsImage.toString(), width: 70, height: 70,),
                                            const SizedBox(width: 12,),
                                            Text(viewModel.getNews[index].newsTitle.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                            const SizedBox(height: 8,),
                                            Text(viewModel.getNews[index].newsDate.toString())
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                );
              });
        },
      ),
    );
  }
}
