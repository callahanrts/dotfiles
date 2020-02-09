// log stream --process Phoenix

function log(...data) {
  Phoenix.log(...data);
}

function profile(method) {
  t1 = new Date().getTime();
  method();
  log(new Date().getTime() - t1);
}

function changeFocus(dir) {
  const focused = Window.focused();
  log('change focus ' + dir)
  if (focused) {
    const neighbors = focused.neighbors(dir).filter(n => n.title());
    neighbors.length > 0 ? neighbors[0].focus() : log(`no neighbors ${dir}`);
  } else {
    log('No focused window');
  }
}

Key.on('j', ['cmd'], changeFocus.bind(this, 'west'));
Key.on('k', ['cmd'], changeFocus.bind(this, 'east'));
