import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base.dart';
import 'bloc/blocs.dart';
import 'pages/pages.dart';
import 'repository/repositories.dart';
import 'service/services.dart';

void main() {
  Bloc.observer = SimpleObserver();
  final dio = Dio()..interceptors.add(LoggerInterceptor());
  final client = ApiService(dio: dio, baseUrl: 'http://192.168.15.11:3000');
  final participanteRepository = ParticipanteRepository();
  final noticiaRepository = NoticiaRepository();
  final atividadeRepository = AtividadeRepository(client: client);
  final authenticationRepository = AuthenticationRepository(
    client: client,
    participanteRepository: participanteRepository,
  );

  runApp(AppSecomp(
    authenticationRepository: authenticationRepository,
    participanteRepository: participanteRepository,
    atividadeRepository: atividadeRepository,
    noticiaRepository: noticiaRepository,
  ));
}

class AppSecomp extends StatelessWidget {
  AppSecomp({
    Key key,
    @required this.authenticationRepository,
    @required this.participanteRepository,
    @required this.atividadeRepository,
    @required this.noticiaRepository,
  })  : assert(authenticationRepository != null),
        assert(participanteRepository != null),
        assert(noticiaRepository != null),
        super(key: key);

  final AtividadeRepository atividadeRepository;
  final NoticiaRepository noticiaRepository;
  final AuthenticationRepository authenticationRepository;
  final ParticipanteRepository participanteRepository;

  @override
  Widget build(BuildContext context) {
    final FirebaseMessaging _fcm = FirebaseMessaging();
    _fcm.subscribeToTopic('noticias');

    Future<Widget> getHomeWidget() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool entered = prefs.getBool('entered');
      print(entered);
      // if (entered == null) {
      //   prefs.setBool('entered', true);
      //   return Intro();
      // } else
        return Base(
          first: HomePage(),
          title: "X SECOMP",
        );
    }

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => authenticationRepository),
        RepositoryProvider(create: (_) => participanteRepository),
        RepositoryProvider(create: (_) => atividadeRepository),
        RepositoryProvider(create: (_) => noticiaRepository),
      ],
      child: MultiBlocProvider(
        child: MaterialApp(
          title: 'SECOMP',
          theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Lato'),
          home: FutureBuilder(
            future: getHomeWidget(),
            builder: (context, snapshot) =>
                snapshot.hasData ? snapshot.data : Container(),
          ),
        ),
        /* Injeções dos Bloc 
        Toda vez que for criado um novo bloc é necessário
        inserir nesse lista */
        providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(
              authenticationRepository: authenticationRepository,
              participanteRepository: participanteRepository,
            ),
          ),
          BlocProvider(
            create: (_) => NoticiasBloc(
              noticiaRepository: noticiaRepository,
            )..add(NoticiasRequested()),
          ),
          BlocProvider(
            create: (_) => AtividadesBloc(
              atividadeRepository: atividadeRepository,
            )..add(AtividadesRequested()),
          )
        ],
      ),
    );
  }
}
