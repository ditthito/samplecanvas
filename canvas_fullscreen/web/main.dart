import 'dart:html';

CanvasElement canvas = querySelector('#canvasFullscreen')..focus();
CanvasRenderingContext2D context = canvas.context2D;

class CanvasApp {

  // CanvasApp() {}

  resize() {
    canvas.width  = window.innerWidth;
    canvas.height = window.innerHeight;
  }

  static const num GAME_SPEED = 50;

  num _lastTimeStamp = 0;

  void update(num delta) {
    final num diff = delta - _lastTimeStamp;

    if (diff > GAME_SPEED) {
      _lastTimeStamp = delta;
    }
    resize();
    run();
  }

  void run() {
      window.animationFrame.then(update);
      clear();
  }

  void clear() {
    context..fillStyle = "blue"
    ..fillRect(0, 0, canvas.width, canvas.height);
  }
}

void main() {
  new CanvasApp()..run();
}
