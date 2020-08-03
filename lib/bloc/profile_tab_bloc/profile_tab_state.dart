part of 'profile_tab_bloc.dart';

class ProfileTabState extends Equatable {
  const ProfileTabState(this.tab);

  final ProfileTab tab;

  @override
  List<Object> get props => [tab];
}
