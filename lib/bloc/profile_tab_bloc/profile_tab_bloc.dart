import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'profile_tab_event.dart';
part 'profile_tab_state.dart';

class ProfileTabBloc extends Bloc<ProfileTabEvent, ProfileTabState> {
  ProfileTabBloc() : super(ProfileTabState(ProfileTab.dados));

  @override
  Stream<ProfileTabState> mapEventToState(ProfileTabEvent event) async* {
    if (event is ProfileTabUpdated) {
      yield ProfileTabState(event.tab);
    }
  }
}
