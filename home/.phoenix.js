// log stream --process Phoenix

// Preferences
Phoenix.set({
  daemon: false,
  openAtLogin: true,
});

function log(...data) {
  Phoenix.log(...data);
}

// function profile(method) {
//   t1 = new Date().getTime();
//   method();
//   log(new Date().getTime() - t1);
// }

function changeFocus(dir) {
  const win = Window.focused();

  if (win) {
    const neighbors = win
      .neighbors(dir)
      .filter(n => n.isVisible());
    neighbors.length > 0 ? neighbors[0].focus() : log(`no neighbors ${dir}`);

    // win.focusClosestNeighbor(dir)
  }
}


Key.on('j', ['cmd'], changeFocus.bind(this, 'west'));
Key.on('k', ['cmd'], changeFocus.bind(this, 'east'));
