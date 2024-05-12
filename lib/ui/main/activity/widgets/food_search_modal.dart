import 'package:flutter/material.dart';
import 'package:project_app/data/dtos/activity/activity_response.dart';
import 'package:project_app/ui/main/activity/widgets/search_tab.dart';

import 'manual_entry_tab.dart';

class FoodSearchModal {
  static void show(
      BuildContext context, List<FoodContentListDTO> foods, Color accentColor) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // This ensures the modal adapts to the keyboard
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context)
              .viewInsets, // Adjust padding based on the keyboard visibility
          child: DefaultTabController(
            length: 2,
            child: DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.5,
              minChildSize: 0.4,
              maxChildSize: 0.9,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TabBar(
                        labelColor: accentColor,
                        // Use the accent color passed to the function
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: accentColor,
                        tabs: const [Tab(text: '검색하기'), Tab(text: '직접 입력하기')],
                      ),
                      const SizedBox(height: 16.0),
                      Expanded(
                        child: TabBarView(
                          children: [
                            SearchTab(
                                foods: foods,
                                scrollController: scrollController),
                            // Updated to pass FoodDetail list
                            ManualEntryTab(
                                accentColor: accentColor,
                                scrollController: scrollController),
                            // Assumes ManualEntryTab accepts color and controller
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
