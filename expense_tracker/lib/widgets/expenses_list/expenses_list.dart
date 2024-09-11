import "package:flutter/material.dart";
import "package:expense_tracker/models/expense.dart";
import "package:expense_tracker/widgets/expenses_list/expenses_item.dart";

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});

  final List<Expense> expenses;
  final void Function(int idx) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(

        background: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          color: Theme.of(context).colorScheme.error,
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) => removeExpense(index),
        child: ExpensesItem(
          expense: expenses[index],
        ),
      ),
    );
  }
}
