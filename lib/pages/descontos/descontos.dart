import 'package:app_secomp/models/desconto.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DescontosWidget extends StatelessWidget {
  List<Desconto> descontos = [
    Desconto(
      loja: "Yo Konno Temakeria",
      descricao:
          "Consumo acima de 30,00 ganha uma sobremesa ou hossomakis de salmão",
      obs: "(com apresentação do crachá)",
      img: "https://secompufscar.com.br/static/images/logo-colorida.png",
    ),
    Desconto(
      loja: "Japa Açaí",
      descricao: "10% de desconto para os participantes nos dias do evento",
      obs: "(com apresentação do crachá)",
      img: "https://secompufscar.com.br/static/images/logo-colorida.png",
    ),
    Desconto(
      loja: "DoGrego Foodtruck",
      descricao: "10% nos produtos para os participantes nos dias do evento",
      obs: "(com apresentação do crachá)",
      img: "https://secompufscar.com.br/static/images/logo-colorida.png",
    ),
    Desconto(
      loja: "Jamaica Foodtruck",
      descricao:
          "X SECOMP em 3 tipos de hambúrgueres artesanais (carne, frango e vegano)",
      obs:
          "Preço padrão: R\$ 24,90\nApresentando Cracha do kit: 15,00 sem batata ou 19,90 com uma porção pequena de batata",
      img: "https://secompufscar.com.br/static/images/logo-colorida.png",
    ),
    Desconto(
      loja: "Seu burguer",
      descricao: "5% de desconto para os participantes nos dias do evento",
      obs: "(com apresentação do crachá)",
      img: "https://secompufscar.com.br/static/images/logo-colorida.png",
    ),
    Desconto(
      loja: "Nerd Stickers",
      descricao: "Cupom de 10% de desconto para os participantes: Secomp10%",
      obs: " ",
      img: "https://secompufscar.com.br/static/images/logo-colorida.png",
    ),
    Desconto(
      loja: "Macarronato",
      descricao: "Cupom de 10% de desconto para os participantes.",
      obs:
          "(com apresentação do crachá)\nSorteio: Cinco pratos de macarrão na chapa, cada um com quatro opcionais, e uma coca-cola lata.",
      img: "https://secompufscar.com.br/static/images/logo-colorida.png",
    ),
  ];

  Widget _buildDesconto(Desconto desconto) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: 120,
              width: 120,
              child: CachedNetworkImage(
            imageUrl: desconto.img,
            placeholder: (context, url) => SpinKitChasingDots(
              color: Colors.cyan,
              size: 30,
            ),
          ),
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(desconto.loja, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(desconto.descricao, style: TextStyle(color: Colors.black54),),
                ),
                Text(desconto.obs, style: TextStyle(color: Colors.black54),)
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: descontos.length,
      itemBuilder: (context, index) => _buildDesconto(descontos[index]),
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Divider(),
      ),
    );
  }
}
