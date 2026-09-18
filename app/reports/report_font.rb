module ReportFont
  FONT_PATH = Rails.root.join("app/assets/fonts")

  FAMILY = {
    "Liberation Sans" => {
      normal:      FONT_PATH.join("LiberationSans-Regular.ttf").to_s,
      bold:        FONT_PATH.join("LiberationSans-Bold.ttf").to_s,
      italic:      FONT_PATH.join("LiberationSans-Italic.ttf").to_s,
      bold_italic: FONT_PATH.join("LiberationSans-BoldItalic.ttf").to_s
    }
  }.freeze

  def initialize(options = {}, &block)
    super
    font_families.update(FAMILY)
    font "Liberation Sans"
  end
end
