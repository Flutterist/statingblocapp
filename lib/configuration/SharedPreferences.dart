import 'package:shared_preferences/shared_preferences.dart';
import 'package:startingblocapp/models/employee.dart';

class AppSharedPreferences {
  static const String EMPLOYEE_KEY = 'Employee';

  Future<Employee> getEmployee() async {
    SharedPreferences preferences;
    await SharedPreferences.getInstance().then((value) {
      preferences = value;
      return preferences.getString(EMPLOYEE_KEY);
    });
  }

  Future saveEmployee(Employee employee) async {
    SharedPreferences preferences;
    await SharedPreferences.getInstance().then((value) {
      preferences = value;
      return preferences.getString(EMPLOYEE_KEY);
    });
  }

  Future<bool> deleteEmployee() async {
    SharedPreferences preferences;
    await SharedPreferences.getInstance().then((value) {
      preferences = value;
      return preferences.remove(EMPLOYEE_KEY);
    });
  }
}
