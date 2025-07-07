import 'package:flutter/foundation.dart';
import 'auth_service.dart';

class AppStateManager extends ChangeNotifier {
  final AuthService _authService;
  
  bool _isInitialized = false;
  bool _isLoading = false;

  // Getters
  bool get isInitialized => _isInitialized;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _authService.isLoggedIn;
  AuthService get authService => _authService;

  AppStateManager({required AuthService authService}) : _authService = authService {
    _authService.addListener(_onAuthStateChanged);
  }

  void _onAuthStateChanged() {
    notifyListeners();
  }

  Future<void> initialize() async {
    _setLoading(true);
    
    try {
      // Check if user has valid session
      if (_authService.isSessionValid()) {
        // Session is valid, user is logged in
        _isInitialized = true;
      } else if (_authService.getCurrentSession() != null) {
        // Session exists but might be expired, try to refresh
        await _authService.refreshSession();
        _isInitialized = true;
      } else {
        // No session, user needs to log in
        _isInitialized = true;
      }
    } catch (e) {
      // Handle initialization error
      _isInitialized = true;
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  @override
  void dispose() {
    _authService.removeListener(_onAuthStateChanged);
    super.dispose();
  }
}
