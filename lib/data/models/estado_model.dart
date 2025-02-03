import 'dart:convert';
import 'package:http/http.dart' as http;

class Estado {
  int? id;
  String? nome;
  String? sigla;

  Estado({this.id, this.nome, this.sigla});

  factory Estado.fromJson(Map<String, dynamic> json) {
    return Estado(
      id: json["id"],
      sigla: json["sigla"],
      nome: json["nome"],
    );
  }

  static Future<List<Estado>> buscaTodosEstados() async {
    const urlBase = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

    try {
      final uri = Uri.parse(urlBase);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body) as List;
        return List.generate(
          decodedResponse.length,
              (i) => Estado.fromJson(
            decodedResponse[i],
          ),
        );
      } else {
        throw Exception('Erro ao buscar estados no servidor');
      }
    } on Exception {
      rethrow;
    }
  }
}