part of 'profile_tab_bloc.dart';

abstract class ProfileTabEvent extends Equatable {
  const ProfileTabEvent();
}

class ProfileTabUpdated extends ProfileTabEvent {
  const ProfileTabUpdated(this.tab);

  final ProfileTab tab;

  @override
  List<Object> get props => [tab];

  @override
  String toString() => 'ProfileTabUpdated { tab: $tab }';
}
