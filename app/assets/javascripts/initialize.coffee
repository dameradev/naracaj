
jQuery(document).on 'turbolinks:load', ->
  $('.scroller').slick({
    arrows: false,
    autoplay: true,
    infinite: true,
    fade: true,
    pauseOnHover:false
  })
