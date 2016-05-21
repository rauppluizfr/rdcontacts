$(document).on("change", ".select_field_type", function() {

  if( this.value === 'CustomFormComboBox') {
    $("#custom_data").show();
  } else {
    $("#custom_data").hide();
    $("#custom_data_fields").empty();
  }
});

$(document).on("click", ".add_new_extra_data", function() {
  console.log("aqui inferno!");
  console.log(this);
  console.log($('.extra_data_field').val());
  value = $('.extra_data_field').val();

  $('<div class="modal-body"><input class="form-control custom_field_extra_data" name="custom_form_field[extra_data_attributes][][name]" value="'+value+'"></div>').appendTo("#custom_data_fields");

});
