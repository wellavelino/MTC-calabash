class BuscaScreen < AndroidScreenBase

  trait(:trait) { "* id:'#{layout_name}'" }

    element(:layout_name) { 'home_omdb' }
    element(:title_field) { 'search_title' }
    element(:year_field) { 'year' }
    element(:search_button) { 'search' }
    element(:title_tab) { "* marked:'Lista filmes'" }
    element(:favorite_tab) { "* marked:'Favoritos'" }
    element(:movie) { 'movie' }
    element(:favorite_movie) { 'favorite' }

  MOVIES = ['Batman', 'Titanic', 'Transformers', 'spider man']
  INVALID_MOVIES = ['xablau', 'dollynho', 'sunomono']

  def search_movie
    enter_title MOVIES.sample
    touch_search_button
  end

  def search_invalid_movie
    enter_title INVALID_MOVIES.sample
    touch_search_button
  end

  def movies_searched?
    sleep(1)
    movies = query("* id:'#{movie}'")
    movies.count > 1
  end

  def select_movie
    touch "* id:'#{movie}' index:'#{rand(0..2)}'"
  end

  def touch_favorite_movie
    sleep(1)
    index = rand(0..2)
    touch_element_by_index favorite_movie, index
  end

  def movie_favorited?
    touch_screen_element 'Favorite tab', favorite_tab

    movies = query("* id:'#{movie}'")
    movies.count >= 1
  end
end
