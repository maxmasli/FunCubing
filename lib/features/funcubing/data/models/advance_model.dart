import 'package:funcubing/features/funcubing/domain/entities/advance_entity.dart';

class AdvanceModel extends AdvanceEntity {
  const AdvanceModel({
    required super.isPercent,
    super.value,
  });

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'is_percent': isPercent,
    };
  }

  factory AdvanceModel.fromJson(Map<String, dynamic> map) {
    return AdvanceModel(
      value: map['value'] as int?,
      isPercent: map['is_percent'] as bool,
    );
  }
}
