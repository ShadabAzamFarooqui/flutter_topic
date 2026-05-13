import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';
import 'package:learning/component/pointers_view.dart';
import 'package:learning/component/real_flow_view.dart';

import '../../component/custom_scaffold.dart';

class StateNotifierProviderExample extends StatelessWidget {
  const StateNotifierProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'State Notifier Provider Example',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'StateNotifierProvider'),
          NormalView(
            text:
                'StateNotifierProvider is used for complex and scalable business logic where multiple states and API handling are involved.',
          ),
          SizedBox(height: 6),
          NormalView(
            text:
                'In real applications like employee management, cart systems, or dashboard modules, StateNotifierProvider is preferred because it centralizes CRUD business logic, manages loading/error/data states cleanly, and keeps UI separate from API handling.',
          ),
          SizedBox(height: 10),

          PointersView(text: '1. Model'),
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

      designation:
          json["designation"],
    );
  }

  Map<String, dynamic> toJson() {

    return {

      "id": id,
      "name": name,
      "designation": designation,
    };
  }
}

/// COPY WITH
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


''',
          ),

          PointersView(text: '''2. Dio Provider'''),
          CodeView(
            code: '''final dioProvider =
    Provider<Dio>((ref) {

  return Dio(

    BaseOptions(

      baseUrl:
          "https://api.example.com",

      headers: {

        "Content-Type":
            "application/json",
      },

      connectTimeout:
          const Duration(seconds: 30),

      receiveTimeout:
          const Duration(seconds: 30),
    ),
  );
});''',
          ),
          PointersView(text: '''3. ApiService'''),
          CodeView(
            code: '''class ApiService {

  final Dio dio;

  ApiService(this.dio);

  /// GET EMPLOYEES
  Future<List<Employee>>
      getEmployees() async {

    try {

      final response =
          await dio.get(
        "/employees",
      );

      final data =
          response.data["data"] as List;

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
  Future<Employee> addEmployee({

    required String name,
    required String designation,

  }) async {

    try {

      final response =
          await dio.post(

        "/employees",

        data: {

          "name": name,
          "designation": designation,
        },
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
  Future<Employee> updateEmployee({

    required int id,
    required String name,
    required String designation,

  }) async {

    try {

      final response =
          await dio.put(

        "/employees/\$id",

        data: {

          "name": name,
          "designation": designation,
        },
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
}   ''',
          ),

          PointersView(text: '4. ApiService Provider'),
          CodeView(
            code: '''final apiServiceProvider =
    Provider<ApiService>((ref) {

  final dio =
      ref.read(dioProvider);

  return ApiService(dio);
});''',
          ),

          PointersView(text: '5. Employee State'),

          CodeView(
            code: '''class EmployeeState {

  final bool isLoading;

  final List<Employee> employees;

  final String? errorMessage;

  EmployeeState({

    required this.isLoading,

    required this.employees,

    this.errorMessage,
  });

  EmployeeState copyWith({

    bool? isLoading,

    List<Employee>? employees,

    String? errorMessage,

  }) {

    return EmployeeState(

      isLoading:
          isLoading ?? this.isLoading,

      employees:
          employees ?? this.employees,

      errorMessage:
          errorMessage,
    );
  }
}''',
          ),

          PointersView(text: '6. Employee Notifier'),
          CodeView(
            code: '''
class EmployeeNotifier extends StateNotifier<EmployeeState> {

  final ApiService apiService;

  EmployeeNotifier(this.apiService)

      : super(

          EmployeeState(

            isLoading: false,

            employees: [],
          ),
        );

  /// FETCH EMPLOYEES
  Future<void> fetchEmployees() async {

    try {

      state =
          state.copyWith(

            isLoading: true,

            errorMessage: null,
          );

      final response =
          await apiService.getEmployees();

      state =
          state.copyWith(

            isLoading: false,

            employees: response,
          );

    } catch (e) {

      state =
          state.copyWith(

            isLoading: false,

            errorMessage:
                e.toString(),
          );
    }
  }

  /// ADD EMPLOYEE
  Future<void> addEmployee({

    required String name,

    required String designation,

  }) async {

    try {

      final newEmployee =
          await apiService.addEmployee(

        name: name,

        designation: designation,
      );

      state =
          state.copyWith(

            employees: [

              ...state.employees,

              newEmployee,
            ],
          );

    } catch (e) {

      state =
          state.copyWith(

            errorMessage:
                e.toString(),
          );
    }
  }

  /// UPDATE EMPLOYEE
  Future<void> updateEmployee({

    required int id,

    required String name,

    required String designation,

  }) async {

    try {

      final updatedEmployee =
          await apiService.updateEmployee(

        id: id,

        name: name,

        designation: designation,
      );

      final updatedList =
          state.employees.map((e) {

        if (e.id == id) {

          return updatedEmployee;
        }

        return e;

      }).toList();

      state =
          state.copyWith(

            employees: updatedList,
          );

    } catch (e) {

      state =
          state.copyWith(

            errorMessage:
                e.toString(),
          );
    }
  }

  /// DELETE EMPLOYEE
  Future<void> deleteEmployee(
    int id,
  ) async {

    try {

      await apiService.deleteEmployee(id);

      final updatedList =
          state.employees
              .where((e) => e.id != id)
              .toList();

      state =
          state.copyWith(

            employees: updatedList,
          );

    } catch (e) {

      state =
          state.copyWith(

            errorMessage:
                e.toString(),
          );
    }
  }
}''',
          ),
          PointersView(text: '7. Employee Notifier Provider'),
          CodeView(
            code: '''
final employeeProvider = StateNotifierProvider<EmployeeNotifier, EmployeeState>((ref) {

  final apiService =
      ref.read(apiServiceProvider);

  return EmployeeNotifier(
    apiService,
  );
});''',
          ),

          PointersView(text: '8. UI Screen'),

          CodeView(
            code: '''
class EmployeeScreen extends ConsumerStatefulWidget {

  const EmployeeScreen({
    super.key,
  });

  @override
  ConsumerState<EmployeeScreen>
      createState() {

    return _EmployeeScreenState();
  }
}

class _EmployeeScreenState
    extends ConsumerState<EmployeeScreen> {

  @override
  void initState() {

    super.initState();

    Future.microtask(() {
    ref.read(employeeProvider.notifier)
      .fetchEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {

    final state =
        ref.watch(employeeProvider);

    return Scaffold(

      appBar: AppBar(
        title: const Text("Employees"),
      ),

      body: Builder(

        builder: (context) {

          /// LOADING
          if (state.isLoading) {

            return const Center(

              child:
                  CircularProgressIndicator(),
            );
          }

          /// ERROR
          if (state.errorMessage != null) {

            return Center(

              child:
                  Text(state.errorMessage!),
            );
          }

          /// NO RECORD FOUND
          if (state.employees.isEmpty) {

            return const Center(

              child:
                  Text("No Records Found"),
            );
          }

          /// DATA AVAILABLE
          return ListView.builder(

            itemCount:
                state.employees.length,

            itemBuilder: (context, index) {

              final employee =
                  state.employees[index];

              return ListTile(

                title:
                    Text(employee.name),

                subtitle:
                    Text(employee.designation),

                trailing: Row(

                  mainAxisSize:
                      MainAxisSize.min,

                  children: [

                    /// UPDATE
                    IconButton(

                      onPressed: () {

                        ref
                        .read(
                          employeeProvider
                              .notifier,
                        )
                        .updateEmployee(

                          id: employee.id,

                          name:
                              "Updated Name",

                          designation:
                              employee.designation,
                        );
                      },

                      icon:
                          const Icon(Icons.edit),
                    ),

                    /// DELETE
                    IconButton(

                      onPressed: () {

                        ref
                        .read(
                          employeeProvider
                              .notifier,
                        )
                        .deleteEmployee(
                          employee.id,
                        );
                      },

                      icon:
                          const Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),

      floatingActionButton:
          FloatingActionButton(

        onPressed: () {

          ref
          .read(
            employeeProvider.notifier,
          )
          .addEmployee(

            name: "New Employee",

            designation:
                "Flutter Developer",
          );
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}''',
          ),

          RealFlowView(
            text: '''UI
 ↓
StateNotifierProvider
 ↓
LoginNotifier
 ↓
ApiService / Repository
 ↓
API Response
 ↓
State Updated
 ↓
UI Rebuild''',
          ),
        ],
      ),
    );
  }
}
