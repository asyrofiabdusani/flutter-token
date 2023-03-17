import 'package:demo_aether/tokens/dart/dart_color.dart';
import 'package:demo_aether/tokens/dart/dart_font.dart';

import 'aether.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool checkboxValue = false;
  bool chipValue = false;
  int radioValue1 = 0;
  int radioValue2 = 0;
  bool _switchValue = false;

  void _handleRadioValueChanged1(int? value) {
    setState(() {
      radioValue1 = value!;
    });
  }

  void _handleRadioValueChanged2(int? value) {
    setState(() {
      radioValue2 = value!;
    });
  }

  void _handleSwitchValueChanged(bool value) {
    setState(() {
      _switchValue = value;
    });
    // print(_switchValue);
  }

  final List<Map> _data = [
    {
      'NoKontrak': 5324141242,
      'NamaNasabah': 'Ahmad Sobari',
      'status': 'Disetujui',
      'approve': true,
    },
    {
      'NoKontrak': 1238419514,
      'NamaNasabah': 'Caca Marica',
      'status': 'Disetujui',
      'approve': true,
    },
    {
      'NoKontrak': 8865754643,
      'NamaNasabah': 'Bahrun Mishar',
      'status': 'Ditolak',
      'approve': false,
    }
  ];

  final data2 = <Data>[
    Data(5324141242, 'Ahmad Sobari', true),
    Data(1238419514, 'Caca Marica', true),
    Data(8865754643, 'Bahrun Mishar', false),
  ];

  var success = "Disetujui";

  List<bool> _selectedTable = [];
  String _selectedItem = 'Item 1';
  final List<String> _dropdownItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  bool showAlert = false;
  bool showAlertInfo = false;
  bool showAlertWarning = false;
  bool showAlertError = false;

  void _showAlert() {
    setState(() {
      showAlert = !showAlert;
    });
  }

  void _showAlertInfo() {
    setState(() {
      showAlertInfo = !showAlertInfo;
    });
  }

  void _showAlertWarning() {
    setState(() {
      showAlertWarning = !showAlertWarning;
    });
  }

  void _showAlertError() {
    setState(() {
      showAlertError = !showAlertError;
    });
  }

  String judulButton = 'show alert success';

  void _callAlert(String foo) {
    setState(() {
      foo = 'foo';
      // tipealert = !value;
    });
    foo = 'xxx';
    print(judulButton);
  }

  @override
  void initState() {
    super.initState();
    _selectedTable = List<bool>.generate(_data.length, (int index) => false);
  }

  @override
  Widget build(BuildContext context) {
    var children2 = [
      //ANCHOR Dialog/modal dialog
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Dialog',
              style: TextStyle(
                  fontWeight: adrFont.weightBold,
                  fontSize: adrFont.body1FontSize),
            ),
          ),
          AdButtonPrimary(
            text: 'Open Dialog',
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AdAlertDialog(
                    icon: const Icon(Icons.warning_amber_rounded),
                    title: const Text('Title'),
                    content: const Text('Supporting Text'),
                    actions: [
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          AdButtonText(text: 'Action 2', onPressed: () {}),
                          AdButtonPrimary(text: 'Action 1', onPressed: () {}),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),

      // ANCHOR alert button
      Container(
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Alert',
          style: TextStyle(
              fontWeight: adrFont.weightBold, fontSize: adrFont.body1FontSize),
        ),
      ),
      showAlert
          ? _adAlert(Model.success, () => _showAlert())
          : const SizedBox(),
      showAlertInfo
          ? _adAlert(Model.info, () => _showAlertInfo())
          : const SizedBox(),
      showAlertWarning
          ? _adAlert(Model.warning, () => _showAlertWarning())
          : const SizedBox(),
      showAlertError
          ? _adAlert(Model.error, () => _showAlertError())
          : const SizedBox(),
      Row(
        children: [
          AdButtonPrimary(
            text: 'Show Alert Success',
            onPressed: () => _showAlert(),
          ),
          AdButtonPrimary(
            text: 'Show Alert Info',
            onPressed: () => _showAlertInfo(),
          ),
          AdButtonPrimary(
            text: 'Show Alert Warning',
            onPressed: () => _showAlertWarning(),
          ),
          AdButtonPrimary(
            text: 'Show Alert Error',
            onPressed: () => _showAlertError(),
          ),
        ],
      ),
      // _adAlert(Model.info, null),
      // _adAlert(Model.warning, null),
      // _adAlert(Model.error, null),
      Container(
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Button',
          style: TextStyle(
              fontWeight: adrFont.weightBold, fontSize: adrFont.body1FontSize),
        ),
      ),

      //ANCHOR button style
      Column(
        children: [
          //? hover transparent
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AdButtonPrimary(text: ('Primary'), onPressed: () {}),
              AdButtonPrimaryIcon(
                  text: 'Primary',
                  onPressed: () {},
                  icon: Icons.add_circle_outline),
              AdButtonSecondary(text: 'Secondary', onPressed: () {}),
              AdButtonSecondaryIcon(
                  text: 'Secondary',
                  onPressed: () {},
                  icon: Icons.add_circle_outline),
              AdButtonText(text: 'text', onPressed: () {}),
              AdButtonTextIcon(
                  text: 'text',
                  onPressed: () {},
                  icon: Icons.add_circle_outline),
              AdButtonIcon(icon: Icons.add_circle_outline, onPressed: () {}),
            ],
          ),

          //? hover coloring
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AdButtonPrimary(
                text: ('Primary'),
                onPressed: () {},
                danger: true,
              ),
              AdButtonPrimaryIcon(
                text: 'Primary',
                onPressed: () {},
                icon: Icons.add_circle_outline,
                danger: true,
              ),
              AdButtonSecondary(
                text: 'Secondary',
                onPressed: () {},
                danger: true,
              ),
              AdButtonSecondaryIcon(
                text: 'Secondary',
                onPressed: () {},
                icon: Icons.add_circle_outline,
                danger: true,
              ),
              AdButtonText(
                text: 'text',
                onPressed: () {},
                danger: true,
              ),
              AdButtonTextIcon(
                text: 'text',
                onPressed: () {},
                icon: Icons.add_circle_outline,
                danger: true,
              ),
              AdButtonIcon(
                icon: Icons.add_circle_outline,
                onPressed: () {},
                danger: true,
              ),
            ],
          ),
        ],
      ),

      //ANCHOR checkboxes
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Checkbox',
              style: TextStyle(
                  fontWeight: adrFont.weightBold,
                  fontSize: adrFont.body1FontSize),
            ),
          ),

          //? without label
          AdCheckbox(
              value: checkboxValue,
              onChanged: (bool? value) {
                setState(() {
                  checkboxValue = value!;
                });
              }),

          //? with label
          AdCheckboxListTile(
              title: const Text('Label text'),
              subtitle: const Text('Helper text'),
              value: checkboxValue,
              onChanged: (bool? value) {
                setState(() {
                  checkboxValue = value!;
                });
              }),
        ],
      ),

      //ANCHOR Radio
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Radio',
              style: TextStyle(
                  fontWeight: adrFont.weightBold,
                  fontSize: adrFont.body1FontSize),
            ),
          ),

          //? Radio without label
          Column(
            children: [
              AdRadio(
                //activeColor: adrColor.textSuccess,
                //tileColor: adrColor.textSuccess,
                //selectedTileColor: adrColor.textSuccess,
                value: 0,
                groupValue: radioValue2,
                onChanged: _handleRadioValueChanged2,
                //onChanged: null,
              ),
              AdRadio(
                value: 1,
                groupValue: radioValue2,
                onChanged: _handleRadioValueChanged2,
              ),
              AdRadio(
                value: 2,
                groupValue: radioValue2,
                onChanged: _handleRadioValueChanged2,
              ),
            ],
          ),

          //? Radio with label
          Column(
            children: [
              AdRadioListTile(
                //activeColor: adrColor.textSuccess,
                //tileColor: adrColor.textSuccess,
                //selectedTileColor: adrColor.textSuccess,
                title: const Text('Option 1'),
                value: 0,
                groupValue: radioValue1,
                onChanged: _handleRadioValueChanged1,
                //onChanged: null,
              ),
              AdRadioListTile(
                title: const Text('Option 2'),
                value: 1,
                groupValue: radioValue1,
                onChanged: _handleRadioValueChanged1,
              ),
              AdRadioListTile(
                title: const Text('Option 3'),
                value: 2,
                groupValue: radioValue1,
                onChanged: _handleRadioValueChanged1,
              ),
            ],
          ),
        ],
      ),

      //ANCHOR togle/switcher
      Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Switch',
                  style: TextStyle(
                      fontWeight: adrFont.weightBold,
                      fontSize: adrFont.body1FontSize),
                ),
              ),
              AdSwitch(
                  value: _switchValue, onChanged: _handleSwitchValueChanged),
              AdSwitchListTile(
                value: _switchValue,
                onChanged: _handleSwitchValueChanged,
                title: const Text('Label Text'),
                subtitle: const Text('HelperText'),
              ),
            ],
          ),
        ],
      ),

      //ANCHOR - Chip
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Chip',
              style: TextStyle(
                  fontWeight: adrFont.weightBold,
                  fontSize: adrFont.body1FontSize),
            ),
          ),

          //? Chip without icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AdInputChip(
                label: const Text('Label'),
                onSelected: null,
                selected: chipValue,
              ),
              AdInputChip(
                label: const Text('Label'),
                onSelected: (bool value) {
                  setState(() {
                    chipValue = value;
                  });
                },
                selected: chipValue,
              ),
              AdInputChip.success(
                label: const Text('Label'),
                onSelected: (bool value) {
                  setState(() {
                    chipValue = value;
                  });
                },
                selected: chipValue,
              ),
              AdInputChip.warning(
                label: const Text('Label'),
                onSelected: (bool value) {
                  setState(() {
                    chipValue = value;
                  });
                },
                selected: chipValue,
              ),
              AdInputChip.error(
                label: const Text('Label'),
                onSelected: (bool value) {
                  setState(() {
                    chipValue = value;
                  });
                },
                selected: chipValue,
              ),
              AdInputChip.confirmed(
                label: const Text('Label'),
                onSelected: (bool value) {
                  setState(() {
                    chipValue = value;
                  });
                },
                selected: chipValue,
              ),
            ],
          ),

          //? Chip with icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // AdInputChip(
              //   label: const Text('Label'),
              //   onSelected: null,
              //   selected: chipValue,
              //   //onDeleted: () {},
              // ),
              AdInputChip(
                label: const Text('Label'),
                onSelected: (bool value) {
                  setState(() {
                    chipValue = value;
                  });
                },
                selected: chipValue,
                onDeleted: () {},
              ),
              AdInputChip.success(
                label: const Text('Label'),
                onSelected: (bool value) {
                  setState(() {
                    chipValue = value;
                  });
                },
                selected: chipValue,
                onDeleted: () {},
              ),
              AdInputChip.warning(
                label: const Text('Label'),
                onSelected: (bool value) {
                  setState(() {
                    chipValue = value;
                  });
                },
                selected: chipValue,
                onDeleted: () {},
              ),
              AdInputChip.error(
                label: const Text('Label'),
                onSelected: (bool value) {
                  setState(() {
                    chipValue = value;
                  });
                },
                selected: chipValue,
                onDeleted: () {},
              ),
              AdInputChip.confirmed(
                label: const Text('Label'),
                onSelected: (bool value) {
                  setState(() {
                    chipValue = value;
                  });
                },
                selected: chipValue,
                onDeleted: () {},
              ),
            ],
          ),
        ],
      ),

      //ANCHOR - Text field
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'TextField',
              style: TextStyle(
                  fontWeight: adrFont.weightBold,
                  fontSize: adrFont.body1FontSize),
            ),
          ),

          //? input text with icon & prefix
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AdTextFormField(
              decoration: const InputDecoration(
                label: Text('Label'),
                prefixIcon: Icon(Icons.phone),
                prefix: Text('+62'),
                hintText: 'email@adira.co.id',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Dropdown',
              style: TextStyle(
                  fontWeight: adrFont.weightBold,
                  fontSize: adrFont.body1FontSize),
            ),
          ),

          //? input with dropdown
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AdDropdownButtonFormField(
              decoration: const InputDecoration(
                  // prefixText: 'pref',
                  // prefixIcon: Icon(Icons.abc),
                  // prefix: Text('pref'),
                  // suffix: Text('suff'),
                  // suffixIcon: Icon(Icons.abc),
                  // suffixText: 'suff',
                  ),
              items: _dropdownItems.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? selectedItem) {
                setState(() {
                  _selectedItem = selectedItem!;
                });
              },
            ),
          ),
        ],
      ),

      //ANCHOR - table
      Column(
        children: [
          //? without pagination
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Table',
              style: TextStyle(
                  fontWeight: adrFont.weightBold,
                  fontSize: adrFont.body1FontSize),
            ),
          ),
          _demoDataTable(),

          //? with pagination
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.amber,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  'Paginated Table',
                  style: TextStyle(
                      fontWeight: adrFont.weightBold,
                      fontSize: adrFont.body1FontSize),
                ),
                AdPaginatedTable(
                  rowsPerPage: 2,
                  columns: _demoCreateColumns(),
                  source: DataNasabah(sourceData: data2),
                  showCheckboxColumn: false,
                ),
              ],
            ),
          ),
        ],
      ),

      //ANCHOR - card
      AdCard(
        // color: Colors.amber,
        elevation: 10,
        child: Column(
          children: [
            const ListTile(
              //leading: Icon(Icons.arrow_drop_down_circle),
              title: Text(
                'Card title',
                style: TextStyle(
                    fontSize: adrFont.subtitle1FontSize,
                    fontWeight: adrFont.weightMedium,
                    color: adrColor.textNormal),
              ),
              subtitle: Text(
                'Secondary Text',
                style: TextStyle(
                    fontSize: adrFont.labelFontSize,
                    color: adrColor.textNormal),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                  style: TextStyle(
                    color: adrColor.textNormal,
                    //fontSize: 2,
                    fontSize: adrFont.captionFontSize,
                    //fontWeight: adrFont.weightRegular,
                  ),
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                AdButtonText(text: 'Action 2', onPressed: () {}),
                AdButtonPrimary(text: 'Action 1', onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo'),
        ),
        body: ListView(
          children: children2,
        ),
      ),
    );
  }

  Widget _adAlert(model, closeAction) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AdAlert(
        message: const Text('This is alert Text'),
        title: 'Alert Title',
        alertType: model,
        showIcon: true,
        showCloseIcon: true,
        // closeAction: () {
        //   _showAlert();
        // },
        closeAction: closeAction,
      ),
    );
  }

  AdDataTable _demoDataTable() {
    return AdDataTable(
      columns: _demoCreateColumns(),
      rows: _demoCreateRows(),
      showCheckboxColumn: false,
    );
  }

  List<AdDataColumn> _demoCreateColumns() {
    return [
      const AdDataColumn(label: Text('No Kontrak')),
      const AdDataColumn(label: Text('Nama Nasabah')),
      const AdDataColumn(label: Text('Status Klaim')),
      const AdDataColumn(label: Text('Aksi')),
    ];
  }

  List<AdDataRow> _demoCreateRows() {
    return _data
        .mapIndexed((index, data) => AdDataRow(
                cells: [
                  AdDataCell(Text(data['NoKontrak'].toString())),
                  AdDataCell(Text(data['NamaNasabah'])),
                  AdDataCell(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (data['approve'] == true)
                          AdInputChip.success(label: Text(data['status']))
                        else
                          AdInputChip.warning(label: Text(data['status'])),
                      ],
                    ),
                  ),
                  AdDataCell(Row(
                    children: [
                      AdButtonText(text: ('Button 1'), onPressed: () {}),
                      AdButtonText(
                        text: ('Delete'),
                        onPressed: () {},
                        danger: true,
                      ),
                      AdButtonIcon(
                        icon: Icons.delete,
                        onPressed: () => print(data),
                        danger: true,
                      ),
                    ],
                  ))
                ],
                selected: _selectedTable[index],
                onSelectChanged: (bool? selected) {
                  setState(() {
                    _selectedTable[index] = selected!;
                  });
                }))
        .toList();
  }
}

class Data {
  Data(this.NoKontrak, this.NamaNasabah, this.approve);

  final int NoKontrak;
  final String NamaNasabah;
  final bool approve;

  bool selected = false;
}

class DataNasabah extends AdDataTableSource {
  DataNasabah({required this.sourceData});
  int _selectedCount = 0;
  final List<Data> sourceData;

  @override
  AdDataRow getRow(int index) {
    assert(index >= 0);
    final Data data = sourceData[index];
    return AdDataRow.byIndex(
        index: index,
        selected: data.selected,
        onSelectChanged: (bool? value) {
          if (data.selected != value) {
            _selectedCount += value! ? 1 : -1;
            assert(_selectedCount >= 0);
            data.selected = value;
            notifyListeners();
            print(data.NamaNasabah);
          }
        },
        cells: <AdDataCell>[
          AdDataCell(Text(data.NoKontrak.toString())),
          AdDataCell(Text(data.NamaNasabah)),
          AdDataCell(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (data.approve == true)
                  AdInputChip.success(label: const Text('Disetujui'))
                else
                  AdInputChip.warning(label: const Text('Ditolak')),
              ],
            ),
          ),
          AdDataCell(Row(
            children: [
              AdButtonText(text: ('Button 1'), onPressed: () {}),
              AdButtonText(
                text: ('Delete'),
                onPressed: () {},
                danger: true,
              ),
              AdButtonIcon(
                icon: Icons.delete,
                onPressed: () => print(sourceData[index]),
                danger: true,
              ),
            ],
          ))
        ]);
  }

  @override
  int get rowCount => sourceData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
