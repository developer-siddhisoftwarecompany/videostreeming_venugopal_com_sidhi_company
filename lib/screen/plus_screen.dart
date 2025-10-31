import 'package:flutter/material.dart';

class PlusScreen extends StatelessWidget {
  const PlusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "SEEKHO",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              "UNLOCK\nUNLIMITED\nVIDEOS",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 25),

            // Price banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E1E1E), Color(0xFF2C2C2C)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Try 7 Days For",
                          style: TextStyle(color: Colors.white70, fontSize: 16)),
                      Text("\$1",
                          style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text("Then \$199/Month",
                      style: TextStyle(color: Colors.white54)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Benefits section
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                buildBenefit("Unlock all Videos", Icons.lock_open),
                buildBenefit("Vip Customer Support", Icons.support_agent),
                buildBenefit("Remove Ads", Icons.block),
              ],
            ),

            const SizedBox(height: 30),

            // Trial detail card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E2A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTrialStep(
                    icon: Icons.rocket_launch,
                    title: "Today",
                    subtitle: "Unlock All Videos",
                    tag: "Trial Start",
                    tagColor: Colors.green,
                  ),
                  const Divider(color: Colors.white24, height: 30),
                  buildTrialStep(
                    icon: Icons.notifications_active,
                    title: "7 Days",
                    subtitle: "Cancel Any Time And Get Full Refund",
                    tag: "",
                    tagColor: Colors.transparent,
                  ),
                  const Divider(color: Colors.white24, height: 30),
                  buildTrialStep(
                    icon: Icons.credit_card,
                    title: "1 Month",
                    subtitle: "Continue Your Monthly Plan",
                    tag: "Monthly Plan Starts",
                    tagColor: Colors.blueAccent,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Start Trial Button
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 55,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF7A00), Color(0xFFDA22FF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: const Text(
                  "START TRIAL",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for benefits (Unlock Videos, VIP Support, Remove Ads)
  Widget buildBenefit(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white70, size: 18),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  // Widget for trial detail rows
  Widget buildTrialStep({
    required IconData icon,
    required String title,
    required String subtitle,
    required String tag,
    required Color tagColor,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.orangeAccent,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              Text(subtitle,
                  style: const TextStyle(color: Colors.white54, fontSize: 13)),
            ],
          ),
        ),
        if (tag.isNotEmpty)
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: tagColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              tag,
              style: TextStyle(color: tagColor, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
