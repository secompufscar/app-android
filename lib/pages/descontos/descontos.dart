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
      img: "https://secompufscar.com.br/uploads/logo_patrocinadores/yo_colorida.png",
    ),
    Desconto(
      loja: "Japa Açaí",
      descricao: "10% de desconto para os participantes nos dias do evento",
      obs: "(com apresentação do crachá)",
      img: "https://secompufscar.com.br/uploads/logo_patrocinadores/japa_colorida.png",
    ),
    Desconto(
      loja: "DoGrego Foodtruck",
      descricao: "10% nos produtos para os participantes nos dias do evento",
      obs: "(com apresentação do crachá)",
      img: "https://secompufscar.com.br/uploads/logo_patrocinadores/dogrego_colorida.png",
    ),
    Desconto(
      loja: "Jamaica Foodtruck",
      descricao:
          "X SECOMP em 3 tipos de hambúrgueres artesanais (carne, frango e vegano)",
      obs:
          "Preço padrão: R\$ 24,90\nApresentando Cracha do kit: 15,00 sem batata ou 19,90 com uma porção pequena de batata",
      img:
          "https://secompufscar.com.br/static/images/patrocinadores/jamaica_colorida.png",
    ),
    Desconto(
      loja: "Seu burguer",
      descricao: "5% de desconto para os participantes nos dias do evento",
      obs: "(com apresentação do crachá)",
      img: "https://secompufscar.com.br/static/images/testeseuburguer.png",
    ),
    Desconto(
      loja: "Subway",
      descricao: "Subway em dobro",
      obs:
          "Válido para as unidades: Avenida São Carlos, Shopping Iguatemi e Havan\n(com apresentação do crachá)",
      img:
          "https://secompufscar.com.br/static/images/patrocinadores/subway_colorida.png",
    ),
    Desconto(
      loja: "Nerd Stickers",
      descricao: "Cupom de 10% de desconto para os participantes: Secomp10%",
      obs: " ",
      img:
          "https://secompufscar.com.br/static/images/patrocinadores/nerd_colorida.png",
    ),
    Desconto(
      loja: "Macarronato",
      descricao: "Cupom de 10% de desconto para os participantes.",
      obs:
          "(com apresentação do crachá)\nSorteio: Cinco pratos de macarrão na chapa, cada um com quatro opcionais, e uma coca-cola lata.",
      img: "https://secompufscar.com.br/uploads/logo_patrocinadores/macarronato_colorida.png",
    ),
    Desconto(
      loja: "Rock Burger",
      descricao: "10% de desconto na compra de burger + bebida",
      obs: "(com apresentação do crachá)",
      img: "https://secompufscar.com.br/uploads/logo_patrocinadores/rockburger_colorida.png",
    ),
    Desconto(
      loja: "Billy's BBQ",
      descricao: "10% de desconto (exceto promoções)",
      obs: "(com apresentação do crachá e um documento com foto)",
      img: "https://scontent-gru2-1.xx.fbcdn.net/v/t1.0-9/48420527_316167365665638_5593552006565330944_n.jpg?_nc_cat=102&_nc_oc=AQnhRtccsZYTyUoTxtaXeYeBsGpquYF20rU_EGsp0yteMeSRyjZJIROqEWuf-7rg2tA&_nc_ht=scontent-gru2-1.xx&oh=38b7072a728ba9bbaa90cbbc7c4147e2&oe=5DF05B00",
    ),
    Desconto(
      loja: "Estação da luz",
      descricao: "8% de desconto",
      obs: "(com apresentação do crachá)",
      img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFwGtcjdoeXgdGB0nI03z9PonOd3NYC1EgTqCJZ-gY0BSMTrV4",
    ),
    Desconto(
      loja: "Restaurante São Carlos",
      descricao: "10% de desconto",
      obs: "(com apresentação do crachá)",
      img: "https://secompufscar.com.br/static/images/logo-colorida.png",
    ),
    Desconto(
      loja: "Seo Gera",
      descricao: "10% de desconto (exceto promoções)",
      obs: "(com apresentação do crachá)",
      img: "https://secompufscar.com.br/static/images/logo-colorida.png",
    ),
    Desconto(
      loja: "Trem Bão",
      descricao: "20% de desconto",
      obs: "(com apresentação do crachá)",
      img: "https://secompufscar.com.br/static/images/logo-colorida.png",
    ),
    Desconto(
      loja: "Vai Uai",
      descricao: "Desconto no Self service",
      obs: "Terça à sexta: de R\$25,90 por R\$23,90\nSábado e domingo: de R\$35,90 por R\$31,90\n(com apresentação do crachá)",
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
                Text(desconto.loja,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    desconto.descricao,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                Text(
                  desconto.obs,
                  style: TextStyle(color: Colors.black54),
                )
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
