import "package:expense_tracker/widgets/new_expense.dart";
import "package:flutter/material.dart";
import "package:expense_tracker/models/expense.dart";
import "package:expense_tracker/widgets/expenses_list/expenses_list.dart";
import "package:expense_tracker/widgets/chart/chart.dart";

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 15.99,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void removeExpense(int idx) {
    final removedExpense = _registeredExpenses[idx];

    setState(() {
      _registeredExpenses.removeAt(idx);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(idx, removedExpense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) => NewExpense(addExpense: _addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        const Center(child: Text('No Expenses found.Start adding some!'));

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, removeExpense: removeExpense);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 26, 133),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
        title: const Text(
          'Flutter Expense Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: <Widget>[
          Chart(
            expenses: _registeredExpenses,
          ),
          Expanded(child: mainContent)
        ],
      ),
    );
  }
}
