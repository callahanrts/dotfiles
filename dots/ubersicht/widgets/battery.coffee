command: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'"

refreshFrequency: 15000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="./assets/font-awesome/css/font-awesome.min.css" />
  <div class="battery">
    <span class="battery"></span>
    <span class='icon'></span>
  </div>
  """

update: (output, el) ->
  $(".battery span.battery").text(output)
  bat = parseInt(output)
  $icon = $(".battery .icon", el)
  $icon.removeClass().addClass("icon")
  $icon.addClass("fa #{@icon(bat)}")
  $('.battery span').css('color', @color(bat))

icon: (output) =>
  return if output > 90
    "fa-battery-full"
  else if output > 70
    "fa-battery-three-quarters"
  else if output > 40
    "fa-battery-half"
  else if output > 20
    "fa-battery-quarter"
  else
    "fa-battery-empty"

color: (output) =>
  return if output > 70
    "#97c475" # Green
  else if output > 40
    "#e5c07b" # Yellow
  else
    "#e06c75" # Red

style: """
  div.battery
    margin: 0 auto
    width: 70px
  span.battery
    float: left
    font-size: 12px
    margin-top: 1px
  span
    padding: 4px 7px 0 0
  top: 0
  font: 15px sans-serif
  right: 70px
  width: 90px
  color: #fff
  height: 25px
"""
