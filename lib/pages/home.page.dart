import 'package:shimmer/shimmer.dart';
import 'package:teste_agape/models/usuario.model.dart';
import 'package:flutter/material.dart';
import 'package:teste_agape/models/usuarios.model.dart';
import 'package:teste_agape/pages/loginEdit.page.dart';
import 'package:teste_agape/repositories/usuario.repository.dart';
import 'package:teste_agape/widgets/dialog.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<UsuarioModel>> contatoFuture;
  TextEditingController _buscaController = TextEditingController();

  ListTile defaultListTile = ListTile();
  UsuarioModel defaultCommand = new UsuarioModel();
  List<UsuarioModel> usuarioModelList = List<UsuarioModel>();

  final scrollController = ScrollController();
  UsuarioModels usuarioModels;

  @override
  void initState() {
    usuarioModels = UsuarioModels(_buscaController.text);

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        usuarioModels.loadMore();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Teste Agape')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          montaTextBusca(),
          Expanded(
            child: buildBody(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginEditPage(),
            ),
          );
          usuarioModels.refresh();
        },
        tooltip: 'Adicionar',
        child: Icon(Icons.add),
      ),
    );
  }

  Row montaTextBusca() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (texto) {
                usuarioModels.login = texto;
                usuarioModels.refresh();
              },
              controller: _buscaController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                usuarioModels.login = _buscaController.text;
                usuarioModels.refresh();
              });
            },
            child: Text('Buscar'),
          ),
        )
      ],
    );
  }

  buildBody() {
    return StreamBuilder(
      stream: usuarioModels.stream,
      builder: (BuildContext _context, AsyncSnapshot _snapshot) {
        if (_snapshot.connectionState == ConnectionState.waiting) {
          usuarioModelList.add(defaultCommand);
          return ListView.builder(
            itemCount: 10,
            // Important code
            itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.white,
                child: defaultListTile),
          );
        } else if (_snapshot.hasData && _snapshot.data.length != 0) {
          return RefreshIndicator(
            onRefresh: usuarioModels.refresh,
            child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                controller: scrollController,
                itemCount: _snapshot.data.length + 1,
                itemBuilder: (BuildContext _context, int index) {
                  if (index < _snapshot.data.length) {
                    UsuarioModel user = _snapshot.data[index];

                    return buildCard(user);
                  } else if (usuarioModels.hasMore) {
                    return Shimmer.fromColors(
                        baseColor: Colors.grey[300],
                        highlightColor: Colors.white,
                        child: defaultListTile);
                  } else {
                    return Container();
                  }
                }),
          );
        } else {
          return Center(child: Text("Sem registros para exibir"));
        }
      },
    );
  }

  Widget buildCard(UsuarioModel user) {
    return Card(
      color: Colors.grey[100],
      child: Padding(
        padding: EdgeInsets.only(top: 5, left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Login: ' + user.login,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text('Email: ' + user.email),
            Text('Administrador: ' + (user.admin ? 'Sim' : 'Não')),
            Text('Status: ' + (user.status ? 'Ativado' : 'Desativado')),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Editar'),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginEditPage(
                          usuarioModel: user,
                        ),
                      ),
                    );
                    usuarioModels.refresh();
                  },
                ),
                FlatButton(
                  child: const Text('Excluir'),
                  onPressed: () async {
                    var result = await DialogDirector.showMessageDialogConfirm(
                        context,
                        "Confirmar exclusão",
                        "Remover " + user.login + "?");

                    if (result != null && result) {
                      excluirUsuario(user);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  excluirUsuario(UsuarioModel userModel) async {
    var repository = UsuariosRepository();
    var removido = await repository.remove(userModel.idUsuario);

    if (removido != null && removido) {
      usuarioModels.refresh();
    }
  }
}
