import 'package:expense_tracker/models/expense.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpense});

  final void Function(Expense expense) addExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      //show error message
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Invalid input'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Okay'))
              ],
              content: const Text(
                  'Please make sure a valid title,amount,date and category was entered/'),
            );
          });
      return;
    }
    widget.addExpense(Expense(
        category: _selectedCategory,
        date: _selectedDate!,
        title: _titleController.text,
        amount: double.tryParse(_amountController.text)!));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                maxLength: 50,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(label: Text('Title')),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text('Amount'), prefixText: '\$ '),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(_selectedDate == null
                          ? 'No Date selected !'
                          : formatter.format(_selectedDate!)),
                      IconButton(
                        icon: const Icon(Icons.calendar_month),
                        onPressed: _presentDatePicker,
                      )
                    ],
                  ))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  DropdownButton(
                      value: _selectedCategory,
                      items: Category.values
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(
                                category.name.toUpperCase(),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() {
                          _selectedCategory = value;
                        });
                      }),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: _submitExpenseData,
                    child: const Text('Save Expense!'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
