import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_rakam_dizisi/oyun_rakam_dizisi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(rakamDizisiConfig.title.length, 33);
    expect(rakamDizisiConfig.tagline.length, 33);
    for (final s in rakamDizisiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(rakamDizisiConfig.gameId, rakamDizisiId);
    expect(rakamDizisiRules.gameId, rakamDizisiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(rakamDizisiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: rakamDizisiId, optionalMechanics: rakamDizisiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(rakamDizisiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
