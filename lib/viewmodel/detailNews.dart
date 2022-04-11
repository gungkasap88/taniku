import 'package:flutter/material.dart';

class detailNews extends StatefulWidget {
  final String newsImage;
  final String newsTitle;
  final String newsDate;
  const detailNews({Key? key, required this.newsImage,required this.newsTitle,required this.newsDate}) : super(key: key);

  @override
  State<detailNews> createState() => _detailNewsState();
}

class _detailNewsState extends State<detailNews> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail News"),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child:
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.newsTitle.toString(), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(widget.newsDate.toString()),
              SizedBox(height: 10),
              Image.network(widget.newsImage.toString()),
              SizedBox(height: 10),
              Text("What is Lorem Ipsum?", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                    text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",

                    style: TextStyle(
                      color: Colors.grey[600],
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}