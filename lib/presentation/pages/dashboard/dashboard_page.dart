import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/constants.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/utils/utils.dart';
import '../../../data/models/models.dart';
import 'widgets/widgets.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final list = [
      CardsResumeModels(
        icon: PathIconsConst.computador,
        name: 'Total',
        number: 12.toString(),
      ),
      CardsResumeModels(
        icon: PathIconsConst.nuvem,
        name: 'Total',
        number: "91%",
      ),
      CardsResumeModels(
        icon: PathIconsConst.perigo,
        name: 'Total',
        number: 11.toString(),
      ),
      CardsResumeModels(
        icon: PathIconsConst.equipe,
        name: 'Total',
        number: 21.toString(),
      ),
    ];
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: DrawerWidget(),
        ),
        body: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(Layout.defaultPadding),
                width: double.infinity,
                height: Get.height,
                color: Color(0xFF212332),
                child: ListView(
                  children: [
                    HeaderPanelWidget(scaffoldKey: _scaffoldKey),
                    withSpaceHeight(),
                    Column(
                      children: [
                        Responsive(
                          mobile: InfoCardGridView(
                            list: list,
                            childAspectRatio: 1.2,
                            crossAxisCount: 2,
                            sizeText: 30,
                            heightText: 1,
                          ),
                          desktop: InfoCardGridView(
                            list: list,
                            childAspectRatio: 1.2,
                            heightText: 1.1,
                          ),
                          tablet: InfoCardGridView(
                            list: list,
                          ),
                        ),
                        withSpaceHeight(size: Get.height.percent(10)),
                        withSpaceHeight(size: 10),
                        Container(
                          padding: EdgeInsets.all(Layout.defaultPadding),
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Layout.defaultBorderRadius),
                            color: Colors.white.withOpacity(0.1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeaderTableWidget(
                                title: 'PGE',
                              ),
                              SizedBox(
                                width: Get.width,
                                child: TableWidget(
                                  columns: [
                                    'NOME',
                                    'CNPJ',
                                    'PEP',
                                    'ORDINÁRIO',
                                    'VAL. AUTUAÇAO',
                                    'VAL. DECLARADO'
                                  ],
                                  rows: [
                                    [
                                      'REFRIX ENVASADORA DE BEBIDAS LTDA',
                                      '72.459.878/0001-09',
                                      '-',
                                      '-',
                                      'R\$ 5.783.168,03',
                                      'R\$ 562.886,31',
                                    ],
                                    [
                                      'REFRIX ENVASADORA DE BEBIDAS LTDA',
                                      '72.459.878/0001-09',
                                      '-',
                                      '-',
                                      'R\$ 5.783.168,03',
                                      'R\$ 562.886,31',
                                    ],
                                    [
                                      'REFRIX ENVASADORA DE BEBIDAS LTDA',
                                      '72.459.878/0001-09',
                                      '-',
                                      '-',
                                      'R\$ 5.783.168,03',
                                      'R\$ 562.886,31',
                                    ],
                                    [
                                      'REFRIX ENVASADORA DE BEBIDAS LTDA',
                                      '72.459.878/0001-09',
                                      '-',
                                      '-',
                                      'R\$ 5.783.168,03',
                                      'R\$ 562.886,31',
                                    ],
                                    [
                                      'REFRIX ENVASADORA DE BEBIDAS LTDA',
                                      '72.459.878/0001-09',
                                      '-',
                                      '-',
                                      'R\$ 5.783.168,03',
                                      'R\$ 562.886,31',
                                    ],
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        withSpaceHeight(size: 20),
                        Container(
                          padding: EdgeInsets.all(Layout.defaultPadding),
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Layout.defaultBorderRadius),
                            color: Colors.white.withOpacity(0.1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeaderTableWidget(
                                title: 'ADV',
                              ),
                              SizedBox(
                                width: Get.width,
                                child: TableWidget(
                                  columns: [
                                    'AIIM',
                                    'DRT',
                                    'DATA (INICIO)',
                                    'AUTUADO',
                                    'ASSUNTO'
                                  ],
                                  rows: [
                                    [
                                      '3412344',
                                      'CAPITAL II',
                                      '23/03/2021',
                                      'CREACOES DANILO LTDA',
                                      'NENHUM ADVOGADO/PRO DEFESA ....'
                                    ],
                                    [
                                      '3412344',
                                      'CAPITAL II',
                                      '23/03/2021',
                                      'CREACOES DANILO LTDA',
                                      'NENHUM ADVOGADO/PRO DEFESA ....'
                                    ],
                                    [
                                      '3412344',
                                      'CAPITAL II',
                                      '23/03/2021',
                                      'CREACOES DANILO LTDA',
                                      'NENHUM ADVOGADO/PRO DEFESA ....'
                                    ],
                                    [
                                      '3412344',
                                      'CAPITAL II',
                                      '23/03/2021',
                                      'CREACOES DANILO LTDA',
                                      'NENHUM ADVOGADO/PRO DEFESA ....'
                                    ],
                                    [
                                      '3412344',
                                      'CAPITAL II',
                                      '23/03/2021',
                                      'CREACOES DANILO LTDA',
                                      'NENHUM ADVOGADO/PRO DEFESA ....'
                                    ],
                                    [
                                      '3412344',
                                      'CAPITAL II',
                                      '23/03/2021',
                                      'CREACOES DANILO LTDA',
                                      'NENHUM ADVOGADO/PRO DEFESA ....'
                                    ]
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    withSpaceHeight(size: 45),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
