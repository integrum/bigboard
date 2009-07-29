require 'fails_window'

class FailsView < ApplicationView
  java_import 'java.awt.Toolkit'
  java_import 'java.awt.Color'
  java_import 'java.awt.Font'
  java_import 'javax.swing.JLabel'

  raw_mapping :display_fails, nil

  def create_main_view_component
    FailsWindow.new
  end

  def load
    @main_view_component.set_size(Toolkit.default_toolkit.screen_size)
  end

  def add_text(text)
    label = JLabel.new(text)
    label.foreground = Color.white
    label.font = label.font.derive_font(56.0)
    label.alignment_x = 0.5
    @main_view_component.add label
  end

  def display_fails(model, transfer)
    @main_view_component.content_pane.remove_all
    if model.fails.empty?
      @main_view_component.background = Color.green
      add_text "All is well"
    else
      @main_view_component.background = Color.red
      add_text "Fail!"
      model.fails.each do |fail|
        add_text fail
      end
    end
    @main_view_component.content_pane.revalidate
  end
end
