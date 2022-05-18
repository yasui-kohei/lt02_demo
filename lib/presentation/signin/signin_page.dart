import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lt02_demo/constants/signin_page_constants.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key, required this.tabIndex}) : super(key: key);

  /// 現在表示しているタブのindex番号
  final int tabIndex;

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: SigninPageTabs.data.length,
      vsync: this,
      initialIndex: widget.tabIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SigninPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tabController.index = widget.tabIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 30,),
          Center(
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.6),
              isScrollable: true,
              onTap: (int index) {
                _onTap(context, index);
              },
              tabs: [for (final t in SigninPageTabs.data) t.tab],
            ),
          ),
          // tabのボディ
          IndexedStack(
            alignment: Alignment.center,
            index: widget.tabIndex,
            children: [
              for (final t in SigninPageTabs.data)
                Visibility(
                  child: t.view,
                  visible: widget.tabIndex ==
                      SigninPageTabs.data
                          .indexWhere((tab) => tab.tabId == t.tabId),
                ),
            ],
          )
        ],
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    context.go('/${SigninPageTabs.data[index].tabId}');
  }
}
