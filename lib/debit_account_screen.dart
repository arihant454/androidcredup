import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Debit Account",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Icon(Icons.settings, color: Colors.white),
                ],
              ),
            ),
            // Credit Score Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("CIBIL",
                          style: TextStyle(color: Colors.white60)),
                      Text("HDFC Bank /••••14",
                          style: TextStyle(color: Colors.white60)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text("839",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  const Center(
                      child: Text("CREDIT SCORE",
                          style: TextStyle(color: Colors.white54))),
                  const SizedBox(height: 20),

                ],
              ),
            ),
            const SizedBox(height: 20),
            // Recent Transactions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("RECENT TRANSACTIONS",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold)),
                  Text("VIEW ALL", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  TransactionTile("OTT Subscription", "Entertainment", "₹-12,50", "March 7"),
                  TransactionTile("Rent payment", "Home", "₹-11,000", "March 1"),
                  TransactionTile("Internet Bill", "Home", "₹-4800", "Feb 20"),
                  TransactionTile("Water Bill", "Utility", "₹-1750", "Feb 11"),
                  TransactionTile("Electricity Bill", "Utility", "₹-3450", "Feb 11"),
                  TransactionTile("Transportation", "Utility", "₹-950", "Feb 2"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String title, subtitle, amount, date;

  const TransactionTile(this.title, this.subtitle, this.amount, this.date, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade900,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red,
          child: Icon(Icons.account_balance_wallet, color: Colors.white),
        ),
        title: Text(title, style: TextStyle(color: Colors.white)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.white60)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(amount,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Text(date, style: TextStyle(color: Colors.white54, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
