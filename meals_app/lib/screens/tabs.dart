import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import "package:meals_app/providers/favorites_provider.dart";
import "package:meals_app/providers/filter_provider.dart";
import "package:meals_app/screens/meals.dart";

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int idx) {
    setState(() {
      _selectedPageIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);

      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }

    Future<void> _setScreen(String identifier) async {
      Navigator.of(context).pop();
      if (identifier == 'filters') {
        await Navigator.push<Map<Filter, bool>>(
          context,
          MaterialPageRoute(
            builder: (context) => const FiltersScreen(),
          ),
        );
      }
    }

    return Scaffold(
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          _selectPage(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }
}
