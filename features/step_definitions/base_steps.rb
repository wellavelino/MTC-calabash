######### GIVEN #########

######### WHEN #########

Quando(/^favoritar o filme$/) do
  @page = page(BuscaScreen).await(timeout: 3)
  @page.touch_favorite_movie
end

Quando(/^favoritar o filme detalhado$/) do
  @page = page(DetalhesFilmeScreen).await(timeout: 3)
  sleep(0.8)
  @page.touch_favorite
end

######### THEN #########

Então(/^devo visualizar a mensagem de erro "([^"]*)"$/) do |message|
  fail 'Message not found on the screen' unless
      @page.is_on_page? MESSAGES[message.tr(' ','_').to_sym]
end
