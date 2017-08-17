class DetalhesFilmeScreen < AndroidScreenBase
  # Identificador da tela
  trait(:trait) { "* id:'#{layout_name}'" }

  # Declare todos os elementos da tela
  element(:layout_name) { 'toolbar' }
  element(:movie_title) { 'title' }
  element(:movie_subtitle) { 'subtitle' }
  element(:movie_description) { 'description' }
  element(:movie_poster) { 'poster' }
  element(:favorite) { 'favorite' }
  element(:back_toolbar) {"* marked:'voltar'"}
  element(:favorite_tab) { "* marked:'Favoritos'"}

  def movie_details_visible?
   return element_exists("* id:'#{movie_title}'") &&
        element_exists("* id:'#{movie_subtitle}'") &&
        element_exists("* id:'#{movie_description}'") &&
        element_exists("* id:'#{movie_poster}'")
  end

  def check_if_movie_is_favorite
    movie_name = query("* id:'#{movie_title}'", :text).first

    touch_screen_element 'back button', back_toolbar
    touch_screen_element 'Favorite tab', favorite_tab

    sleep(0.3)
    element_exists("* marked:'#{movie_name}'")
  end
end
