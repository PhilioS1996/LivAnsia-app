import 'package:livansia_app/helpers/imports.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: (20 / 3).round(),
        controller: _pageController,
        itemBuilder: (context, index) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: index,
              itemBuilder: (context, index) {
                return Text('$index');
              },
            ),
          );
        });
  }
}
