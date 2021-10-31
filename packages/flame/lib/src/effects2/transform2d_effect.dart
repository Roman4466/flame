import '../components/position_component.dart';
import '../game/transform2d.dart';
import 'effect.dart';
import 'effect_controller.dart';

/// Base class for effects that target a [Transform2D] property.
///
/// Examples of effects of this kind include move effects, rotate effects,
/// shake effects, scale effects, etc. In order to apply such an effect to a
/// component simply add the effect as a child to that component.
///
/// Currently this class only supports being attached to [PositionComponent]s,
/// but in the future it will be extended to work with any [Transform2D]-based
/// classes.
abstract class Transform2DEffect extends Effect {
  Transform2DEffect(EffectController controller) : super(controller);

  late Transform2D target;

  @override
  void onMount() {
    super.onMount();
    assert(parent != null);
    if (parent is PositionComponent) {
      target = (parent! as PositionComponent).transform;
    }
    // TODO: add Camera support once it uses Transform2D
    else {
      throw UnsupportedError(
        'Can only apply a Transform2DEffect to a PositionComponent class',
      );
    }
  }
}
