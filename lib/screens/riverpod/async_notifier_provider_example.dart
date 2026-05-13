import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/pointers_view.dart';

import '../../component/custom_scaffold.dart';

class AsyncNotifierProviderExample extends StatelessWidget {
  const AsyncNotifierProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Async Notifier Provider Example',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'AsyncNotifierProvider'),
          PointersView(text: 'Model'),
          CodeView(
            code: '''class Employee {

  final int id;
  final String name;
  final String designation;

  Employee({
    required this.id,
    required this.name,
    required this.designation,
  });

  factory Employee.fromJson(
    Map<String, dynamic> json,
  ) {

    return Employee(
      id: json["id"],
      name: json["name"],
      designation: json["designation"],
    );
  }

  Map<String, dynamic> toJson() {

    return {
      "id": id,
      "name": name,
      "designation": designation,
    };
  }

  Employee copyWith({
    int? id,
    String? name,
    String? designation,
  }) {

    return Employee(
      id: id ?? this.id,
      name: name ?? this.name,
      designation:
          designation ?? this.designation,
    );
  }
}''',
          ),
          PointersView(text: 'Api Service'),

          CodeView(
            code: '''import 'package:dio/dio.dart';

class ApiService {

  final Dio dio = Dio(

    BaseOptions(

      baseUrl: "https://your-api.com/api",

      connectTimeout:
          const Duration(seconds: 30),

      receiveTimeout:
          const Duration(seconds: 30),

      headers: {
        "Content-Type":
            "application/json",
      },
    ),
  );

  /// GET EMPLOYEES WITH PAGINATION
  Future<List<Employee>> getEmployees({
    required int page,
    required int limit,
  }) async {

    try {

      final response = await dio.get(

        "/employees",

        queryParameters: {
          "page": page,
          "limit": limit,
        },
      );

      final List data = response.data["data"];

      return data
          .map(
            (e) => Employee.fromJson(e),
          )
          .toList();

    } on DioException catch (e) {

      throw Exception(
        e.response?.data["message"] ??
            "Failed to fetch employees",
      );
    }
  }

  /// ADD EMPLOYEE
  Future<Employee> addEmployee(
    Employee employee,
  ) async {

    try {

      final response = await dio.post(

        "/employees",

        data: employee.toJson(),
      );

      return Employee.fromJson(
        response.data["data"],
      );

    } on DioException catch (e) {

      throw Exception(
        e.response?.data["message"] ??
            "Failed to add employee",
      );
    }
  }

  /// UPDATE EMPLOYEE
  Future<Employee> updateEmployee(
    Employee employee,
  ) async {

    try {

      final response = await dio.put(

        "/employees/\${employee.id}",

        data: employee.toJson(),
      );

      return Employee.fromJson(
        response.data["data"],
      );

    } on DioException catch (e) {

      throw Exception(
        e.response?.data["message"] ??
            "Failed to update employee",
      );
    }
  }

  /// DELETE EMPLOYEE
  Future<void> deleteEmployee(
    int id,
  ) async {

    try {

      await dio.delete(
        "/employees/\$id",
      );

    } on DioException catch (e) {

      throw Exception(
        e.response?.data["message"] ??
            "Failed to delete employee",
      );
    }
  }
}''',
          ),

          PointersView(text: 'API Provider'),
          CodeView(
            code: '''final apiServiceProvider =
    Provider<ApiService>(
  (ref) => ApiService(),
);''',
          ),
          PointersView(text: 'AsyncNotifier with CRUD + Pagination'),

          CodeView(
            code: '''class EmployeeNotifier
    extends AsyncNotifier<List<Employee>> {

  late ApiService api;

  int _page = 1;

  final int _limit = 10;

  bool hasMore = true;

  bool isLoadingMore = false;

  List<Employee> employees = [];

  @override
  Future<List<Employee>> build() async {

    api = ref.read(apiServiceProvider);

    return _fetchEmployees();
  }

  /// INITIAL API CALL
  Future<List<Employee>>
      _fetchEmployees() async {

    final result =
        await api.getEmployees(
      page: _page,
      limit: _limit,
    );

    employees = result;

    return result;
  }

  /// PAGINATION
  Future<void> loadMore() async {

    if (isLoadingMore || !hasMore) {
      return;
    }

    isLoadingMore = true;

    try {

      _page++;

      final newEmployees =
          await api.getEmployees(
        page: _page,
        limit: _limit,
      );

      if (newEmployees.isEmpty) {

        hasMore = false;

      } else {

        employees = [
          ...employees,
          ...newEmployees,
        ];

        state = AsyncData(employees);
      }

    } catch (e, st) {

      state = AsyncError(e, st);

    } finally {

      isLoadingMore = false;
    }
  }

  /// ADD EMPLOYEE
  Future<void> addEmployee(
    Employee employee,
  ) async {

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {

      final newEmployee =
          await api.addEmployee(employee);

      employees = [
        newEmployee,
        ...employees,
      ];

      return employees;
    });
  }

  /// UPDATE EMPLOYEE
  Future<void> updateEmployee(
    Employee employee,
  ) async {

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {

      final updatedEmployee =
          await api.updateEmployee(employee);

      employees = employees.map((e) {

        if (e.id ==
            updatedEmployee.id) {

          return updatedEmployee;
        }

        return e;

      }).toList();

      return employees;
    });
  }

  /// DELETE EMPLOYEE
  Future<void> deleteEmployee(
    int id,
  ) async {

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {

      await api.deleteEmployee(id);

      employees.removeWhere(
        (e) => e.id == id,
      );

      return employees;
    });
  }

  /// REFRESH
  Future<void> refreshEmployees()
      async {

    _page = 1;

    hasMore = true;

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {

      final result =
          await api.getEmployees(
        page: _page,
        limit: _limit,
      );

      employees = result;

      return result;
    });
  }
}''',
          ),
          PointersView(text: 'Provider'),
          CodeView(
            code: '''final employeeProvider =
    AsyncNotifierProvider<
        EmployeeNotifier,
        List<Employee>>(
  EmployeeNotifier.new,
);''',
          ),
          PointersView(text: 'UI Screen'),
          CodeView(
            code: '''
class EmployeeScreen extends ConsumerWidget {

  const EmployeeScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {

    final state =
        ref.watch(employeeProvider);

    final notifier =
        ref.read(
          employeeProvider.notifier,
        );

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Employees",
        ),
      ),

      floatingActionButton:
          FloatingActionButton(

        onPressed: () {

          notifier.addEmployee(

            Employee(
              id: 0,
              name: "Shadab",
              designation:
                  "Flutter Developer",
            ),
          );
        },

        child: const Icon(Icons.add),
      ),

      body: state.when(

        loading: () {

          return const Center(
            child:
                CircularProgressIndicator(),
          );
        },

        error: (e, st) {

          return Center(
            child: Text(
              e.toString(),
            ),
          );
        },

        data: (employees) {

          return RefreshIndicator(

            onRefresh: () async {

              await notifier
                  .refreshEmployees();
            },

            child:
                NotificationListener<
                    ScrollNotification>(

              onNotification:
                  (scrollInfo) {

                if (scrollInfo
                        .metrics
                        .pixels ==
                    scrollInfo
                        .metrics
                        .maxScrollExtent) {

                  notifier.loadMore();
                }

                return false;
              },

              child: ListView.builder(

                itemCount:
                    employees.length,

                itemBuilder:
                    (context, index) {

                  final employee =
                      employees[index];

                  return ListTile(

                    title: Text(
                      employee.name,
                    ),

                    subtitle: Text(
                      employee.designation,
                    ),

                    trailing: Row(

                      mainAxisSize:
                          MainAxisSize.min,

                      children: [

                        /// UPDATE
                        IconButton(

                          onPressed: () {

                            notifier
                                .updateEmployee(

                              employee.copyWith(
                                designation:
                                    "Senior Flutter Dev",
                              ),
                            );
                          },

                          icon: const Icon(
                            Icons.edit,
                          ),
                        ),

                        /// DELETE
                        IconButton(

                          onPressed: () {

                            notifier
                                .deleteEmployee(
                              employee.id,
                            );
                          },

                          icon: const Icon(
                            Icons.delete,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}''',
          ),
          PointersView(text: 'UI Screen Stateful Widget'),
         CodeView(code: '''class EmployeeScreen extends ConsumerStatefulWidget {

  const EmployeeScreen({
    super.key,
  });

  @override
  ConsumerState<EmployeeScreen>
      createState() =>
          _EmployeeScreenState();
}

class _EmployeeScreenState
    extends ConsumerState<EmployeeScreen> {

  final ScrollController
      _scrollController =
          ScrollController();

  @override
  void initState() {

    super.initState();

    _scrollController.addListener(
      _paginationListener,
    );
  }

  void _paginationListener() {

    if (_scrollController.position.pixels >=
        _scrollController
                .position
                .maxScrollExtent -
            200) {

      ref
          .read(
            employeeProvider.notifier,
          )
          .loadMore();
    }
  }

  @override
  void dispose() {

    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final state =
        ref.watch(employeeProvider);

    final notifier =
        ref.read(
          employeeProvider.notifier,
        );

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Employees",
        ),
      ),

      floatingActionButton:
          FloatingActionButton(

        onPressed: () {

          notifier.addEmployee(

            Employee(
              id: 0,
              name: "Shadab",
              designation:
                  "Flutter Developer",
            ),
          );
        },

        child: const Icon(Icons.add),
      ),

      body: state.when(

        /// LOADING
        loading: () {

          return const Center(
            child:
                CircularProgressIndicator(),
          );
        },

        /// ERROR
        error: (error, stackTrace) {

          return Center(
            child: Text(
              error.toString(),
            ),
          );
        },

        /// DATA
        data: (employees) {

          if (employees.isEmpty) {

            return const Center(
              child: Text(
                "No Employees Found",
              ),
            );
          }

          return RefreshIndicator(

            onRefresh: () async {

              await notifier
                  .refreshEmployees();
            },

            child: ListView.builder(

              controller:
                  _scrollController,

              padding:
                  const EdgeInsets.all(12),

              itemCount:
                  employees.length,

              itemBuilder:
                  (context, index) {

                final employee =
                    employees[index];

                return Card(

                  margin:
                      const EdgeInsets.only(
                    bottom: 12,
                  ),

                  child: ListTile(

                    contentPadding:
                        const EdgeInsets.all(
                      12,
                    ),

                    title: Text(
                      employee.name,
                    ),

                    subtitle: Text(
                      employee.designation,
                    ),

                    trailing: Row(

                      mainAxisSize:
                          MainAxisSize.min,

                      children: [

                        /// UPDATE
                        IconButton(

                          onPressed: () {

                            notifier
                                .updateEmployee(

                              employee.copyWith(
                                designation:
                                    "Senior Flutter Developer",
                              ),
                            );
                          },

                          icon: const Icon(
                            Icons.edit,
                          ),
                        ),

                        /// DELETE
                        IconButton(

                          onPressed: () {

                            notifier
                                .deleteEmployee(
                              employee.id,
                            );
                          },

                          icon: const Icon(
                            Icons.delete,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}''')
        ],
      ),
    );
  }
}
