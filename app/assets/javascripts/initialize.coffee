jQuery(document).on('turbolinks:before-cache', $('.scroller').slick('unslick'))
jQuery(document).on 'turbolinks:load', ->
  $('.scroller').slick({
    arrows: false,
    autoplay: true,
    infinite: true,
    autoplaySpeed: 3000
  })
