command: "ESC=`printf \"\e\"`; ps -A -o %cpu | awk '{s+=$1} END {printf(\"%.2f\",s/8);}'"

refreshFrequency: 2000 # ms

render: (output) ->
  """
  <div class="cpu">
    <span></span>
    <span class="icon"></span>
  </div>
  """

update: (output, el) ->
    $(".cpu span:first-child", el).text("  #{output}")
    $icon = $(".cpu span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa fa-microchip")

style: """
  .cpu .icon
    margin-left: 3px
    color: #4b5263
  color: #828997
  font: 12px sans-serif
  right: 165px
  top: 0px
  padding-top: 5px
  height: 25px
"""
