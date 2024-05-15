import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_app/_core/constants/constants.dart';
import '../../../../_core/constants/http.dart';
import '../viewmodel/drink_water_viewmoddel..dart';
import '../widgets/WaterIntakeGraph.dart';

// 상태 관리를 위한 Provider 선언
final waterIntakeProvider = StateProvider<int>((ref) => 0);

class DrinkWaterDetailPage extends ConsumerWidget {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  DrinkWaterDetailPage({Key? key}) : super(key: key);

  Future<int> loadGlassSize() async {
    String? sizeString = await secureStorage.read(key: 'glassSize');
    return int.tryParse(sizeString ?? '250') ??
        250; // Default to 250ml if not set
  }

  Future<void> saveGlassSize(int glassSize) async {
    await secureStorage.write(key: 'glassSize', value: glassSize.toString());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(DrinkWaterProvider.notifier)..notifyInit();

    return FutureBuilder<int>(
      future: loadGlassSize(),
      builder: (context, snapshot) {
        final int glassSize =
            snapshot.data ?? 250; // Use loaded value or default

        return Scaffold(
          appBar: AppBar(
            title: Text('물 마시기', style: TextStyle(color: Colors.white)),
            backgroundColor: kAccentColor2,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                WaterIntakeGraph(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 26.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Consumer(
                        builder: (context, ref, child) {
                          final currentIntake =
                              ref.watch(waterIntakeProvider.state).state;
                          return Text(
                            '오늘 물을 $currentIntake ml 마셨어요',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        '수분 충전하세요!',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      _buildProgressIndicator(
                          ref.watch(waterIntakeProvider.state).state),
                      SizedBox(height: 20),
                      _buildCupIcons(ref.watch(waterIntakeProvider.state).state,
                          glassSize),
                      SizedBox(height: 20),
                      Text(
                        '부족        좋아요        거의다왔어요        완벽해요',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(40)),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: Column(
                          children: <Widget>[
                            Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Image.asset('assets/images/water2.png',
                                    width: 120),
                                Positioned(
                                  bottom: 0,
                                  child: Text(
                                    '${glassSize}ml',
                                    // Display the dynamic glass size
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.remove,
                                          color: kAccentColor2),
                                      onPressed: () => _removeDrink(ref,
                                          glassSize), // Wrap inside anonymous function
                                    ),
                                    SizedBox(width: 120),
                                    IconButton(
                                      icon:
                                          Icon(Icons.add, color: kAccentColor2),
                                      onPressed: () => _addDrink(ref,
                                          glassSize), // Wrap inside anonymous function
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProgressIndicator(int currentIntake) {
    final int totalIntake = 2000;
    return Stack(
      children: <Widget>[
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        FractionallySizedBox(
          widthFactor:
              currentIntake >= totalIntake ? 1.0 : currentIntake / totalIntake,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, kAccentColor2!],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('0', style: TextStyle(color: Colors.white)),
                Text('$currentIntake ml',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCupIcons(int currentIntake, int glassSize) {
    final int totalIntake = 2000;
    List<Widget> cups = [];
    for (int i = 0; i < totalIntake / glassSize; i++) {
      String cupImagePath = (i * glassSize < currentIntake)
          ? 'assets/images/water2.png'
          : 'assets/images/greywater.png';
      cups.add(
        Image.asset(cupImagePath, width: 40),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: cups,
    );
  }

  void _addDrink(WidgetRef ref, int glassSize) {
    final currentIntake = ref.read(waterIntakeProvider.state).state;
    if (currentIntake < 2000) {
      ref.read(waterIntakeProvider.state).state += glassSize;
      saveGlassSize(glassSize);
    }
  }

  void _removeDrink(WidgetRef ref, int glassSize) {
    final currentIntake = ref.read(waterIntakeProvider.state).state;
    if (currentIntake > 0) {
      ref.read(waterIntakeProvider.state).state -= glassSize;
      saveGlassSize(glassSize);
    }
  }
}
