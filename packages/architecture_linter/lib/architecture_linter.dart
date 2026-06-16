import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'src/rules/no_arbitrary_spacing.dart';
import 'src/rules/no_business_logic_in_build.dart';
import 'src/rules/no_data_layer_import_in_presentation.dart';
import 'src/rules/no_direct_http_in_ui.dart';
import 'src/rules/no_hardcoded_colors.dart';
import 'src/rules/no_hardcoded_strings.dart';
import 'src/rules/no_new_dio_instance.dart';
import 'src/rules/no_repository_in_ui.dart';

/// Entry point discovered by `custom_lint`.
PluginBase createPlugin() => _ArchitectureLinterPlugin();

class _ArchitectureLinterPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => <LintRule>[
    NoHardcodedStrings(),
    NoHardcodedColors(),
    NoArbitrarySpacing(),
    NoRepositoryInUi(),
    NoDataLayerImportInPresentation(),
    NoDirectHttpInUi(),
    NoNewDioInstance(),
    NoBusinessLogicInBuild(),
  ];
}
