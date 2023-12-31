import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:provider/provider.dart';
import 'package:image/image.dart' as img;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Slide',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var selectedIndex = 0;
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  Widget page = TitlePage();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var selectedIndex = appState.selectedIndex;
    final theme = Theme.of(context);
    final style = theme.primaryTextTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    final bodystyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final mathstyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final labelstyle = theme.primaryTextTheme.titleLarge!.copyWith(
      color: theme.colorScheme.primary,
    );
    final navistyle = theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.secondary,
    );

    switch (selectedIndex) {
      case 0:
        page = TitlePage();
        break;
      case 1:
        page = WhatisRenderingPage();
        break;
      case 2:
        page = HowtoRenderingPage();
        break;
      case 3:
        page = SignedDistanceFunctionPage();
        break;
      case 4:
        page = WhatisRayMarchingPage();
        break;
      case 5:
        page = ExamplePage();
        break;
      case 6:
        page = ExplainPage();
        break;
      case 7:
        page = TorusFormulaPage();
        break;
      case 8:
        page = MarchingCodePage();
        break;
      case 9:
        page = BorderStylePage();
        break;
      case 10:
        page = DistanceStylePage();
        break;
      case 11:
        page = ShowingPage();
        break;
      case 12:
        page = CreditPage();
        break;
    }

    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        backgroundColor: theme.colorScheme.primaryContainer,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
                child: NavigationRail(
              backgroundColor: theme.colorScheme.secondaryContainer,
              indicatorColor: theme.colorScheme.onSecondary,
              extended: constraints.maxWidth >= 1920,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Title', style: navistyle),
                ),
                NavigationRailDestination(
                    icon: Icon(Icons.abc),
                    label: Text('What is rendering?', style: navistyle)),
                NavigationRailDestination(
                    icon: Icon(Icons.arrow_forward_ios),
                    label: Text('How to rendering?', style: navistyle)),
                NavigationRailDestination(
                    icon: Icon(Icons.arrow_forward_ios),
                    label: Text('SDF', style: navistyle)),
                NavigationRailDestination(
                    icon: Icon(Icons.arrow_forward_ios),
                    label: Text('What is ray marching?', style: navistyle)),
                NavigationRailDestination(
                    icon: Icon(Icons.arrow_forward_ios),
                    label: Text('Example', style: navistyle)),
                NavigationRailDestination(
                    icon: Icon(Icons.arrow_forward_ios),
                    label: Text('Explain', style: navistyle)),
                NavigationRailDestination(
                    icon: Icon(Icons.arrow_forward_ios),
                    label: Text('Torus formula', style: navistyle)),
                NavigationRailDestination(
                    icon: Icon(Icons.arrow_forward_ios),
                    label: Text('Marching code', style: navistyle)),
                NavigationRailDestination(
                    icon: Icon(Icons.arrow_forward_ios),
                    label: Text('Border style', style: navistyle)),
                NavigationRailDestination(
                    icon: Icon(Icons.arrow_forward_ios),
                    label: Text('Distance style', style: navistyle)),
                NavigationRailDestination(
                    icon: Icon(Icons.aspect_ratio),
                    label: Text('Showing', style: navistyle)),
                NavigationRailDestination(
                    icon: Icon(Icons.article_outlined),
                    label: Text('Credit', style: navistyle)),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  appState.selectedIndex = index;
                });
              },
            )),
            Expanded(
                child: Column(
              children: [
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      color: theme.colorScheme.primaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            page,
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            '한남대학교 수학과',
                            style: bodystyle,
                          ),
                          Text('20172581 김남훈', style: bodystyle),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (appState.selectedIndex > 0) {
                            appState.selectedIndex--;
                          }
                        });
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (appState.selectedIndex < 12) {
                            appState.selectedIndex++;
                          }
                        });
                      },
                      icon: Icon(Icons.arrow_forward_ios)),
                ]),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class TitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.primaryTextTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    final bodystyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final mathstyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final labelstyle = theme.primaryTextTheme.titleLarge!.copyWith(
      color: theme.colorScheme.primary,
    );

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Text('Ray Marching 을 이용한 3D 렌더링', style: style),
    );
  }
}

class WhatisRenderingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.primaryTextTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    final bodystyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final mathstyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final labelstyle = theme.primaryTextTheme.titleLarge!.copyWith(
      color: theme.colorScheme.primary,
    );
    double _imageHeight() {
      if (MediaQuery.of(context).size.width >= 1920) {
        return 480.0;
      } else {
        return MediaQuery.of(context).size.width / 4;
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('What is Rendering?', style: style),
        SizedBox(height: 16),
        Text('3차원 공간 위에 정의된 물체를 2차원 평면, 즉 화면 위에 표시하는 것', style: bodystyle),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/raytrace.png', height: _imageHeight()),
        ),
        Text('재귀적 레이트레이싱 기법으로 렌더링된 구', style: bodystyle),
        Text('출처: https://en.wikipedia.org/wiki/Ray_tracing_(graphics)',
            style: labelstyle)
      ],
    );
  }
}

class HowtoRenderingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.primaryTextTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    final bodystyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final mathstyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final labelstyle = theme.primaryTextTheme.titleLarge!.copyWith(
      color: theme.colorScheme.primary,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('How to Render?', style: style),
        SizedBox(height: 16),
        Text(
          '1. 패스 트레이싱\n2. 복셀 콘 트레이싱\n3. 레이 마칭\n ...\n 등 다양한 렌더링 기법 존재',
          style: bodystyle,
        )
      ],
    );
  }
}

class SignedDistanceFunctionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.primaryTextTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    final bodystyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final mathstyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final labelstyle = theme.primaryTextTheme.titleLarge!.copyWith(
      color: theme.colorScheme.primary,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Signed Distance Function', style: style),
        SizedBox(height: 16),
        Text('점과 물체 사이의 거리함수 D 에 부호를 도입한 것', style: bodystyle),
        Text('S 를 물체, p 를 점이라고 할 때', style: bodystyle),
        Math.tex(
          r'SDF(p, S) = \begin{cases} D(p, S) &\text{ if }& p \notin S \\ -D(p, S) &\text{ if }& p \in S \end{cases}',
          mathStyle: MathStyle.display,
          textStyle: bodystyle,
        )
      ],
    );
  }
}

class WhatisRayMarchingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.primaryTextTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    final bodystyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final mathstyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final labelstyle = theme.primaryTextTheme.titleLarge!.copyWith(
      color: theme.colorScheme.primary,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('What is Ray Marching?', style: style),
        SizedBox(height: 16),
        Text(
            'SDF 를 이용하여 주어진 방향에 어떤 물체가 있는지 알아낸 뒤,\n그 물체의 색으로 해당 픽셀을 칠하는 방식으로 렌더링하는 기법',
            style: bodystyle),
      ],
    );
  }
}

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.primaryTextTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    final bodystyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final mathstyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final labelstyle = theme.primaryTextTheme.titleLarge!.copyWith(
      color: theme.colorScheme.primary,
    );
    double _imageHeight() {
      if (MediaQuery.of(context).size.width >= 1920) {
        return 480.0;
      } else {
        return MediaQuery.of(context).size.width / 3;
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Example',
          style: style,
        ),
        Image.asset(
          'images/march.png',
          height: _imageHeight(),
        ),
        Text('왼쪽 위의 빨간 점이 맵에 대한 SDF 값만큼 주어진 방향으로 진행하여 최종적으로 오른쪽 아래의 벽에 도달하는 예시',
            style: labelstyle)
      ],
    );
  }
}

class ExplainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.primaryTextTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    final bodystyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final mathstyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final labelstyle = theme.primaryTextTheme.titleLarge!.copyWith(
      color: theme.colorScheme.primary,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('구체적으로 어떻게?', style: style),
        SizedBox(height: 16),
        Math.tex(
            r'\begin{aligned} &카메라의\ 위치를\ p,\ 렌더링할\ 물체를\ S,\ 허용\ 오차를\ \epsilon,\ 시야\ 범위를\ D\ 라\ 하자. \\ &다음을\ 화면\ 위의\ 모든\ 픽셀에\ 대해\ 반복한다. \end{aligned}',
            textStyle: bodystyle),
        Math.tex(
            r'\begin{aligned} &1.&& 현재\ 픽셀로의\ 방향을\ \vec{v}\ 라 한다.\\ &2.&& i = 0\ 으로\ 두고\ 다음을\ 반복한다. \\ &&3.&\ SDF(p_i, S) \ge \epsilon\ 이면\ p_{i + 1} = p_i + SDF(p_i, S) \vec{v}\ 라\ 한다. \\ &&4.&\ SDF(p_i, S) < \epsilon\ 이면\ 현재까지\ 진행한\ 거리와\ 참을\ 반환하고\ 반복을\ 중단한다. \\ &&5.&\ 현재까지\ 진행한\ 거리가\ D\ 보다\ 크면\ 0\ 과\ 거짓을\ 반환하고\ 반복을\ 중단한다. \end{aligned}',
            textStyle: bodystyle),
      ],
    );
  }
}

class TorusFormulaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.primaryTextTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    final bodystyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final mathstyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final labelstyle = theme.primaryTextTheme.titleLarge!.copyWith(
      color: theme.colorScheme.primary,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('How to calculate SDF of Torus?', style: style),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Math.tex(
              r'\begin{aligned} &보라색\ 원의\ 반지름을\ r_1,\ 빨간\ 원의\ 반지름을\ r_2\ 라\ 하자. \\ &토러스\ S\ 의\ 중심을\ (0, 0, 0),\ p = (x, y, z)\ 라\ 하고 \\ &r = \sqrt{x^2 + y^2}\ 라\ 하면\\ &SDF(p, S) = \sqrt{(r - r_1)^2 + z^2} - r_2 이다. \end{aligned}',
              mathStyle: MathStyle.display,
              textStyle: bodystyle,
            ),
            Image.asset(
              'images/torus.png',
              width: 320,
            ),
          ],
        ),
        Text('이미지 출처: https://en.wikipedia.org/wiki/Torus', style: labelstyle)
      ],
    );
  }
}

class MarchingCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.primaryTextTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    final bodystyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final mathstyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final labelstyle = theme.primaryTextTheme.titleLarge!.copyWith(
      color: theme.colorScheme.primary,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Code for SDF of Torus', style: style),
        SizedBox(height: 16),
        Image.asset('images/marchcode.png')
      ],
    );
  }
}

class BorderStylePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.primaryTextTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    final bodystyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final mathstyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final labelstyle = theme.primaryTextTheme.titleLarge!.copyWith(
      color: theme.colorScheme.primary,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Rendering Border of Shape', style: style),
        SizedBox(height: 16),
        Math.tex(
            r'\begin{aligned} &현재\ 진행\ 방향에서\ 물체를\ 발견하지\ 못했을\ 때,\ 각\ 반복에서\ 전진한\ 거리\ 중\\ &최소값을\ \min\ 이라 하면\ 현재\ 픽셀의\ 밝기를\ \min\ 의\ 역수로\ 하면\ 물체의\ \\ &외곽선을\ 렌더링할\ 수\ 있다. \end{aligned}',
            mathStyle: MathStyle.display,
            textStyle: bodystyle),
      ],
    );
  }
}

class DistanceStylePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.primaryTextTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    final bodystyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final mathstyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final labelstyle = theme.primaryTextTheme.titleLarge!.copyWith(
      color: theme.colorScheme.primary,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Rendering Distance from Camera', style: style),
        SizedBox(height: 16),
        Math.tex(
            r'\begin{aligned} &매\ 반복마다\ 진행한\ 거리를\ d_i\ 라 할 때 \\ &\phantom{sadasdfdsa}D = \sum_{i = 0}^{end} d_i \\ &를\ 현재\ 픽셀의\ 밝기로\ 하면\ 카메라에서\\ &해당\ 점까지의\ 거리를\ 렌더링\ 할\ 수\ 있다. \end{aligned}',
            mathStyle: MathStyle.display,
            textStyle: bodystyle),
      ],
    );
  }
}

class ShowingPage extends StatefulWidget {
  @override
  State<ShowingPage> createState() => _ShowingPageState();
}

class _ShowingPageState extends State<ShowingPage> {
  double _currentAngle = 0;
  bool _isRendered = false;
  final List<bool> _isSelected = [true, false, false];
  Uint8List _renderedImage = Uint8List(640 * 480 * 4);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.primaryTextTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    final bodystyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final mathstyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final labelstyle = theme.primaryTextTheme.titleLarge!.copyWith(
      color: theme.colorScheme.primary,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Showing', style: style),
        Container(
          width: 577,
          height: 408,
          child: _isRendered
              ? Container(
                  color: theme.colorScheme.primaryContainer,
                  child: Image.memory(_renderedImage))
              : Container(
                  color: theme.colorScheme.primaryContainer,
                  child: Center(
                    child: Text(
                      'Not Rendered yet',
                      style: style,
                    ),
                  ),
                ),
        ),
        SizedBox(height: 16),
        Container(
          width: 640,
          child: Slider(
            value: _currentAngle,
            max: 179,
            min: 0,
            divisions: 179,
            onChanged: (value) {
              setState(() {
                _currentAngle = value;
              });
            },
          ),
        ),
        ToggleButtons(
            borderWidth: 2,
            borderColor: Colors.green[400],
            borderRadius: BorderRadius.circular(8),
            fillColor: Colors.green[200],
            color: Colors.green[600],
            selectedBorderColor: Colors.green[600],
            selectedColor: Colors.green[800],
            constraints: BoxConstraints(minWidth: 196, minHeight: 48),
            children: renderStyles,
            onPressed: (index) {
              setState(() {
                for (var i = 0; i < _isSelected.length; i++) {
                  _isSelected[i] = i == index;
                }
              });
            },
            isSelected: _isSelected),
        SizedBox(height: 16),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: theme.colorScheme.secondaryContainer),
            onPressed: () {
              var render;

              setState(() {
                _isRendered = true;
                switch (_isSelected.indexOf(true)) {
                  case 0:
                    _renderedImage = _renderFill();
                    break;
                  case 1:
                    _renderedImage = _renderBorder();
                    break;
                  case 2:
                    _renderedImage = _renderDistance();
                    break;
                }
                img.Image image = img.Image.fromBytes(
                    width: 577, height: 408, bytes: _renderedImage.buffer);
                _renderedImage = img.encodeJpg(image);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Render!',
                textScaleFactor: 3,
              ),
            ))
      ],
    );
  }

  Float32x4 _getCamera(double angle) {
    return Float32x4(2 * math.sin(angle), 2 * math.cos(angle), 1, 0);
  }

  Float32x4 _getCameraDirection(double angle) {
    return Float32x4(-2 / math.sqrt(5) * math.sin(angle),
        -2 / math.sqrt(5) * math.cos(angle), -1 / math.sqrt(5), 0);
  }

  Float32x4 _getXPixelDirection(double angle) {
    return Float32x4(math.cos(angle), -math.sin(angle), 0, 0);
  }

  Float32x4 _getYPixelDirection(double angle) {
    return Float32x4((2 / math.sqrt(5)) * math.sin(angle),
        (2 / math.sqrt(5)) * -math.cos(angle), 1 / math.sqrt(5), 0);
  }

  Float32x4 _getPixelDirection(Float32x4 cameraDirection,
      Float32x4 xPixelDirection, Float32x4 yPixelDirection, int x, int y) {
    double xDisplacement = ((x.toDouble() - 288.5) / 577.0) * 0.707;
    double yDisplacement = ((y.toDouble() - 204.0) / 408.0) * 0.5;

    Float32x4 xMultiplier =
        Float32x4(xDisplacement, xDisplacement, xDisplacement, 0);
    Float32x4 yMultiplier =
        Float32x4(yDisplacement, yDisplacement, yDisplacement, 0);

    Float32x4 pixelDirection = cameraDirection +
        xMultiplier * xPixelDirection +
        yMultiplier * yPixelDirection;

    double pixelDirectionNorm = math.sqrt(pixelDirection.x * pixelDirection.x +
        pixelDirection.y * pixelDirection.y +
        pixelDirection.z * pixelDirection.z +
        pixelDirection.w * pixelDirection.w);

    Float32x4 pixelDirectionDivisor = Float32x4(
        pixelDirectionNorm, pixelDirectionNorm, pixelDirectionNorm, 0);

    return pixelDirection / pixelDirectionDivisor;
  }

  double _getDistance(Float32x4 currentPosition) {
    double radius = math.sqrt(currentPosition.x * currentPosition.x +
        currentPosition.z * currentPosition.z);
    double altitude = currentPosition.y;

    return math.sqrt(math.pow(radius - 0.5, 2) + math.pow(altitude, 2)) - 0.25;
  }

  Uint8List _renderBorder() {
    double angle = _currentAngle * math.pi / 180;
    Uint8List image = Uint8List(577 * 408 * 4);
    Float32x4 camera = _getCamera(angle);
    Float32x4 cameraDirection = _getCameraDirection(angle);
    Float32x4 xPixelDirection = _getXPixelDirection(angle);
    Float32x4 yPixelDirection = _getYPixelDirection(angle);

    double firstMarch = _getDistance(camera);
    Float32x4 firstMarchMultiplier =
        Float32x4(firstMarch, firstMarch, firstMarch, 0);

    for (int x = 0; x < 577; x++) {
      for (int y = 0; y < 408; y++) {
        int index = (y * 577 + x) * 4;
        Float32x4 pixelDirection = _getPixelDirection(
            cameraDirection, xPixelDirection, yPixelDirection, x, y);
        Float32x4 currentPosition =
            camera + pixelDirection * firstMarchMultiplier;
        double marched = firstMarch;
        int steps = 0;
        double min = 5;

        while (steps < 25 && marched < 5) {
          //distance from torus
          double march = _getDistance(currentPosition);
          Float32x4 marchMultiplier = Float32x4(march, march, march, 0);
          currentPosition = currentPosition + pixelDirection * marchMultiplier;
          steps++;
          marched += march;

          if (march < 0.01) {
            image[index] = 0;
            image[index + 1] = 0;
            image[index + 2] = 0;
            image[index + 3] = 255;

            break;
          } else if (march < min) {
            min = march;
          }
        }

        if (steps == 25 || marched >= 5) {
          int luma = 255 - ((min - 0.01) / 0.04 * 255).toInt();

          image[index] = luma;
          image[index + 1] = luma;
          image[index + 2] = luma;
          image[index + 3] = 255;
        }
      }
    }
    return image;
  }

  Uint8List _renderDistance() {
    Uint8List image = Uint8List(577 * 408 * 4);
    Float32List marchmap = Float32List(577 * 408);
    double angle = _currentAngle * math.pi / 180;
    Float32x4 camera = _getCamera(angle);
    Float32x4 cameraDirection = _getCameraDirection(angle);
    Float32x4 xPixelDirection = _getXPixelDirection(angle);
    Float32x4 yPixelDirection = _getYPixelDirection(angle);

    double firstMarch = _getDistance(camera);
    Float32x4 firstMarchMultiplier =
        Float32x4(firstMarch, firstMarch, firstMarch, 0);
    double maxDistance = 0;
    double minDistance = 5;

    for (int x = 0; x < 577; x++) {
      for (int y = 0; y < 408; y++) {
        int index = (y * 577 + x) * 4;
        Float32x4 pixelDirection = _getPixelDirection(
            cameraDirection, xPixelDirection, yPixelDirection, x, y);
        Float32x4 currentPosition =
            camera + pixelDirection * firstMarchMultiplier;
        double marched = firstMarch;
        int steps = 0;

        while (steps < 25 && marched < 5) {
          double march = _getDistance(currentPosition);
          Float32x4 marchMultiplier = Float32x4(march, march, march, 0);
          currentPosition = currentPosition + pixelDirection * marchMultiplier;
          steps++;
          marched += march;

          if (march < 0.01) {
            marchmap[y * 577 + x] = marched;

            if (marched > maxDistance) {
              maxDistance = marched;
            }

            if (marched < minDistance) {
              minDistance = marched;
            }

            break;
          }
        }

        if (steps == 25 || marched >= 5) {
          marchmap[y * 577 + x] = -1;
        }
      }
    }

    for (int i = 0; i < 577 * 408; i++) {
      if (marchmap[i] >= 0) {
        image[i * 4] =
            ((marchmap[i] - minDistance) / (maxDistance - minDistance) * 255)
                .toInt();
        image[i * 4 + 1] =
            ((marchmap[i] - minDistance) / (maxDistance - minDistance) * 255)
                .toInt();
        image[i * 4 + 2] =
            ((marchmap[i] - minDistance) / (maxDistance - minDistance) * 255)
                .toInt();
        image[i * 4 + 3] = 255;
      } else {
        image[i * 4] = 0;
        image[i * 4 + 1] = 0;
        image[i * 4 + 2] = 0;
        image[i * 4 + 3] = 255;
      }
    }

    return image;
  }

  Uint8List _renderFill() {
    double angle = _currentAngle * math.pi / 180;
    Uint8List image = Uint8List(577 * 408 * 4);
    Float32x4 camera = _getCamera(angle);
    Float32x4 cameraDirection = _getCameraDirection(angle);
    Float32x4 xPixelDirection = _getXPixelDirection(angle);
    Float32x4 yPixelDirection = _getYPixelDirection(angle);

    double firstMarch = _getDistance(camera);
    Float32x4 firstMarchMultiplier =
        Float32x4(firstMarch, firstMarch, firstMarch, 0);

    for (int x = 0; x < 577; x++) {
      for (int y = 0; y < 408; y++) {
        int index = (y * 577 + x) * 4;
        Float32x4 pixelDirection = _getPixelDirection(
            cameraDirection, xPixelDirection, yPixelDirection, x, y);
        Float32x4 currentPosition =
            camera + pixelDirection * firstMarchMultiplier;
        double marched = firstMarch;
        int steps = 0;

        while (steps < 25 && marched < 5) {
          double march = _getDistance(currentPosition);
          Float32x4 marchMultiplier = Float32x4(march, march, march, 0);
          currentPosition = currentPosition + pixelDirection * marchMultiplier;
          steps++;

          if (march < 0.01) {
            image[index] = 255;
            image[index + 1] = 255;
            image[index + 2] = 255;
            image[index + 3] = 255;
            break;
          }
        }

        if (steps == 25 || marched >= 5) {
          image[index] = 0;
          image[index + 1] = 0;
          image[index + 2] = 0;
          image[index + 3] = 255;
        }
      }
    }

    return image;
  }
}

const List<Widget> renderStyles = [
  Text(
    'Fill',
    textScaleFactor: 2,
  ),
  Text(
    'Border',
    textScaleFactor: 2,
  ),
  Text(
    'Distance',
    textScaleFactor: 2,
  ),
];

class CreditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.primaryTextTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    final bodystyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final mathstyle = theme.primaryTextTheme.displaySmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final labelstyle = theme.primaryTextTheme.titleLarge!.copyWith(
      color: theme.colorScheme.primary,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(48.0),
          child: Text('감사합니다', style: style),
        ),
      ],
    );
  }
}


//sdafasdsdaf