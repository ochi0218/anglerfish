#
# jquery.datepickerを入力に利用する入力フォーム
#
class DatepickerInput < SimpleForm::Inputs::StringInput
  def input
    @builder.text_field(attribute_name, input_html_options) + @builder.hidden_field(attribute_name, { id: attribute_name.to_s + '-alt', class: attribute_name.to_s + '-alt'})
  end

  def input_html_classes
    super.push('form-control')
  end
end
