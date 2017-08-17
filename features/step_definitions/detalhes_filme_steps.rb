######### DADO #########

######### QUANDO #########

Quando(/^entrar nos detalhes do filme$/) do
  @page = page(BuscaScreen).await(timeout: 3)
  @page.touch_movie
end

######### ENTãO #########

Então(/^devo visualizar os detalhes do filme selecionado$/) do
  @page = page(DetalhesFilmeScreen).await(timeout: 3)
  @page.movie_details_visible?
end

Então(/^devo visualizar o filme na lista de favoritos$/) do
  @page.check_if_movie_is_favorite
end