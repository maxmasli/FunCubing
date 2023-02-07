import 'package:funcubing/features/funcubing/domain/entities/organizer_entity.dart';

class OrganizerModel extends OrganizerEntity {
  const OrganizerModel({
    super.wcaId,
    super.name,
    required super.main,
  });

  Map<String, dynamic> toJson() {
    return {
      'wcaId': wcaId,
      'name': name,
      'main': main,
    };
  }

  factory OrganizerModel.fromJson(Map<String, dynamic> map) {
    return OrganizerModel(
      wcaId: map['wca_id'] as String?,
      name: map['name'] as String?,
      main: map['main'] as bool,
    );
  }
}
