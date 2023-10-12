import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<String> todoItems = [];

  var item = TextEditingController();

  void addItem() {
    setState(() {
      todoItems.add(item.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: item,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Todo Item'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton.icon(
                      onPressed: addItem,
                      icon: const Icon(Icons.add),
                      label: const Text('ADD'),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: todoItems.length,
                    itemBuilder: (_, index) =>
                        TodoItem(index + 1, todoItems[index])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  TodoItem(this.index, this.item, {super.key});

  int index;
  String item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text(item),
        // subtitle: Text('subtitle'),
        leading: CircleAvatar(
          child: Text('$index'),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete_forever,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
