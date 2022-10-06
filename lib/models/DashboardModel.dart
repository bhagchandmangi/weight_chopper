class DashboardModel {
  DashboardModel({
    this.imagePath,
    this.profileVm,
    this.budgetVm,
    this.burners,
    this.blogs,
  });

  String? imagePath;
  dynamic profileVm;
  dynamic budgetVm;
  List<Burner>? burners;
  List<Blog>? blogs;
  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        imagePath: json["ImagePath"],
        profileVm: json["profileVM"],
        budgetVm: json["budgetVM"],
        burners:
            List<Burner>.from(json["Burners"].map((x) => Burner.fromJson(x))),
        blogs: List<Blog>.from(json["Blogs"].map((x) => Blog.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ImagePath": imagePath,
        "profileVM": profileVm,
        "budgetVM": budgetVm,
        "Burners": List<dynamic>.from(burners!.map((x) => x.toJson())),
        "Blogs": List<dynamic>.from(blogs!.map((x) => x.toJson())),
      };
}

class Blog {
  Blog({
    this.id,
    this.title,
    this.blogTypeId,
    this.description,
    this.content,
    this.fileName,
  });

  int? id;
  String? title;
  int? blogTypeId;
  String? description;
  String? content;
  String? fileName;

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["Id"],
        title: json["Title"],
        blogTypeId: json["BlogTypeId"],
        description: json["Description"],
        content: json["Content"],
        fileName: json["FileName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Title": title,
        "BlogTypeId": blogTypeId,
        "Description": description,
        "Content": content,
        "FileName": fileName,
      };
}

class Burner {
  Burner({
    this.id,
    this.burnerTypeId,
    this.name,
    this.description,
    this.duration,
    this.calories,
    this.fileName,
    this.videoFile,
  });

  int? id;
  int? burnerTypeId;
  String? name;
  Description? description;
  int? duration;
  double? calories;
  String? fileName;
  dynamic? videoFile;

  factory Burner.fromJson(Map<String, dynamic> json) => Burner(
        id: json["Id"],
        burnerTypeId: json["BurnerTypeId"],
        name: json["Name"],
        description: json["Description"] == null
            ? null
            : descriptionValues.map![json["Description"]],
        duration: json["Duration"],
        calories: json["Calories"].toDouble(),
        fileName: json["FileName"],
        videoFile: json["VideoFile"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "BurnerTypeId": burnerTypeId,
        "Name": name,
        "Description":
            description == null ? null : descriptionValues.reverse[description],
        "Duration": duration,
        "Calories": calories,
        "FileName": fileName,
        "VideoFile": videoFile,
      };
}

enum Description { EMPTY, GENERAL }

final descriptionValues =
    EnumValues({"": Description.EMPTY, "general": Description.GENERAL});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
