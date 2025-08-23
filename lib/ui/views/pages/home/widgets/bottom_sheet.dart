import 'package:flutter/material.dart';
import 'package:simple_post_app_challenge/core/network/comment_model.dart';

class BuildSheet extends StatelessWidget {
  final List<CommentModel> comments;

  const BuildSheet({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(16),
      child: comments.isEmpty
          ? const Center(child: Text("No Comments"))
          : ListView.separated(
              itemCount: comments.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final c = comments[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      c.name!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.teal,
                      ),
                    ),
                    subtitle: Text(
                      c.body!,
                      style: TextStyle(color: Colors.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(
                      c.email!,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color.fromARGB(255, 49, 49, 49),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
