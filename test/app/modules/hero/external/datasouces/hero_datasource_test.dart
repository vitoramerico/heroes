import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heroes/app/modules/hero/external/datasouces/hero_datasource.dart';
import 'package:heroes/app/modules/hero/infra/datasources/i_hero_datasource.dart';
import 'package:heroes/app/modules/hero/infra/models/hero_model.dart';
import 'package:heroes/app/shared/connect/dio_connect_interface.dart';
import 'package:heroes/app/shared/connect/errors/http_response_error.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'hero_datasource_test.mocks.dart';

@GenerateMocks([Dio])
class MockDioConnect implements IDioConnect {
  late MockDio _dio;

  MockDioConnect() {
    _dio = MockDio();
  }

  @override
  MockDio get instance => _dio;
}

class MyModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<IDioConnect>((i) => MockDioConnect()),
        Bind.singleton<IHeroDatasource>((i) => HeroDatasource(i.get<MockDioConnect>())),
      ];
}

void main() {
  setUpAll(() {
    initModules([MyModule()]);
  });

  test('deve estar com todas as instancias injetadas', () {
    final dioConnect = Modular.get<IDioConnect>();
    final heroDatasource = Modular.get<IHeroDatasource>();

    expect(dioConnect, isA<MockDioConnect>());
    expect(heroDatasource, isA<HeroDatasource>());
  });

  test('deve retornar uma lista com os registros', () async {
    final mockDioConnect = Modular.get<MockDioConnect>();
    final datasource = Modular.get<IHeroDatasource>();

    when(mockDioConnect.instance.get(any)).thenAnswer((_) async {
      return Response(
        data: jsonDecode(jsonData),
        requestOptions: RequestOptions(path: ''),
      );
    });

    var result = await datasource.findByName('batman');

    expect(result, isA<List<HeroModel>>());
    expect(result.length, equals(2));
  });

  test('deve lançar um erro quando o servidor retorna erro no response', () async {
    final mockDioConnect = Modular.get<MockDioConnect>();
    final datasource = Modular.get<IHeroDatasource>();

    when(mockDioConnect.instance.get(any)).thenAnswer((_) async {
      return Response(
        data: jsonDecode(jsonDataError),
        requestOptions: RequestOptions(path: ''),
      );
    });

    expect(() async => await datasource.findByName(''), throwsA(isA<HttpResponseError>()));
  });

  test('deve lançar um erro do tipo HttpResponseError', () async {
    final mockDioConnect = Modular.get<MockDioConnect>();
    final datasource = Modular.get<IHeroDatasource>();

    var requestOptions = RequestOptions(path: '');

    when(mockDioConnect.instance.get(any)).thenThrow(DioError(
      type: DioErrorType.response,
      requestOptions: requestOptions,
    ));

    expect(() async => await datasource.findByName('batman'), throwsA(isA<HttpResponseError>()));
  });

  test('deve lançar um erro do tipo HttpResponseError com as informações preenchidas', () async {
    final mockDioConnect = Modular.get<MockDioConnect>();
    final datasource = Modular.get<IHeroDatasource>();

    var requestOptions = RequestOptions(path: '');
    var statusError = 'Erro interno no servidor';
    var error = Exception('erro');

    when(mockDioConnect.instance.get(any)).thenThrow(DioError(
      type: DioErrorType.response,
      error: error,
      response: Response(
        requestOptions: requestOptions,
        statusMessage: statusError,
      ),
      requestOptions: requestOptions,
    ));

    try {
      await datasource.findByName('batman');
    } on HttpResponseError catch (e) {
      expect(e.statusError, isNotEmpty);
      expect(e.statusError, equals(statusError));
      expect(e.message, isNotEmpty);
      expect(e.message, equals(error.toString()));
    }
  });
}

String jsonData = '''
{
  "response": "success",
  "results-for": "batman",
  "results": [
    {
      "id": "69",
      "name": "Batman",
      "powerstats": {
        "intelligence": "81",
        "strength": "40",
        "speed": "29",
        "durability": "55",
        "power": "63",
        "combat": "90"
      },
      "biography": {
        "full-name": "Terry McGinnis",
        "alter-egos": "No alter egos found.",
        "aliases": [
          "Batman II",
          "The Tomorrow Knight",
          "The second Dark Knight",
          "The Dark Knight of Tomorrow",
          "Batman Beyond"
        ],
        "place-of-birth": "Gotham City, 25th Century",
        "first-appearance": "Batman Beyond #1",
        "publisher": "DC Comics",
        "alignment": "good"
      },
      "appearance": {
        "gender": "Male",
        "race": "Human",
        "height": [
          "5'10",
          "178 cm"
        ],
        "weight": [
          "170 lb",
          "77 kg"
        ],
        "eye-color": "Blue",
        "hair-color": "Black"
      },
      "work": {
        "occupation": "-",
        "base": "21st Century Gotham City"
      },
      "connections": {
        "group-affiliation": "Batman Family, Justice League Unlimited",
        "relatives": "Bruce Wayne (biological father), Warren McGinnis (father, deceased), Mary McGinnis (mother), Matt McGinnis (brother)"
      },
      "image": {
        "url": "https://www.superherodb.com/pictures2/portraits/10/100/10441.jpg"
      }
    },
    {
      "id": "71",
      "name": "Batman II",
      "powerstats": {
        "intelligence": "88",
        "strength": "11",
        "speed": "33",
        "durability": "28",
        "power": "36",
        "combat": "100"
      },
      "biography": {
        "full-name": "Dick Grayson",
        "alter-egos": "Nightwing, Robin",
        "aliases": [
          "Dick Grayson"
        ],
        "place-of-birth": "-",
        "first-appearance": "-",
        "publisher": "Nightwing",
        "alignment": "good"
      },
      "appearance": {
        "gender": "Male",
        "race": "Human",
        "height": [
          "5'10",
          "178 cm"
        ],
        "weight": [
          "175 lb",
          "79 kg"
        ],
        "eye-color": "Blue",
        "hair-color": "Black"
      },
      "work": {
        "occupation": "-",
        "base": "Gotham City; formerly Bludhaven, New York City"
      },
      "connections": {
        "group-affiliation": "Justice League Of America, Batman Family",
        "relatives": "John Grayson (father, deceased), Mary Grayson (mother, deceased), Bruce Wayne / Batman (adoptive father), Damian Wayne / Robin (foster brother), Jason Todd / Red Hood (adoptive brother), Tim Drake / Red Robin (adoptive brother), Cassandra Cain / Batgirl IV (adoptive sister)"
      },
      "image": {
        "url": "https://www.superherodb.com/pictures2/portraits/10/100/1496.jpg"
      }
    }
  ]
}
''';

String jsonDataError = '''
{
    "response": "error",
    "error": "character with given name not found"
}
''';
