import 'dart:html';

class CanvasApp {
  CanvasElement canvas;
  CanvasRenderingContext2D context;
  ImageElement blueCoinImage = new ImageElement(src: './images/blue_coin.png');

  CanvasApp() {
      canvas = querySelector('#coinAnimation');
      canvas.width = 100;
      canvas.height = 100;
      context = canvas.context2D;
  }

  static const num GAME_SPEED = 50;

  num _lastTimeStamp = 0;

  var frameIndex = 0;
  var numberOfFrames = 10;

  void update(num delta) {
    final num diff = delta - _lastTimeStamp;

    if (diff > GAME_SPEED) {
      _lastTimeStamp = delta;
      if (frameIndex < numberOfFrames - 1) {
        frameIndex += 1;
      } else {
        frameIndex = 0;
      }
      clear();
      blueCoin();
    }
    run();
  }

  void run() {
    window.animationFrame.then(update);
  }

  void clear() {
    context..fillStyle = "white"
    ..fillRect(0, 0, canvas.width, canvas.height);
  }

  String sizeScreen() {
    return '${window.innerWidth}, ${window.innerHeight}';
  }

  void blueCoin() {
    context.drawImageScaledFromSource(
      blueCoinImage, frameIndex*100, 0, 100, 100, 0, 0, 100, 100
    );
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.run();
  DivElement showSizeScreen = querySelector('#sizeScreen');
  showSizeScreen.text = canvasApp.sizeScreen();
}
