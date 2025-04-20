import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  String selectedColor = 'Yellow';
  double minPrice = 50;
  double maxPrice = 100;
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Reset", style: TextStyle(color: Colors.white)),
                  Text("Filter", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Icon(Icons.close, color: Colors.white),
                ],
              ),
              const SizedBox(height: 20),

              // Category
              _tileRow("Category", "View all"),
              _divider(),

              // Color Section
              _expandableTitle("Color"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ["Yellow", "Black", "Blue"].map((color) {
                  return ChoiceChip(
                    label: Text(color),
                    labelStyle: TextStyle(
                      color: selectedColor == color ? Colors.white : Colors.black,
                    ),
                    selected: selectedColor == color,
                    selectedColor: Colors.red,
                    backgroundColor: Colors.white,
                    onSelected: (_) {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                  );
                }).toList(),
              ),
              _divider(),

              // Price Range
              _expandableTitle("Price range", trailingText: "₹$minPrice-₹$maxPrice"),
              RangeSlider(
                values: RangeValues(minPrice, maxPrice),
                min: 50,
                max: 100,
                divisions: 5,
                labels: RangeLabels("₹${minPrice.round()}", "₹${maxPrice.round()}"),
                onChanged: (values) {
                  setState(() {
                    minPrice = values.start;
                    maxPrice = values.end;
                  });
                },
              ),
              _divider(),

              _tileRow("Rent Paid", "OTT"),
              _divider(),

              _tileRow("Utility Bills", "Score Boost"),
              _divider(),

              const SizedBox(height: 10),

              // Credit Score Filter
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Credit Score", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              const SizedBox(height: 10),
              Column(
                children: List.generate(5, (index) {
                  int starCount = 5 - index;
                  return RadioListTile<int>(
                    value: starCount,
                    groupValue: selectedRating,
                    onChanged: (val) => setState(() => selectedRating = val!),
                    activeColor: Colors.red,
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Row(
                      children: [
                        Row(
                          children: List.generate(
                            starCount,
                                (_) => const Icon(Icons.star, size: 20, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text("& up", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),

              // Show Results Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {},
                child: const Text("Show 18 results", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),

    );
  }

  Widget _tileRow(String title, String trailing) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: TextStyle(color: Colors.white)),
      trailing: Text(trailing, style: TextStyle(color: Colors.white70)),
      onTap: () {},
    );
  }

  Widget _divider() {
    return Divider(color: Colors.white12, thickness: 1);
  }

  Widget _expandableTitle(String title, {String? trailingText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
        if (trailingText != null)
          Text(trailingText, style: TextStyle(color: Colors.white70)),
        Icon(Icons.expand_more, color: Colors.white),
      ],
    );
  }
}
