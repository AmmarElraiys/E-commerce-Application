class CategoiesModel {
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatatime;

  CategoiesModel({
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesDatatime,
  });

  CategoiesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatatime = json['categories_datatime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datatime'] = this.categoriesDatatime;
    return data;
  }
}
