import 'package:ebhc/views/pages/graph/column_graph.dart';
import 'package:ebhc/views/pages/graph/line_graph_page.dart';
import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  final bool risk;
  const TabBarWidget({super.key, required this.risk});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  TabController? tabController;
  final List<Widget> _tab = const [
    Tab(
      text: "日",
      iconMargin: EdgeInsets.zero,
    ),
    Tab(
      text: "週",
      iconMargin: EdgeInsets.zero,
    ),
    Tab(
      text: "月",
      iconMargin: EdgeInsets.zero,
    ),
    Tab(
      text: "年",
      iconMargin: EdgeInsets.zero,
    ),
  ];
  List<Widget> _tabLine = [];
  List<Widget> _tabColumn = [];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController!.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    setState(() {
      _currentIndex = tabController!.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _tabLine = [
      LineGraphPage(index: tabController!.index),
      LineGraphPage(index: tabController!.index),
      LineGraphPage(index: tabController!.index),
      LineGraphPage(index: tabController!.index),
    ];

    _tabColumn = [
      ColumnGraphPage(index: tabController!.index),
      ColumnGraphPage(index: tabController!.index),
      ColumnGraphPage(index: tabController!.index),
      ColumnGraphPage(index: tabController!.index),
    ];

    return Expanded(
      child: Column(
        children: [
          Container(
            //rowSelectBgColor
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.rowSelectBgColor,
                  width: 1.5,
                ),
              ),
            ),
            child: TabBar(
              controller: tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              labelPadding: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.white,
                ),
              ),
              tabs: _tab,
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children: widget.risk ? _tabColumn : _tabLine),
          ),
        ],
      ),
    );
  }
}
