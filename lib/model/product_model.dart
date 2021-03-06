// To parse this JSON data, do
//
//     final productData = productDataFromJson(jsonString);

import 'dart:convert';

ProductData productDataFromJson(String str) => ProductData.fromJson(json.decode(str));

String productDataToJson(ProductData data) => json.encode(data.toJson());

class ProductData {
  ProductDataData data;
  int errorCode;
  String errorMsg;

  ProductData({
    this.data,
    this.errorCode,
    this.errorMsg,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    data: ProductDataData.fromJson(json["data"]),
    errorCode: json["errorCode"],
    errorMsg: json["errorMsg"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "errorCode": errorCode,
    "errorMsg": errorMsg,
  };
}

class ProductDataData {
  int curPage;
  List<DataProductElement> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  ProductDataData({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  factory ProductDataData.fromJson(Map<String, dynamic> json) => ProductDataData(
    curPage: json["curPage"],
    datas: List<DataProductElement>.from(json["datas"].map((x) => DataProductElement.fromJson(x))),
    offset: json["offset"],
    over: json["over"],
    pageCount: json["pageCount"],
    size: json["size"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "curPage": curPage,
    "datas": List<dynamic>.from(datas.map((x) => x.toJson())),
    "offset": offset,
    "over": over,
    "pageCount": pageCount,
    "size": size,
    "total": total,
  };
}

class DataProductElement {
  String apkLink;
  int audit;
  String author;
  bool canEdit;
  int chapterId;
  ChapterName chapterName;
  bool collect;
  int courseId;
  String desc;
  String descMd;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  String niceDate;
  String niceShareDate;
  String origin;
  String prefix;
  String projectLink;
  int publishTime;
  int selfVisible;
  int shareDate;
  String shareUser;
  int superChapterId;
  SuperChapterName superChapterName;
  List<Tag> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  DataProductElement({
    this.apkLink,
    this.audit,
    this.author,
    this.canEdit,
    this.chapterId,
    this.chapterName,
    this.collect,
    this.courseId,
    this.desc,
    this.descMd,
    this.envelopePic,
    this.fresh,
    this.id,
    this.link,
    this.niceDate,
    this.niceShareDate,
    this.origin,
    this.prefix,
    this.projectLink,
    this.publishTime,
    this.selfVisible,
    this.shareDate,
    this.shareUser,
    this.superChapterId,
    this.superChapterName,
    this.tags,
    this.title,
    this.type,
    this.userId,
    this.visible,
    this.zan,
  });

  factory DataProductElement.fromJson(Map<String, dynamic> json) => DataProductElement(
    apkLink: json["apkLink"],
    audit: json["audit"],
    author: json["author"],
    canEdit: json["canEdit"],
    chapterId: json["chapterId"],
    chapterName: chapterNameValues.map[json["chapterName"]],
    collect: json["collect"],
    courseId: json["courseId"],
    desc: json["desc"],
    descMd: json["descMd"],
    envelopePic: json["envelopePic"],
    fresh: json["fresh"],
    id: json["id"],
    link: json["link"],
    niceDate: json["niceDate"],
    niceShareDate: json["niceShareDate"],
    origin: json["origin"],
    prefix: json["prefix"],
    projectLink: json["projectLink"],
    publishTime: json["publishTime"],
    selfVisible: json["selfVisible"],
    shareDate: json["shareDate"] == null ? null : json["shareDate"],
    shareUser: json["shareUser"],
    superChapterId: json["superChapterId"],
    superChapterName: superChapterNameValues.map[json["superChapterName"]],
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    title: json["title"],
    type: json["type"],
    userId: json["userId"],
    visible: json["visible"],
    zan: json["zan"],
  );

  Map<String, dynamic> toJson() => {
    "apkLink": apkLink,
    "audit": audit,
    "author": author,
    "canEdit": canEdit,
    "chapterId": chapterId,
    "chapterName": chapterNameValues.reverse[chapterName],
    "collect": collect,
    "courseId": courseId,
    "desc": desc,
    "descMd": descMd,
    "envelopePic": envelopePic,
    "fresh": fresh,
    "id": id,
    "link": link,
    "niceDate": niceDate,
    "niceShareDate": niceShareDate,
    "origin": origin,
    "prefix": prefix,
    "projectLink": projectLink,
    "publishTime": publishTime,
    "selfVisible": selfVisible,
    "shareDate": shareDate == null ? null : shareDate,
    "shareUser": shareUser,
    "superChapterId": superChapterId,
    "superChapterName": superChapterNameValues.reverse[superChapterName],
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "title": title,
    "type": type,
    "userId": userId,
    "visible": visible,
    "zan": zan,
  };
}

enum ChapterName { EMPTY }

final chapterNameValues = EnumValues({
  "完整项目": ChapterName.EMPTY
});

enum SuperChapterName { TAB }

final superChapterNameValues = EnumValues({
  "开源项目主Tab": SuperChapterName.TAB
});

class Tag {
  Name name;
  Url url;

  Tag({
    this.name,
    this.url,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    name: nameValues.map[json["name"]],
    url: urlValues.map[json["url"]],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "url": urlValues.reverse[url],
  };
}

enum Name { EMPTY }

final nameValues = EnumValues({
  "项目": Name.EMPTY
});

enum Url { PROJECT_LIST_1_CID_294 }

final urlValues = EnumValues({
  "/project/list/1?cid=294": Url.PROJECT_LIST_1_CID_294
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
