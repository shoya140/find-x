enchant()

window.onload = ->

  core = new Core(480, 320)
  core.onload = ->

    charas = 'abcdefghijklmnopqrstuvwyzABCDEFGHIJKLMNOPQRSTUVWYZ'

    Dummy = Class.create Label,
      initialize: (x, y) ->
        Label.call(this)
        this.x = x
        this.y = y
        this.text = charas.charAt(rand(50))
        this.on 'enterframe', ->
        core.rootScene.addChild(this)

    Answer = Class.create Label,
      initialize: (x, y) ->
        Label.call(this)
        this.x = x
        this.y = y
        this.text = 'x'
        this.on 'touchstart', ->
          location.reload()
        core.rootScene.addChild(this)

    time_label = new Label()
    time_label.x = 440
    time_label.y = 5
    time_label.color = 'red'
    time_label.font = '14px "Arial"'
    time_label.text = '0'
    time_label.on 'enterframe', ->
      time_label.text = (core.frame/core.fps).toFixed(2)
    core.rootScene.addChild(time_label)

    dummies = []
    for i in [0..20]
      dummies[i] = new Dummy(rand(470), rand(310))
    answer = new Answer(rand(470), rand(320))

  core.start()

rand = (n) ->
  return Math.floor(Math.random()*n)
