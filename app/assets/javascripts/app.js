


// Some general UI pack related JS
// Extend JS String with repeat method
String.prototype.repeat = function(num) {
    return new Array(num + 1).join(this);
};


$(document).ready(function() {

//The following set of code checks to see if any tab is already active (this occurs if a parameter to tab would be passed)
//If no tab is active, make the first tab and tab-pane active
var elementAlreadyActive = false;
$('.nav-tabs li').each(function(index, li) {
    var element = $(li);
     if (element.attr("class") == "active"){
          elementAlreadyActive = true;
     }

});
if (!elementAlreadyActive){
    $('.nav-tabs li:first').addClass('active');
    $('.tab-content div:first').addClass('active');
} });

$(document).ready(function() {

    // Custom Selects
    $("select[name='huge']").selectpicker({style: 'btn-huge btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='large']").selectpicker({style: 'btn-large btn-danger'});
    $("select[name='info']").selectpicker({style: 'btn-info'});
    $("select[name='small']").selectpicker({style: 'btn-small btn-warning'});


    // Tooltips
    $("[data-toggle=tooltip]").tooltip("show");

    // Tags Input
    $(".tagsinput").tagsInput();


    // Add style class name to a tooltips
    $(".tooltip").addClass(function() {
      if ($(this).prev().attr("data-tooltip-style")) {
        return "tooltip-" + $(this).prev().attr("data-tooltip-style");
      }
    });

    // Placeholders for input/textarea
    $("input, textarea").placeholder();

    // Make pagination demo work
    $(".pagination a").on('click', function() {
      $(this).parent().siblings("li").removeClass("active").end().addClass("active");
    });

    $(".btn-group a").on('click', function() {
      $(this).siblings().removeClass("active").end().addClass("active");
    });

    // Disable link clicks to prevent page scrolling
    $('a[href="#fakelink""]').on('click', function(e) {
      e.preventDefault();
    });

    // jQuery UI Spinner
    $.widget( "ui.customspinner", $.ui.spinner, {
      _buttonHtml: function() { // Remove arrows on the buttons
        return "" +
        "<a class='ui-spinner-button ui-spinner-up ui-corner-tr'>" +
          "<span class='ui-icon " + this.options.icons.up + "'></span>" +
        "</a>" +
        "<a class='ui-spinner-button ui-spinner-down ui-corner-br'>" +
          "<span class='ui-icon " + this.options.icons.down + "'></span>" +
        "</a>";
      }
    });

    $('#spinner-01').customspinner({
      min: -99,
      max: 99
    }).on('focus', function() {
      $(this).closest('.ui-spinner').addClass('focus');
    }).on('blur', function() {
      $(this).closest('.ui-spinner').removeClass('focus');
    });


    // Focus state for append/prepend inputs
    $('.input-prepend, .input-append').on('focus', 'input', function() {
      $(this).closest('.control-group, form').addClass('focus');
    }).on('blur', 'input', function() {
      $(this).closest('.control-group, form').removeClass('focus');
    });

    // Table: Toggle all checkboxes
    $('.table .toggle-all').on('click', function() {
      var ch = $(this).find(':checkbox').prop('checked');
      $(this).closest('.table').find('tbody :checkbox').checkbox(!ch ? 'check' : 'uncheck');
    });

    // Table: Add class row selected
    $('.table tbody :checkbox').on('check uncheck toggle', function(e) {
      var $this = $(this)
        , check = $this.prop('checked')
        , toggle = e.type == 'toggle'
        , checkboxes = $('.table tbody :checkbox')
        , checkAll = checkboxes.length == checkboxes.filter(':checked').length

      $this.closest('tr')[check ? 'addClass' : 'removeClass']('selected-row');
      if (toggle) $this.closest('.table').find('.toggle-all :checkbox').checkbox(checkAll ? 'check' : 'uncheck');
    });

    // jQuery UI Datepicker
    $('#datepicker-01').datepicker({
      showOtherMonths: true,
      selectOtherMonths: true,
      dateFormat: "d MM, yy",
      yearRange: '-1:+1'
    }).prev('.btn').on('click', function(e) {
      e && e.preventDefault();
      $('#datepicker-01').focus();
    });
    $.extend($.datepicker, {_checkOffset:function(inst,offset,isFixed){return offset}});

    // Custom checkboxes
    $('[data-toggle="checkbox"]').checkbox();

    // Custom radios
    $('[data-toggle="radio"]').radio();

    // Switch
    $("[data-toggle='switch']").wrap('<div class="switch" />').parent().bootstrapSwitch();

    // Stackable tables
    $(".table-striped").stacktable({id: "rwd-table"});
});
