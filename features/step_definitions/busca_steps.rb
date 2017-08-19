######### DADO #########

Dado(/^que estou na home$/) do
  @page = page(BuscaScreen).await(timeout: 2)
end

######### QUANDO #########

Quando(/^realizar a buscar por um filme$/) do
  @page.search_movie
end

Quando(/^realizar a busca por um filme inexistente$/) do
  @page.search_invalid_movie
end

Quando(/^inserir o ano para a buscar$/) do
  @page.enter_year rand(0..2000)
end

Quando(/^realizar a busca por título e ano$/) do
  @page.full_search
end

######### ENTãO #########

Então(/^devo visualizar o resultado da busca$/) do
  fail 'Movies not found' unless @page.movies_searched?
end