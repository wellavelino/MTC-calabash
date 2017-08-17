class BuscaScreen < AndroidScreenBase

  trait(:trait) { "* id:'#{layout_name}'" }

  element(:layout_name) { 'home_omdb' }
  element(:title_field) { 'title' }
  element(:year_field) { 'year' }
  element(:search_button) { 'search' }
  element(:title_tab) { "* marked:'Lista filmes'" }
  element(:favorite_tab) { "* marked:'Favoritos'" }
  element(:movie) { 'movie' }
  element(:favorite) { 'favorite' }

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
    sleep(0.3)
    movies = query("* id:'#{movie}'")
    movies.count > 1
  end

  def select_movie
    touch "* id:'#{movie}' index:'#{rand(0..2)}'"
  end

  def touch_favorite_movie
    index = rand(0..2)
    @movie = query("* id:'#{movie}' index:'#{index}'", :text).first
    touch("* id:'#{favorite}' index:'#{index}'")
  end

  def movie_favorited?
    element_exists("* marked:'#{@movie}'")
  end
end
