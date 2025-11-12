import 'package:flutter/material.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _message = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 800;
                  final fields = [
                    Flexible(
                      child: TextFormField(
                        controller: _name,
                        decoration: const InputDecoration(labelText: 'Name'),
                        validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter your name' : null,
                      ),
                    ),
                    const SizedBox(width: 16, height: 16),
                    Flexible(
                      child: TextFormField(
                        controller: _email,
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (v) => (v == null || !v.contains('@')) ? 'Enter a valid email' : null,
                      ),
                    ),
                  ];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (isWide)
                        Row(children: fields)
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: fields,
                        ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _message,
                        maxLines: 5,
                        decoration: const InputDecoration(labelText: 'Message'),
                        validator: (v) => (v == null || v.trim().length < 10) ? 'Please enter at least 10 characters' : null,
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FilledButton.icon(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Thanks! Your message has been prepared.')),
                              );
                            }
                          },
                          icon: const Icon(Icons.send),
                          label: const Text('Send'),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}


