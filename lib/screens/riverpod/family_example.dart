import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';
import 'package:learning/component/pointers_view.dart';
import 'package:learning/component/real_flow_view.dart';

class FamilyExample extends StatelessWidget {
  const FamilyExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '.family Modifier',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'Modifier'),
          HeadingView(text: '.family'),
          NormalView(
            text:
                'family is used when providers require dynamic parameters like productId, userId, roomId, or search query. It helps create independent provider instances for different inputs.',
          ),

          SizedBox(height: 10),
          PointersView(text: 'Api Service'),
          CodeView(
            code: '''
class ApiService {

  final Dio dio = Dio();

  Future<User> getUser(int userId) async {

    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/users/\$userId',
    );

    return User.fromJson(response.data);
  }
}
''',
          ),

          PointersView(text: 'ApiService Provider'),
          CodeView(
            code: '''final apiServiceProvider =
    Provider<ApiService>((ref) {

  return ApiService();
});''',
          ),

          PointersView(text: 'FutureProvider.family'),
          CodeView(
            code: '''
final userProvider =
    FutureProvider.family<User, int>(
  (ref, userId) async {

    final api =
        ref.read(apiServiceProvider);

    return api.getUser(userId);
  },
);''',
          ),

          PointersView(text: 'Usage in Widget'),
          CodeView(
            code: '''class UserScreen extends ConsumerWidget {

  final int userId;

  const UserScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref) {

    final userData =
        ref.watch(userProvider(userId));

    return Scaffold(

      appBar: AppBar(
        title: const Text("User"),
      ),

      body: userData.when(

        data: (user) {

          return Column(
            children: [

              Text(user.name),

              Text(user.email),
            ],
          );
        },

        loading: () {

          return const Center(
            child:
                CircularProgressIndicator(),
          );
        },

        error: (e, s) {

          return Center(
            child: Text(e.toString()),
          );
        },
      ),
    );
  }
}''',
          ),

          RealFlowView(
            text: '''UserScreen(userId: 5)
↓
ref.watch(userProvider(5))
↓
.family receives parameter 5
↓
API Call:
GET /users/5
↓
Data returned
↓
UI rebuild''',
          ),
        ],
      ),
    );
  }
}
