import 'package:extinct/presentation/widgets/app_bar_leading_button/app_bar_leading_button.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarLeadingButton(
          icon: Icons.close,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Image.asset('assets/ic_foreground.png'),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Animal Rewind',
                          style: Theme.of(context).textTheme.titleLarge),
                      const Text('0.0.1'),
                      const Text('© 2024 Joseph León '),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16.0),
              Text('About', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8.0),
              const Text(
                  'Welcome to our unique application where you can converse with extinct animals thanks to the advanced artificial intelligence of Gemini! This app has been specially created for the Gemini API Competition, showcasing the power of technology in education and environmental awareness.'),
              const SizedBox(height: 16.0),
              Text('Our Mission',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8.0),
              const Text(
                  'The purpose of this application is twofold: we want users to value the incredible diversity of fauna that once inhabited our planet and, at the same time, to become aware of the damage that humans have caused to the environment. Through interactive conversations with animals like the Tasmanian Tiger, the Dodo, and the Quagga, we aim to inspire greater appreciation and responsibility towards our natural surroundings.'),
              const SizedBox(height: 16.0),
              Text('Your Participation',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8.0),
              const Text(
                  'By interacting with these fascinating extinct animals, you will not only learn about their characteristics and the history of their extinction but also become an advocate for the preservation of current wildlife. Together, we can work towards a future where extinction is merely a lesson from the past and not a present reality.'),
              const SizedBox(height: 16.0),
              const Text(
                  'Thank you for being part of this educational and inspiring experience. We hope you enjoy conversing with our ambassadors from the past and join us in our mission to protect and value our incredible fauna!'),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
