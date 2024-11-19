import 'dart:convert';
import 'package:http/http.dart' as http;

class Municipio {
  int? id;
  String? nome;
  String? uf;

  Municipio({this.id, this.nome, this.uf});

  factory Municipio.fromJson(Map<String, dynamic> json) {
    return Municipio(
      id: json['id'],
      nome: json['nome'],
      uf: json['microrregiao']['mesorregiao']['UF']['nome'],
    );
  }

  Future<List<Municipio>> buscaMunicipiosPorEstado(String siglaEstado) async {
    const urlBase = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
    try {
      final uri = Uri.parse('$urlBase/$siglaEstado/municipios');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body) as List;
        if (decodedResponse.isEmpty) {
          throw Exception('Nenhum municipio encontrado');
        }
        return List.generate(
          decodedResponse.length,
              (i) => Municipio.fromJson(
            decodedResponse[i],
          ),
        );
      } else {
        throw Exception(
            'Erro ao buscar municipios no servidor');
      }
    } on Exception {
      throw Exception('Erro ao buscar municipios');
    }
  }
}