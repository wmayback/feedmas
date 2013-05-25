// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require libs/jquery.pjax
//= require_tree .

jQuery(document).ready(function () {



  // $('#proftab a').click(function (e) {
  //     $('ul.nav-tabs li.active').removeClass('active')
  //     $(this).parent('li').addClass('active')
  // });

  // $('#wall').imagesLoaded(function() {

    var $container = $('#wall');
      $select = $('#filters select');

    // initialize Isotope
    $container.isotope({
    // options...
    resizable: false, // disable normal resizing
    // set columnWidth to a percentage of container width
      masonry: { columnWidth: $container.width() / 12 }
    });

    // update columnWidth on window resize
    $(window).smartresize(function(){

      $container.isotope({
      // update columnWidth to a percentage of container width
        masonry: { columnWidth: $container.width() / 12 }
      });
    });


    $container.isotope({
      itemSelector : '.card',
      sortBy : 'original-order'
    });

    $select.change(function() {

      var filters = $(this).val();

        $container.isotope({
          filter: filters
        });

      });

      var $optionSets = $('#filters .option-set'),
        $optionLinks = $optionSets.find('a');

        $optionLinks.click(function(){

        var $this = $(this);
        // don't proceed if already selected
        if ( $this.hasClass('selected') ) {
            return false;
        }
      var $optionSet = $this.parents('.option-set');
      $optionSet.find('.selected').removeClass('selected');
      $this.addClass('selected');

      // make option object dynamically, i.e. { filter: '.my-filter-class' }
      var options = {},
        key = $optionSet.attr('data-option-key'),
        value = $this.attr('data-option-value');
      // parse 'false' as false boolean
      value = value === 'false' ? false : value;
      options[ key ] = value;
      if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' ) {
        // changes in layout modes need extra logic
        changeLayoutMode( $this, options )
      } else {
        // otherwise, apply new options
        $container.isotope( options );
      }

      return false;

      });

  });

});


$(function() {
  $(document.body).on('appear', '.card', function(e, $affected) {
    // add class called “appeared” for each appeared element
    $(this).addClass("appeared");
  });
  $('.card').appear({force_process: true});
});



// Some general UI pack related JS
// Extend JS String with repeat method
String.prototype.repeat = function(num) {
    return new Array(num + 1).join(this);
};

(function($) {

  // Add segments to a slider
  $.fn.addSliderSegments = function (amount) {
    return this.each(function () {
      var segmentGap = 100 / (amount - 1) + "%"
        , segment = "<div class='ui-slider-segment' style='margin-left: " + segmentGap + ";'></div>";
      $(this).prepend(segment.repeat(amount - 2));
    });
  };

  $(function() {

    // Custom Selects
    $("select[name='huge']").selectpicker({style: 'btn-huge btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='large']").selectpicker({style: 'btn-large btn-danger'});
    $("select[name='info']").selectpicker({style: 'btn-info'});
    $("select[name='small']").selectpicker({style: 'btn-small btn-warning'});


    // Tooltips
    $("[data-toggle=tooltip]").tooltip("show");

    // Tags Input
    $(".tagsinput").tagsInput();

    // jQuery UI Sliders
    var $slider = $("#slider");
    $slider.slider({
      min: 1,
      max: 5,
      value: 3,
      orientation: "horizontal",
      range: "min"
    }).addSliderSegments($slider.slider("option").max);

    var $slider2 = $("#slider2");
    $slider2.slider({
      min: 1,
      max: 5,
      values: [3, 4],
      orientation: "horizontal",
      range: true
    }).addSliderSegments($slider2.slider("option").max);

    var $slider3 = $("#slider3")
      , slider3ValueMultiplier = 100
      , slider3Options;
    $slider3.slider({
      min: 1,
      max: 5,
      values: [3, 4],
      orientation: "horizontal",
      range: true,
      slide: function(event, ui) {
        $slider3.find(".ui-slider-value:first").text("$" + ui.values[0] * slider3ValueMultiplier).end()
                .find(".ui-slider-value:last").text("$" + ui.values[1] * slider3ValueMultiplier);
      }
    });
    slider3Options = $slider3.slider("option");
    $slider3.addSliderSegments(slider3Options.max).find(".ui-slider-value:first").text("$" + slider3Options.values[0] * slider3ValueMultiplier).end()
            .find(".ui-slider-value:last").text("$" + slider3Options.values[1] * slider3ValueMultiplier);

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
    $('a[href="#fakelink""]').on('click', function (e) {
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
    }).on('focus', function () {
      $(this).closest('.ui-spinner').addClass('focus');
    }).on('blur', function () {
      $(this).closest('.ui-spinner').removeClass('focus');
    });


    // Focus state for append/prepend inputs
    $('.input-prepend, .input-append').on('focus', 'input', function () {
      $(this).closest('.control-group, form').addClass('focus');
    }).on('blur', 'input', function () {
      $(this).closest('.control-group, form').removeClass('focus');
    });

    // Table: Toggle all checkboxes
    $('.table .toggle-all').on('click', function() {
      var ch = $(this).find(':checkbox').prop('checked');
      $(this).closest('.table').find('tbody :checkbox').checkbox(!ch ? 'check' : 'uncheck');
    });

    // Table: Add class row selected
    $('.table tbody :checkbox').on('check uncheck toggle', function (e) {
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
    }).prev('.btn').on('click', function (e) {
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
})(jQuery, document, window);
