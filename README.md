# App X SECOMP

Aplicativo Mobile para a X Semana da Computação da UFSCar

## Como Rodar

Verifique se o flutter está instalado corretamente.

```
$ flutter doctor
```

Verifique se adicionou a variável de ambiente ``ANDROID_HOME`` e o caminho de instalação do flutter na variável ``PATH``.
Para adicionar, adicione as seguintes linhas no arquivo ``~/.bashrc``:

```
export PATH="$PATH":"<caminho de instalação do Flutter>"
export ANDROID_HOME="<caminho de instalação do Android SDK>"
```

Crie o arquivo ``lib/credentials.dart`` e adicione a seguinte linha:
```
const API_KEY=""
```

Execute o aplicativo:

```
$ flutter run
```


## Organização dos diretórios

- ``/assets``
    - todo material gráfico que será usado no aplicativo
- ``/lib`` 
    - main.dart: apenas para iniciar o aplicativo
    - base.dart: é o layout base do aplicativo. Contém o Scaffold com AppBar e Drawer
    - colors.dart: cores padrão da SECOMP 
- ``/lib/pages``
    - Cada diretório contém arquivos relacionados a uma página
- ``/lib/models``
    - Contém as classes com os dados que serão usados no aplicativo
- ``/lib/components``
    - São widgets personalizados pronto para usar em qualquer página
- ``/lib/util``
    - Contém classes que facilitam o acesso a serviços, por exemplo, acesso a API

Os dirétórios ``/android`` e ``/ios`` são para configurar detalhes específicos da plataforma

----

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
