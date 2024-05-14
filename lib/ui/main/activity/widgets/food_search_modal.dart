import 'package:flutter/material.dart';
import 'package:project_app/data/dtos/activity/activity_response.dart';
import 'package:project_app/ui/main/activity/widgets/manual_entry_tab.dart';
import 'package:project_app/ui/main/activity/widgets/search_tab.dart';

class FoodSearchModal {
  static Future<Map<String, dynamic>?> show(
      BuildContext context, List<FoodContentListDTO> foods, Color accentColor) {
    return showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        return DefaultTabController(
          length: 2,
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.5,
            minChildSize: 0.4,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Padding(
                padding: EdgeInsets.only(
                  top: 16.0,
                  left: 16.0,
                  right: 16.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TabBar(
                      labelColor: accentColor,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: accentColor,
                      tabs: const [Tab(text: '검색하기'), Tab(text: '직접 입력하기')],
                    ),
                    const SizedBox(height: 16.0),
                    Expanded(
                      child: TabBarView(
                        children: [
                          SearchTab(
                              foods: foods, scrollController: scrollController),
                          ManualEntryTab(
                              accentColor: accentColor,
                              scrollController: scrollController),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
