import 'package:carros/pages/utils/prefs.dart';
import 'dart:convert' as convert;

class Usuario {
  int? id;
  String? login;
  String? nome;
  String? email;
  String? urlFoto;
  String? token;
  List<String>? roles;

  Usuario(
      {this.id = 0,
      this.login = '',
      this.nome = '',
      this.email = '',
      this.urlFoto = '',
      this.token = '',
      this.roles});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    login = json['login'] ?? '';
    nome = json['nome'] ?? '';
    email = json['email'] ?? '';
    urlFoto = json['urlFoto'] ?? '';
    token = json['token'] ?? '';
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? 0;
    data['login'] = login ?? '';
    data['nome'] = nome ?? '';
    data['email'] = email ?? '';
    data['urlFoto'] = urlFoto ?? '';
    data['token'] = token ?? '';
    data['roles'] = roles ?? '';
    return data;
  }

  static void clear() {
    Prefs.setString("user.prefs", "");
  }

  void save() {
    Map map = toJson();
    String json = convert.json.encode(map);
    Prefs.setString("user.prefs", json);
  }

  static Future<Usuario> get() async {
    String json = await Prefs.getString("user.prefs");

    Map<String, dynamic> map = convert.json.decode(json);

    Usuario user = Usuario.fromJson(map);
    return user;
  }

  @override
  String toString() {
    return 'Usuario{id: $id, login: $login, nome: $nome, email: $email, urlFoto: $urlFoto, token: $token, roles: $roles}';
  }
}
