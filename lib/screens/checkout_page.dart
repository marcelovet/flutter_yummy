import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/cart_manager.dart';
import '../models/order_manager.dart';

class CheckoutPage extends StatefulWidget {
  final CartManager cartManager;
  final Function() didUpdate;
  final Function(Order) onSubmit;
  
  const CheckoutPage({
    super.key,
    required this.cartManager,
    required this.didUpdate,
    required this.onSubmit,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Tab(text: 'Delivery'),
    1: Tab(text: 'Self Pick-up'),
  };
  Set<int> selectedSegment = {0};
  TimeOfDay? selectedTime;
  DateTime? selectedDate;
  final DateTime _firstDate = DateTime(DateTime.now().year - 2);
  final DateTime _lastDate = DateTime(DateTime.now().year + 1);
  final TextEditingController _nameController = TextEditingController();

  String formatDate(DateTime? dateTime){
    if(dateTime == null) return 'Select Date';
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }
  
  String formatTimeofDay(TimeOfDay? timeOfDay){
    if(timeOfDay == null) return 'Select Time';
    final hour = timeOfDay.hour.toString().padLeft(2, '0');
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
  
  void onSegmentSelected(Set<int> segmentIndex) {
    setState(() {
      selectedSegment = segmentIndex;
    });
  }

  Widget _buildOrderSegmentedType() {
    return SegmentedButton(
      showSelectedIcon: false,
      segments: const [
        ButtonSegment(
          value: 0,
          label: Text('Delivery'),
          icon: Icon(Icons.pedal_bike),
        ),
        ButtonSegment(
          value: 1,
          label: Text('Pickup'),
          icon: Icon(Icons.local_mall),
        ),
      ],
      selected: selectedSegment,
      onSelectionChanged: onSegmentSelected,
    );
  }

  Widget _buildTextField() {
    return TextField(
      controller: _nameController,
      decoration: const InputDecoration(
        labelText: 'Contact Name',
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      firstDate: _firstDate,
      lastDate: _lastDate,
      initialDate: selectedDate ?? DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true,
          ),
          child: child!,
        );
      }
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }
  
  Widget _buildOrderSummary(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return Expanded(
      child: ListView.builder(
        itemCount: widget.cartManager.items.length,
        itemBuilder: (context, index) {
          final item = widget.cartManager.itemAt(index);
          
          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(),
            secondaryBackground: const SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Icon(Icons.delete)],
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                widget.cartManager.removeItem(item.id);
              });
              widget.didUpdate();
            },
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(color: colorTheme.primary, width: 2.0),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: Text("x${item.quantity}"),
                ),
              ),
              title: Text(item.name),
              subtitle: Text("Price: \$${item.price}"),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    widget.cartManager.removeItem(item.id);
                  });
                  widget.didUpdate();
                },
                icon: const Icon(Icons.delete),
              ),
            ),
          );
        },
      )
    );
  }

  // TODO: build submit order button
  
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
      .textTheme
      .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Order details',
              style: textTheme.headlineSmall,
            ),
            const SizedBox(height: 16.0),
            _buildOrderSegmentedType(),
            const SizedBox(height: 16.0),
            _buildTextField(),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => _selectDate(context),
                    child: Text(formatDate(selectedDate)),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextButton(
                    onPressed: () => _selectTime(context),
                    child: Text(formatTimeofDay(selectedTime)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text("Order Summary"),
            _buildOrderSummary(context),
            // TODO: add submit order button
          ],
        ),
      )
    );
  }
}