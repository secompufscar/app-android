import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:formz/formz.dart';

import '../../base.dart';
import '../../bloc/blocs.dart';
import '../../colors.dart';
import '../../components/gradient_button.dart';
import '../../components/logo.dart';
import '../pages.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (true) ;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Base(
                first: ParticipantePage(),
                title: "Área do Participante",
              ),
            ),
            (route) => false,
          );
        } else if (state.status.isSubmissionInProgress) {
          showDialog(
            context: context,
            builder: (context) => new _LoadingDialog(),
          );
        }
      },
      child: SafeArea(
        top: false,
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          children: [
            LogoSeKombi(w: 300, h: 300),
            _EmailInput(),
            const Padding(padding: EdgeInsets.all(8)),
            _PasswordInput(),
            const Padding(padding: EdgeInsets.all(8)),
            Align(
              alignment: Alignment.bottomRight,
              child: _ForgotPassword(),
            ),
            _ErrorMessage(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 80),
              child: _LoginButton(),
            ),
            _NewAccount(),
            // const Padding(padding: EdgeInsets.all(8)),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) =>
              context.bloc<LoginBloc>().add(LoginEmailChanged(email)),
          cursorColor: Colors.teal,
          textCapitalization: TextCapitalization.none,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.teal[300])),
            icon: Icon(Icons.person),
            labelText: 'Usuário',
            contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 100.0, 0.0),
            errorText: state.email.invalid ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.bloc<LoginBloc>().add(LoginPasswordChanged(password)),
          cursorColor: Colors.teal,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.lock),
              contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 100.0, 0.0),
              labelText: 'Senha'),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        // return state.status.isSubmissionInProgress
        //     ? const CircularProgressIndicator()
        //     : RaisedButton(
        //         key: const Key('loginForm_continue_raisedButton'),
        //         child: const Text('Login'),
        //         onPressed: state.status.isValidated
        //             ? () {
        //                 context.bloc<LoginBloc>().add(const LoginSubmitted());
        //               }
        //             : null,
        //       );
        return GradientButton(
          gradient: LinearGradient(
            colors: <Color>[
              SecompColors.gradientStart,
              SecompColors.gradientEnd,
            ],
          ),
          key: const Key('loginForm_continue_raisedButton'),
          child: const Text(
            'Login',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            context.bloc<LoginBloc>().add(const LoginSubmitted());
          },
        );
      },
    );
  }
}

class _ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => _launchURL(
          context, 'https://secompufscar.com.br/participante/esqueci-senha'),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Esqueceu sua senha ?',
          style: TextStyle(
            color: Colors.teal[200],
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _NewAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Não tem conta ?'),
        InkWell(
          onTap: () => _launchURL(
              context, 'https://secompufscar.com.br/participante/cadastro'),
          borderRadius: BorderRadius.circular(8),
          child: Text(
            ' Crie uma conta',
            style:
                TextStyle(color: Colors.teal[200], fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status.isSubmissionFailure) {
          return Center(
            child: Text("Email não existente ou senha inválida"),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class _LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: <Widget>[
          CircularProgressIndicator(),
          Text("Fazendo login..."),
        ],
      ),
    );
  }
}

void _launchURL(BuildContext context, String url) async {
  try {
    await launch(
      url,
      option: CustomTabsOption(
        toolbarColor: Theme.of(context).primaryColor,
        enableDefaultShare: true,
        enableUrlBarHiding: true,
        showPageTitle: true,
        animation: CustomTabsAnimation.slideIn(),
        // or user defined animation.
        extraCustomTabs: <String>[
          // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
          'org.mozilla.firefox',
          // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
          'com.microsoft.emmx',
        ],
      ),
    );
  } catch (e) {
    // An exception is thrown if browser app is not installed on Android device.
    debugPrint(e.toString());
  }
}
