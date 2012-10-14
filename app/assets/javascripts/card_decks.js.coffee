jQuery ($) ->
  $('.card_face').click (e) ->
    $(e.delegateTarget).parent().children().toggle()
  masonryBlock = $(".deck[data-masonic]")
  if (masonryBlock.length > 0)
    masonryBlock.masonry
      itemSelector: '.card'
      isAnimated: true