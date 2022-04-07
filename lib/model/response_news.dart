class ResponseNews {
  bool? isSuccess;
  String? message;
  int? totalPage;
  int? totalData;
  List<Data>? data;
  String? error;

  ResponseNews(
      {this.isSuccess,
        this.message,
        this.totalPage,
        this.totalData,
        this.data,
        this.error});

  ResponseNews.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    totalPage = json['totalPage'];
    totalData = json['totalData'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  factory ResponseNews.withError(String error) => ResponseNews(error: error);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    data['totalPage'] = this.totalPage;
    data['totalData'] = this.totalData;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? newsId;
  String? newsTitle;
  String? author;
  String? newsDate;
  String? newsImage;
  Null? languageId;
  String? rowStatus;

  Data(
      {this.newsId,
        this.newsTitle,
        this.author,
        this.newsDate,
        this.newsImage,
        this.languageId,
        this.rowStatus});

  Data.fromJson(Map<String, dynamic> json) {
    newsId = json['news_id'];
    newsTitle = json['news_title'];
    author = json['author'];
    newsDate = json['news_date'];
    newsImage = json['news_image'];
    languageId = json['language_id'];
    rowStatus = json['row_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news_id'] = this.newsId;
    data['news_title'] = this.newsTitle;
    data['author'] = this.author;
    data['news_date'] = this.newsDate;
    data['news_image'] = this.newsImage;
    data['language_id'] = this.languageId;
    data['row_status'] = this.rowStatus;
    return data;
  }
}
