command: "/usr/bin/osascript -e 'tell application \"System Events\"' -e 'set frontApp to name of first application process whose frontmost is true' -e 'end tell'"

refreshFrequency: false # ms

render: (output) ->
  ""
#  """
#  <div class="active">
#    <span>#{@titleize output}</span>
#  </div>
#  """
#
#style: """
#  .active
#    padding: 4px 3px 0 7px
#    display: block
#    width: 100%
#    height: 100%
#  color: #abb2bf
#  font: 12px sans-serif
#  left: 90px
#  top: 0
#  height: 25px
#  width: 100px
#  font: 14px sans-serif
#"""
#
#titleize: (title) =>
#  string_array = title.split(' ')
#  string_array = string_array.map (str) ->
#     return str.charAt(0).toUpperCase() + str.slice(1)
#  return string_array.join(' ')
