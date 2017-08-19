######### DADO #########

Dado(/^que efetuei uma busca por um filme$/) do
  steps %{
    E que estou na home
    E realizar a buscar por um filme
  }
end


######### QUANDO #########

######### ENTãO #########

Então(/^devo visualizar o filme adicionado com sucesso na lista de favoritos$/) do
  sleep(0.5)
  fail 'Movie not favorited' unless @page.movie_favorited?
end
