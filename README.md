# App X SECOMP

Aplicativo Mobile para a X Semana da Computação da UFSCar

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## Organização dos diretórios

- ``/lib`` 
    - main.dart: apenas para iniciar o aplicativo
    - base.dart: é o layout base do aplicativo. Contém o Scaffold com AppBar e Drawer
    - colors.dart: cores padrão da SECOMP 
- ``/lib/routes``
    - Cada arquivo nesse diretório corresponde a uma página
- ``/lib/models``
    - Contém as classes com os dados que serão usados no aplicativo
- ``/lib/components``
    - São widgets personalizados pronto para usar em qualquer página

Os dirétórios ``/android`` e ``/ios`` são para configurar detalhes específicos da plataforma


