import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:testing/features/base_for_application/base_component_page.dart';
import 'package:testing/features/user_summary/presenter/user_summary_bloc.dart';

class BaseForApplicationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    return BlocProvider(
      blocs: [
        Bloc((i) => UserSummaryBloc()),
      ],
      child: MaterialApp(
        home: BaseComponentPage(
          platform: platform,
        ),
      ),
    );
  }
}
