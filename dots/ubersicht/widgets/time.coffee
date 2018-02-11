command: "date +\"%l:%M\""

refreshFrequency: 10000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="./assets/font-awesome/css/font-awesome.min.css" />
  <div class="time">
    <span></span>
    <span class="icon"></span>
  </div>
  """

update: (output, el) ->
    $(".time span:first-child", el).text(" #{output}")
    $icon = $(".time span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("far fa-clock")

style: """
  span
    padding: 5px 5px 0 5px
  .icon
    padding-left: 0
  color: #fff
  font: 14px sans-serif
  background-color: #2c323c
  height: 25px
  width: 70px
  vertical-align: middle
  right: 0px
  top: 0px
  padding: 0 7px
"""
