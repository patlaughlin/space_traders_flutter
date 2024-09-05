import 'package:http/http.dart' as http;

class AgentRepository {
  Future<Agent> registerNewAgent(String callSign, String faction) async {
    final res = await http
        .post(Uri.parse('https://api.spacetraders.io/v2/register'), headers: {
      'Content-Type': 'application/json',
    }, body: {
      'symbol': callSign,
      'faction': faction,
    });

    if (res.statusCode == 200) {
      return Agent();
    } else {
      throw Exception('Failed to register user');
    }
  }
// final AuthLocalDataSource localDataSource;
//
// AuthRepository({required this.localDataSource});
//
// User? getUser() {
//   return localDataSource.getUser();
// }
}

class Agent {
  fromJson(Map<String, dynamic> json) {
    return Agent();
  }
}
