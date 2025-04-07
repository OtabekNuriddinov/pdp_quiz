import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdp_quiz/core/widgets/custom_bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            actions:[Icon(Icons.more_vert)],
            backgroundColor: Colors.white,
            expandedHeight: 250,
            pinned: true,
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset('assets/icons/person.svg'),
                  const SizedBox(height: 10),
                  const Text(
                    'User Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  const Text(
                    'Firdavs Zayniddinov',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 10,),
                  const Text(
                    'phone number',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  const Text(
                    '+998998491210',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter your information to make changes',
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField('First Name'),
                  _buildTextField('Last Name'),
                  _buildTextField('Password', obscure: true),
                  _buildTextField('Confirm Password', obscure: true),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(2, context),
    );
  }

  Widget _buildTextField(String label, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: 'Enter $label',
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
