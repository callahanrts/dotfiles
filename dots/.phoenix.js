Phoenix.log('--');
Phoenix.log(
  Space.active()
    .windows()
    .map(w => w.title()),
);
Phoenix.log(Space.windows);

Key.on('j', ['cmd'], function() {
  var windows = Space.active()
    .windows()
    .filter(w => w.title());
  var index = 0;
  var cur = Window.focused().title();

  for (var w = 0; w < windows.length; w++) {
    if (cur == windows[w].title()) index = w;
  }

  index -= 1;
  index = index === -1 ? windows.length - 1 : index;
  windows[index].focus();
});

Key.on('k', ['cmd'], function() {
  var windows = Space.active()
    .windows()
    .filter(w => w.title());
  var index = 0;
  var cur = Window.focused().title();

  for (var w = 0; w < windows.length; w++) {
    if (cur == windows[w].title()) index = w;
  }

  windows[(index + 1) % windows.length].focus();
});
