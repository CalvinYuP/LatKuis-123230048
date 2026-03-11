import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster image full width
            SizedBox(
              width: double.infinity,
              height: 280,
              child: Image.network(
                movie.imgUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.movie, size: 80, color: Colors.grey),
                  ),
                ),
              ),
            ),

            // Info section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and year
                  Text(
                    '${movie.title} (${movie.year})',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Directed by ${movie.director}',
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  const SizedBox(height: 12),

                  // Synopsis
                  Text(
                    movie.synopsis,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 16),

                  // Genre
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                          fontSize: 14, color: Colors.black),
                      children: [
                        const TextSpan(
                            text: 'Genre: ',
                            style:
                                TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: movie.genre),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Casts
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                          fontSize: 14, color: Colors.black),
                      children: [
                        const TextSpan(
                            text: 'Casts: ',
                            style:
                                TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: movie.casts.join(', ')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Rating
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star,
                            color: Colors.amber, size: 22),
                        const SizedBox(width: 6),
                        Text(
                          'Rated ${movie.rating}/10',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}