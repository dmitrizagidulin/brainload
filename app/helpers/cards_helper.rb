module CardsHelper
  def onward_button
    link_to("\u23ce Onward!",
            review_path(review.next),
            class: 'btn btn-large',
            :'data-press-enter' => true
      )
  end
end
