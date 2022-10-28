import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:study_app/configs/themes/app_colors.dart';

import 'package:study_app/extensions/context_extension.dart';
import 'package:study_app/providers/all_providers.dart';

class MyMenuScreen extends ConsumerWidget {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(25),
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient(context)),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: onSurfaceTextColor),
          ),
        ),
        child: SafeArea(
            child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: BackButton(
                color: Colors.white,
                onPressed: () {
                  ref.read(zoomDrawerProvider).toogleDrawer();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: context.width * 0.3),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    children: [
                      ref.watch(authControllerProvider).auth.currentUser == null
                          ? const SizedBox()
                          : Text(
                              ref
                                      .watch(authControllerProvider)
                                      .auth
                                      .currentUser!
                                      .displayName ??
                                  "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: onSurfaceTextColor),
                            ),
                      const Spacer(),
                      _DrawerButton(
                        icon: Icons.web,
                        label: "website",
                        onTap: () => ref.read(zoomDrawerProvider).website(),
                      ),
                      _DrawerButton(
                        icon: Icons.facebook,
                        label: "twitter",
                        onTap: () => ref.read(zoomDrawerProvider).website(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: _DrawerButton(
                          icon: Icons.email,
                          label: "email",
                          onTap: () => ref.read(zoomDrawerProvider).email(),
                        ),
                      ),
                      const Spacer(flex: 4),
                      _DrawerButton(
                          icon: Icons.logout,
                          label: "logout",
                          onTap: () {
                            ref.read(authControllerProvider).signOut(context);
                            setState(() {});
                          })
                    ],
                  );
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  const _DrawerButton({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onTap,
        icon: Icon(
          icon,
          size: 15,
        ),
        label: Text(label));
  }
}
