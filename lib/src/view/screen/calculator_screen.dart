import 'package:advanced_calculator/src/view/widget/calculator_widgets.dart';
import 'package:advanced_calculator/core/button_styles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

bool mode = false;

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(FontAwesome.vial_solid, size: 16),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButton(
              style: MyButtonTheme.appBarButtonTheme(size),
              onPressed: () {},
              child: const Text(
                "Calculator",
                style: TextStyle(fontSize: 12),
                maxLines: 1,
              ),
            ),
            TextButton(
              style: MyButtonTheme.appBarButtonTheme(size),
              onPressed: () {
                Navigator.popAndPushNamed(context, "/graph");
              },
              child: const Text(
                "Graph",
                style: TextStyle(fontSize: 12),
                maxLines: 1,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.dark_mode_outlined, size: 24),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 12),
              width: size.width,
              child: const ProcessTextWidget(),
            ),
            SizedBox(
              width: size.width,
              child: const ResultTextWidget(),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  showDragHandle: true,
                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheetWidget(size: size);
                  },
                );
              },
              icon: const Icon(FontAwesome.clock, size: 20),
            ),
            Divider(
              thickness: 2.0,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              height: size.height / 2,
              child:
                  mode ? const BasicButtonsWidget() : const SciButtonsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
