(function() {
  var rand;

  enchant();

  window.onload = function() {
    var core;
    core = new Core(480, 320);
    core.onload = function() {
      var Answer, Dummy, answer, charas, dummies, i, time_label, _i;
      charas = 'abcdefghijklmnopqrstuvwyzABCDEFGHIJKLMNOPQRSTUVWYZ';
      Dummy = Class.create(Label, {
        initialize: function(x, y) {
          Label.call(this);
          this.x = x;
          this.y = y;
          this.text = charas.charAt(rand(50));
          this.on('enterframe', function() {});
          return core.rootScene.addChild(this);
        }
      });
      Answer = Class.create(Label, {
        initialize: function(x, y) {
          Label.call(this);
          this.x = x;
          this.y = y;
          this.text = 'x';
          this.on('touchstart', function() {
            return location.reload();
          });
          return core.rootScene.addChild(this);
        }
      });
      time_label = new Label();
      time_label.x = 440;
      time_label.y = 5;
      time_label.color = 'red';
      time_label.font = '14px "Arial"';
      time_label.text = '0';
      time_label.on('enterframe', function() {
        return time_label.text = (core.frame / core.fps).toFixed(2);
      });
      core.rootScene.addChild(time_label);
      dummies = [];
      for (i = _i = 0; _i <= 20; i = ++_i) {
        dummies[i] = new Dummy(rand(470), rand(310));
      }
      return answer = new Answer(rand(470), rand(320));
    };
    return core.start();
  };

  rand = function(n) {
    return Math.floor(Math.random() * n);
  };

}).call(this);
