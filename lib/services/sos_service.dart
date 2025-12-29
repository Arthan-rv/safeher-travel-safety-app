class SosService {
  Future<String> triggerSOS({
    required double lat,
    required double lng,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock SOS ID
    return "SOS_123456";
  }

  Future<void> resolveSOS(String sosId) async {
    // Simulate backend confirmation
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
