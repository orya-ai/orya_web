import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        width: double.infinity,
        child: Column(
          children: [
            FadeInUp(
              duration: const Duration(milliseconds: 600),
              child: Text(
                'Our Team',
                style: GoogleFonts.inter(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            FadeInUp(
              duration: const Duration(milliseconds: 800),
              child: Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              child: Text(
                'Meet the people behind ORYA',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 60),
            LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth > 900
                    ? 3
                    : constraints.maxWidth > 600
                        ? 2
                        : 1;
                return _buildTeamGrid(crossAxisCount);
              },
            ),
            const SizedBox(height: 80), // Space for bottom navigation bar
          ],
        ),
      ),
    );
  }

  Widget _buildTeamGrid(int crossAxisCount) {
    final teamMembers = [
      {
        'name': 'Nicole De La Paz',
        'role': 'Founder & CEO',
        'delay': 0,
      },
      
      {
        'name': 'Bilal De La Paz',
        'role': 'Founder & COO',
        'delay': 400,
      },
    ];

    return Wrap(
      spacing: 30,
      runSpacing: 50,
      alignment: WrapAlignment.center,
      children: List.generate(
        teamMembers.length,
        (index) {
          final member = teamMembers[index];
          final name = member['name'] as String;
          final role = member['role'] as String;
          final delay = member['delay'] as int;
          
          return FadeInUp(
            duration: const Duration(milliseconds: 800),
            delay: Duration(milliseconds: 400 + delay),
            child: SizedBox(
              width: 280,
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        name.split(' ').map((e) => e[0]).join(''),
                        style: GoogleFonts.inter(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    name,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    role,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
