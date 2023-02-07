import 'package:equatable/equatable.dart';

class DelegateEntity extends Equatable {
  final String? wcaId;
  final String? name;
  final String? role;
  final String? vk;
  final String? telegram;
  final String? phone;
  final String? email;

  const DelegateEntity({
    this.wcaId,
    this.name,
    this.role,
    this.vk,
    this.telegram,
    this.phone,
    this.email,
  });

  @override
  List<Object?> get props => [wcaId, name, role, vk, telegram, phone, email];
}
