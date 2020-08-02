import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../models/models.dart';

class PresencasTab extends StatelessWidget {
  String getTipo(TipoAtividade tipo) {
    switch (tipo) {
      case TipoAtividade.Palestra:
        return 'Palestra';
        break;
      case TipoAtividade.Minicurso:
        return 'Minicurso';
        break;
      case TipoAtividade.Workshop:
        return 'Workshop';
        break;
      case TipoAtividade.MesaRedonda:
        return 'Mesa-redonda';
        break;
      case TipoAtividade.Coffee:
        return 'Coffee-break';
        break;
      case TipoAtividade.PS:
        return 'Processo Seletivo';
        break;
      case TipoAtividade.FeiraProjeto:
        return 'Feira de Projetos';
        break;
      case TipoAtividade.PalestraEmpresarial:
        return 'Palestra Empresarial';
        break;
      default:
        return 'Outro';
    }
  }

  Widget _buildItem(String presenca) {
    return ListTile(
      title: Text(presenca),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParticipanteBloc, ParticipanteState>(
      builder: (context, state) {
        if (state is ParticipanteLoadSuccess) {
          final participante = state.participante;
          return ListView.builder(
            itemCount: participante.presencas.length,
            itemBuilder: (context, index) =>
                _buildItem(participante.presencas[index]),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
