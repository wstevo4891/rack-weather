# app\cells\layout_cell.rb

require 'cell'
require 'cell/erb'

class LayoutCell < Cell::ViewModel
  include ::Cell::Erb

  def show(&block)
    render(&block)
  end
end
