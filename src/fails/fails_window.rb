class FailsWindow < javax.swing.JWindow
  java_import 'java.awt.Color'
  java_import 'javax.swing.BoxLayout'

  def initialize(*args)
    super
    self.background = Color.red
    self.layout     = BoxLayout.new(content_pane, BoxLayout::PAGE_AXIS)
  end
end