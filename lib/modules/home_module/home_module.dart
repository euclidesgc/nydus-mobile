import 'package:package_manager/package_manager.dart';

import '../clocking_module/clocking_module.dart';
import '../dashboard_module/dashboard_module.dart';
import '../downloads_module/downloads_module.dart';
import '../earnings_statement_module/earnings_statement_module.dart';
import '../evaluation_module/evaluation_module.dart';
import '../messages_module/messages_module.dart';
import '../notice_board_module/notice_board_module.dart';
import '../paycheck_module/paycheck_module.dart';
import '../profile_module/profile_module.dart';
import '../salary_history_module/salary_history_module.dart';
import '../time_bank_module/time_bank_module.dart';
import '../vacation_module/vacation_module.dart';
import 'home/home_controller.dart';
import 'home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          transition: TransitionType.fadeIn,
          duration: const Duration(milliseconds: 500),
          child: (context, args) => HomePage(
            controller: Modular.get<HomeController>(),
          ),
          children: [
            ModuleRoute(
              '/paychek_module',
              module: PaycheckModule(),
              transition: TransitionType.fadeIn,
              duration: const Duration(milliseconds: 500),
            ),
            ModuleRoute(
              '/clocking_module',
              module: ClockingModule(),
              transition: TransitionType.fadeIn,
              duration: const Duration(milliseconds: 500),
            ),
            ModuleRoute(
              '/dashboard_module',
              module: DashboardModule(),
              transition: TransitionType.fadeIn,
              duration: const Duration(milliseconds: 500),
            ),
            ModuleRoute(
              '/vacation_module',
              module: VacationModule(),
              transition: TransitionType.fadeIn,
              duration: const Duration(milliseconds: 500),
            ),
            ModuleRoute(
              '/profile_module',
              module: ProfileModule(),
              transition: TransitionType.fadeIn,
              duration: const Duration(milliseconds: 500),
            ),
            ModuleRoute(
              '/time_bank_module',
              module: TimeBankModule(),
              transition: TransitionType.fadeIn,
              duration: const Duration(milliseconds: 500),
            ),
            ModuleRoute(
              '/earnings_statement_module',
              module: EarningsStatementModule(),
              transition: TransitionType.fadeIn,
              duration: const Duration(milliseconds: 500),
            ),
            ModuleRoute(
              '/messages_module',
              module: MessagesModule(),
              transition: TransitionType.fadeIn,
              duration: const Duration(milliseconds: 500),
            ),
            ModuleRoute(
              '/notice_board_module',
              module: NoticeBoardModule(),
              transition: TransitionType.fadeIn,
              duration: const Duration(milliseconds: 500),
            ),
            ModuleRoute(
              '/salary_history_module',
              module: SalaryHistoryModule(),
              transition: TransitionType.fadeIn,
              duration: const Duration(milliseconds: 500),
            ),
            ModuleRoute(
              '/evaluation_module',
              module: EvaluationModule(),
              transition: TransitionType.fadeIn,
              duration: const Duration(milliseconds: 500),
            ),
            ModuleRoute(
              '/downloads_module',
              module: DownloadsModule(),
              transition: TransitionType.fadeIn,
              duration: const Duration(milliseconds: 500),
            ),
          ],
        ),
      ];
}
