import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yande_gui/global.dart';
import 'package:yande_gui/i18n.dart';
import 'package:yande_gui/pages/downloads/logic.dart';
import 'package:yande_gui/services/settings_service.dart';
import 'package:yande_gui/widgets/auto_scaffold/auto_scaffold.dart';
import 'package:path/path.dart' as path;

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget buildItem({
    required Widget title,
    Widget? subtitle,
    Widget? leading,
    Function()? onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: leading,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: title,
        subtitle: subtitle,
        onTap: onTap,
      ),
    );
  }

  String themeModeToText(int? themeMode) {
    switch (themeMode) {
      case null:
        return i18n.settings.system;
      case 0:
        return i18n.settings.light;
      case 1:
        return i18n.settings.dark;
    }
    return 'Unknown';
  }

  String languageToText(int? language) {
    return switch (language) {
      null => i18n.settings.system,
      0 => 'English',
      1 => '日本語',
      2 => '繁體中文',
      _ => 'Unknown',
    };
  }

  String waterfallColumns(int? columns) {
    return switch (columns) {
      null => 'Auto',
      final value => value.toString(),
    };
  }

  String maxActiveDownloadTasks(int max) {
    return max.toString();
  }

  String maxParallelSegmentsPerDownloadTask(int max) {
    return max.toString();
  }

  void _themeModeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(i18n.settings.themeModeDialog.title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<int?>(
                title: Text(i18n.settings.system),
                value: null,
                groupValue: SettingsService.themeMode,
                onChanged: (value) {
                  SettingsService.themeMode = value;
                  rootUpdateController.add(null);
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile<int>(
                title: Text(i18n.settings.light),
                value: 0,
                groupValue: SettingsService.themeMode,
                onChanged: (value) {
                  SettingsService.themeMode = value;
                  rootUpdateController.add(null);
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile<int>(
                title: Text(i18n.settings.dark),
                value: 1,
                groupValue: SettingsService.themeMode,
                onChanged: (value) {
                  SettingsService.themeMode = value;
                  rootUpdateController.add(null);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(i18n.generic.cancel),
            ),
          ],
        );
      },
    );
  }

  void _languageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(i18n.settings.languageDialog.title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<int?>(
                title: Text(i18n.settings.system),
                value: null,
                groupValue: SettingsService.language,
                onChanged: (value) {
                  SettingsService.language = value;
                  I18n.update(I18n.getLocale(value));
                  rootUpdateController.add(null);
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile<int>(
                title: const Text('English'),
                value: 0,
                groupValue: SettingsService.language,
                onChanged: (value) {
                  SettingsService.language = value;
                  I18n.update(I18n.getLocale(value));
                  rootUpdateController.add(null);
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile<int>(
                title: const Text('日本語'),
                value: 1,
                groupValue: SettingsService.language,
                onChanged: (value) {
                  SettingsService.language = value;
                  I18n.update(I18n.getLocale(value));
                  rootUpdateController.add(null);
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile<int>(
                title: const Text('繁體中文'),
                value: 2,
                groupValue: SettingsService.language,
                onChanged: (value) {
                  SettingsService.language = value;
                  I18n.update(I18n.getLocale(value));
                  rootUpdateController.add(null);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(i18n.generic.cancel),
            ),
          ],
        );
      },
    );
  }

  void _downloadPathDialog() {
    final textController = TextEditingController(text: SettingsService.downloadPath);
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Select Download Path'),
          content: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      hintText: 'Platform Default',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          FilePicker.platform.getDirectoryPath(dialogTitle: 'Select a directory').then((value) {
                            if (value != null) {
                              textController.text = value;
                            }
                          });
                        },
                        child: const Text('Pick'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          textController.clear();
                        },
                        child: const Text('Clear'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: const Text('Confirm'),
              onPressed: () {
                final dir = textController.text;

                if (dir.isEmpty) {
                  SettingsService.downloadPath = null;
                  EasyLoading.showInfo('Download path set to platform default');
                  setState(() {});
                  Navigator.of(context).pop();
                  return;
                }
                if (path.isRelative(dir)) {
                  EasyLoading.showError('Path must be absolute');
                  return;
                }

                try {
                  final mode = Directory(dir).statSync().mode;

                  final hasWritePermission = (mode & 0x80) != 0;

                  if (!hasWritePermission) {
                    EasyLoading.showError('Path is not writable');
                    return;
                  }
                } catch (e) {
                  EasyLoading.showError(e.toString());
                  return;
                }

                SettingsService.downloadPath = textController.text;
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _waterfallColumnsDialog() {
    showDialog(
      context: context,
      builder: (context) {
        double currentSliderValue = ((SettingsService.waterfallColumns ?? 0)).toDouble();

        if (currentSliderValue != 0) {
          currentSliderValue -= 1;
        }

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(i18n.settings.setWaterfallColumnsDialog.title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Slider(
                    value: currentSliderValue,
                    min: 0,
                    max: 9,
                    divisions: 9,
                    label: switch (currentSliderValue) {
                      0 => 'Auto',
                      final value => (value.toInt() + 1).toString(),
                    },
                    onChanged: (double value) {
                      setState(() {
                        currentSliderValue = value;
                      });
                    },
                  ),
                  Text(switch (currentSliderValue) {
                    0 => 'Auto',
                    final value => (value.toInt() + 1).toString(),
                  }),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    SettingsService.waterfallColumns = currentSliderValue == 0 ? null : currentSliderValue.toInt() + 1;
                    rootUpdateController.add(null);
                    Navigator.of(context).pop();
                  },
                  child: Text(i18n.generic.confirm),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _maxActiveDownloadTasksDialog() {

    showDialog(
      context: context,
      builder: (context) {
        int currentSliderValue = SettingsService.maxActiveDownloadTasks;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(i18n.settings.setMaxActiveDownloadTasksDialog.title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Slider(
                    value: currentSliderValue.toDouble(),
                    min: 1,
                    max: 4,
                    divisions: 3,
                    label: currentSliderValue.toString(),
                    onChanged: (double value) {
                      setState(() {
                        currentSliderValue = value.toInt();
                      });
                    },
                  ),
                  Text(
                    currentSliderValue.toString(),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    SettingsService.maxActiveDownloadTasks = currentSliderValue.toInt();
                    Downloader.updateDownloadIsolateMaxActiveDownloadTasks(currentSliderValue.toInt());
                    rootUpdateController.add(null);
                    Navigator.of(context).pop();
                  },
                  child: Text(i18n.generic.confirm),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _maxParallelSegmentsPerDownloadTaskDialog() {

    showDialog(
      context: context,
      builder: (context) {
        int currentSliderValue = SettingsService.maxParallelSegmentsPerDownloadTask;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(i18n.settings.setMaxParallelSegmentsPerDownloadTaskDialog.title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Slider(
                    value: currentSliderValue.toDouble(),
                    min: 1,
                    max: 6,
                    divisions: 5,
                    label: currentSliderValue.toString(),
                    onChanged: (double value) {
                      setState(() {
                        currentSliderValue = value.toInt();
                      });
                    },
                  ),
                  Text(
                    currentSliderValue.toString(),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    SettingsService.maxParallelSegmentsPerDownloadTask = currentSliderValue.toInt();
                    rootUpdateController.add(null);
                    Navigator.of(context).pop();
                  },
                  child: Text(i18n.generic.confirm),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutoScaffold(
      verticalOnlyTitleWidget: Text(i18n.settings.title),
      builder: (context, horizontal) {
        return ListView(
          children: [
            buildItem(
              title: Text(i18n.settings.language),
              leading: const Icon(Icons.language),
              subtitle: Text(languageToText(SettingsService.language)),
              onTap: () {
                _languageDialog();
              },
            ),
            buildItem(
              title: Text(i18n.settings.theme),
              leading: switch (Theme.of(context).brightness) {
                Brightness.dark => const Icon(Icons.dark_mode_outlined),
                Brightness.light => const Icon(Icons.light_mode_outlined),
              },
              subtitle: Text(themeModeToText(SettingsService.themeMode)),
              onTap: () {
                _themeModeDialog();
              },
            ),
            buildItem(
              title: Text(i18n.settings.waterfallColumns),
              leading: const Icon(Icons.view_column_outlined),
              subtitle: Text(waterfallColumns(SettingsService.waterfallColumns)),
              onTap: () {
                _waterfallColumnsDialog();
              },
            ),
            buildItem(
              title: Text(i18n.settings.maxActiveDownloadTasks),
              leading: const Icon(Icons.grading_outlined),
              subtitle: Text(maxActiveDownloadTasks(SettingsService.maxActiveDownloadTasks)),
              onTap: () {
                _maxActiveDownloadTasksDialog();
              },
            ),
            buildItem(
              title: Text(i18n.settings.maxParallelSegments),
              leading: const Icon(Icons.segment_outlined),
              subtitle: Text(maxParallelSegmentsPerDownloadTask(SettingsService.maxParallelSegmentsPerDownloadTask)),
              onTap: () {
                _maxParallelSegmentsPerDownloadTaskDialog();
              },
            ),
            if (Platform.isWindows || Platform.isLinux || Platform.isMacOS)
              buildItem(
                title: Text(i18n.settings.downloadPath),
                leading: const Icon(Icons.save_alt_outlined),
                subtitle: Text(SettingsService.downloadPath ?? i18n.settings.platformDefault),
                onTap: () {
                  _downloadPathDialog();
                },
              ),
          ],
        );
      },
    );
  }
}
