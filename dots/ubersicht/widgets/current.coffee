command: "echo $(chunkc tiling::query -d id)"

refreshFrequency: 1000

render: (output) ->
  """
    <ul>
      <li id="desktop1"><span class="fas fa-terminal"></span></li>
      <li id="desktop2"><span class="fab fa-firefox"></span></li>
      <li id="desktop3"><span class="fab fa-slack-hash"></span></li>
      <li id="desktop4"><span class="fab fa-spotify"></span></li>
    <ul>
  """

style: """
  position: relative
  font: 12px sans-serif
  color: #828997
  top: 0
  left: 0
  height: 25px
  ul
    padding: 0
    margin: 0 0 0 10px
    list-style: none
  li
    text-align: center
    width: 25px
    height: 25px
    padding: 0
    display: inline-block
    margin: 0
  li.active
    color: #fff
    width: 25px
    height: 23px
    border-bottom: 2px solid #c678dd
  li.active span
    margin-top: 6px
"""

update: (output, domEl) ->
  if ($(domEl).find('li.active').id isnt output)
    $(domEl).find('li.active').removeClass('active')
    $(domEl).find('li#desktop' + output).addClass('active')

  # $('#desktop1').on "click", => @run "/opt/local/bin/qes -k 'cmd + alt - 1'"
  # $('#desktop2').on "click", => @run "/opt/local/bin/qes -k 'cmd + alt - 2'"
  # $('#desktop3').on "click", => @run "/opt/local/bin/qes -k 'cmd + alt - 3'"
  # $('#desktop4').on "click", => @run "/opt/local/bin/qes -k 'cmd + alt - 4'"
  # $('#desktop5').on "click", => @run "/opt/local/bin/qes -k 'cmd + alt - 5'"
