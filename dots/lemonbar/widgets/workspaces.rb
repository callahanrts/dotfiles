require 'i3ipc'

class Workspaces

  def initialize(config)
    @config = config
    @i3 = I3Ipc::Connection.new
    i3ws = @i3.workspaces
    @workspaces = i3ws.map do |w|
      workspace_from_object w
    end
    #i3.close
    @display = workspace_display
  end

  def monitor(&block)
    i3block = Proc.new do |reply|
      case reply.change
      when "init"
        @workspaces << workspace_from_object(reply.current)
      when "focus"
        @workspaces.each do |w|
          w.focused = reply.current.num == w.num
        end
      when "empty"
        @workspaces.select!{ |w| w.num != reply.current.num }
      when "urgent"
      end
      @display = workspace_display
      block.call
    end
    pid = @i3.subscribe 'workspace', i3block
    pid.join
  end

  def to_s
    @display
  end

private

  def workspace_display
    "   #{workspace_icons}%{F#FFFFFF}"
  end

  def workspace_from_object(obj)
    OpenStruct.new({
      name: obj.name,
      num: obj.num,
      focused: obj.focused
    })
  end

  def workspace_icons
    workspace_icons = "%{F#CCCCCC}"
    workspaces = {
      '1' => icon(:chrome),
      '2' => icon(:terminal),
      '3' => icon(:headphone),
      '4' => icon(:chat),
      '5' => "",
      '6' => "",
      '7' => "",
      '8' => "",
      '9' => ""
      # '0' => " 0 "
    }
    workspaces.each do |key, icon|
      ws = @workspaces.select{|w| w.name == key}.first
      space = icon
      space = highlight(underline(space)) if !ws.nil? && ws.focused

      workspace_icons += click_handler(key, space)
    end
    workspace_icons
  end

  def click_handler space, text
    "%{A:i3-ipc 'workspace #{space}':}#{text}%{A}"
  end

  def highlight text
    # 373d48
   "%{B#282c34}#{text}%{B#282c34}"
  end

  def underline text
    "%{U#c678dd}%{+u 10}#{text}%{-u}"
  end

  # def bgcolor index
  #   @workspaces[index].focused ? "%{B#322038}" : "%{B#281c34}"
  # end

  def icon type
    headphone = `cat /etc/acpi/log/headphone.log`.strip == "plug" ? "\uf025" : "\uf001"
    icons = {
      chrome:    "\uf268",
      headphone: headphone,
      terminal:  "\uf120",
      chat:      "\uf086"
    }
    "   #{icons[type]}   "
  end

end

if __FILE__ == $PROGRAM_NAME
  ws = Workspaces.new({})
  ws.monitor { puts ws }
end
