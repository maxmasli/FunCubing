import 'package:funcubing/features/funcubing/domain/entities/delegate_entity.dart';

class DelegateModel extends DelegateEntity {
  const DelegateModel(
      {super.wcaId,
      super.name,
      super.role,
      super.vk,
      super.telegram,
      super.phone,
      super.email});

  Map<String, dynamic> toJson() {
    return {
      'wca_id': wcaId,
      'name': name,
      'role': role,
      'vk': vk,
      'telegram': telegram,
      'phone': phone,
      'email': email,
    };
  }

  factory DelegateModel.fromJson(Map<String, dynamic> map) {
    return DelegateModel(
      wcaId: map['wca_id'] as String?,
      name: map['name'] as String?,
      role: map['role'] as String?,
      vk: map['vk'] as String?,
      telegram: map['telegram'] as String?,
      phone: map['phone'] as String?,
      email: map['email'] as String?,
    );
  }
}
