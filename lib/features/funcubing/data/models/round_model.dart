import 'package:funcubing/features/funcubing/domain/entities/round_entity.dart';

class RoundModel extends RoundEntity {
  const RoundModel({
    super.current,
    super.total,
    super.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'current': current,
      'total': total,
      'name': name,
    };
  }

  factory RoundModel.fromJson(Map<String, dynamic> map) {
    return RoundModel(
      current: map['current'] as String?,
      total: map['total'] as String?,
      name: map['name'] as String?,
    );
  }
}