import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/youtube/v3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleSignIn _googleSignIn;
  GoogleSignInAccount? _currentUser;
  List<PlaylistItemSnippet>? _favoriteVideos;

  @override
  void initState() {
    _googleSignIn = GoogleSignIn(scopes: [YouTubeApi.youtubeReadonlyScope]);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _googleSignIn.signIn();
      _googleSignIn.onCurrentUserChanged.listen((account) async {
        setState(() => _currentUser = account);
        if (_currentUser != null) await _getVideos();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (_currentUser != null) ListTile(
            leading: GoogleUserCircleAvatar(identity: _currentUser!),
            title: Text(_currentUser?.displayName ?? 'Loading...'),
            subtitle: Text(_currentUser?.email ?? 'Loading email...'),
          ),
          ListView.builder(
            itemCount: _favoriteVideos?.length ?? 0,
            itemBuilder: (context, index) {
            final PlaylistItemSnippet fav = _favoriteVideos![index];
          
            return ListTile(
              leading: Image.network(fav.thumbnails!.standard!.url!),
              title: Text(fav.title ?? '?'),
              subtitle: Text(fav.publishedAt?.toString() ?? '?'),
            );
          },
          )
        ],
      ),
    );
  }
  
  Future<void> _getVideos() async {
    final authClient = await _googleSignIn.authenticatedClient();
    final youtubeApi = YouTubeApi(authClient!);
    final favorites = await youtubeApi.playlistItems.list([
      'snippet',
    ], playlistId: 'LL');

    setState(() {
      _favoriteVideos = favorites.items!.map((e) => e.snippet!).toList();
    });
  }
}
