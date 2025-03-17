import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'cart_manager.dart';

class Order {
  final Set<int> selectedSegment;
  final TimeOfDay? selectedTime;
  final DateTime? selectedDate;
  final String name;
  final List<CartItem> items;
  static final formatter = DateFormat('yyyy-MM-dd');

  Order({
    required this.selectedSegment,
    required this.selectedTime,
    required this.selectedDate,
    required this.name,
    required this.items,
  });

  String getFormattedSegment() {
    if (selectedSegment.contains(0)) {
      return 'Delivery';
    } else if (selectedSegment.contains(1)) {
      return 'Self Pick Up';
    } else {
      return 'Unknown'; // Handle any other cases as needed
    }
  }

  String getFormattedTime() {
    if (selectedTime == null) {
      return 'Unknown';
    }
    final hour = selectedTime!.hour.toString().padLeft(2, '0');
    final minute = selectedTime!.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
  
  String getFormattedDate() => selectedDate != null 
    ? formatter.format(selectedDate!)
    : 'Unknown';

  String getFormattedName() => name.isEmpty
    ? 'Unknown'
    : name;
  
  String getFormattedOrderInfo() {
    final segmentString = getFormattedSegment();
    final name = getFormattedName();
    final timeString = getFormattedTime();
    final dateString = getFormattedDate();

    return '$name, Date: $dateString, Time: $timeString, $segmentString';
  }
}