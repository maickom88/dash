import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/constants.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/utils/utils.dart';
import 'widgets/header_login_widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Layout.defaultPadding),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Layout.defaultPadding,
                  vertical: 60,
                ),
                width: Responsive.isMobile(context)
                    ? Get.width.percent(100)
                    : Get.width.percent(28),
                decoration: BoxDecoration(
                  color: Color(0xFFf5f6fa),
                  boxShadow: Layout.defaultBoxShadow,
                  borderRadius:
                      BorderRadius.circular(Layout.defaultBorderRadius),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: HeaderLoginWidget().withPaddingVertical(),
                      ),
                      Center(
                        child: Text(
                          "Faça login no painel",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Text(
                        "Email",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 0,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.grey),
                          decoration: InputDecoration(
                            hintText: "Digite seu email",
                          ),
                        ),
                      ).withPaddingVertical(size: 8),
                      Text(
                        "Senha",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 0,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          obscureText: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.grey),
                          decoration: InputDecoration(
                            hintText: "Digite sua senha",
                          ),
                        ),
                      ).withPaddingVertical(size: 8),
                      withSpaceHeight(),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.6),
                              spreadRadius: 0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () => Get.toNamed(RoutesConsts.dashboard),
                          child: Text("Entrar"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
