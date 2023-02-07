import 'package:funcubing/features/funcubing/domain/entities/sheet_entity.dart';

class SheetModel extends SheetEntity {
  const SheetModel({
    super.sheet,
    super.title,
    super.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'sheet': sheet,
      'title': title,
      'content': content,
    };
  }

  factory SheetModel.fromJson(Map<String, dynamic> map) {
    return SheetModel(
      sheet: map['sheet'] as String?,
      title: map['title'] as String?,
      content: map['content'] as String?,
    );
  }
}
