jQuery ($) ->
  pressEnterLinks = $("a[data-press-enter]") 
  if (pressEnterLinks.length == 1)
    $(document).jkey 'enter', ->
      window.location = pressEnterLinks.attr('href')
