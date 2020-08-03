import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../models/models.dart';
import '../../repository/repositories.dart';
import 'dados_participante_tab.dart';
import 'presencas_tab.dart';

class ParticipantePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (context) => ParticipantePage());
  }

  @override
  _ParticipantePageState createState() => _ParticipantePageState();
}

class _ParticipantePageState extends State<ParticipantePage> {
  List<Widget> _body = [
    DadosParticipanteTab(),
    PresencasTab(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ParticipanteBloc(
            participanteRepository:
                RepositoryProvider.of<ParticipanteRepository>(context),
          )..add(ParticipanteRequested()),
        ),
        BlocProvider(
          create: (_) => ProfileTabBloc(),
        )
      ],
      child: BlocBuilder<ProfileTabBloc, ProfileTabState>(
        builder: (context, state) {
          _currentIndex = ProfileTab.values.indexOf(state.tab);

          return Scaffold(
            body: AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              child: _body[_currentIndex],
            ),
            bottomNavigationBar: TabSelector(
              activeTab: state.tab,
              onTabSelected: (tab) => BlocProvider.of<ProfileTabBloc>(context)
                  .add(ProfileTabUpdated(state.tab)),
            ),
          );
        },
      ),
    );
  }
}

class TabSelector extends StatelessWidget {
  final ProfileTab activeTab;
  final Function(ProfileTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // key: ArchSampleKeys.tabs,
      type: BottomNavigationBarType.fixed,
      currentIndex: ProfileTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(ProfileTab.values[index]),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          title: Text("Dados"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check_circle),
          title: Text("Presenças"),
        ),
      ],
    );
  }
}
