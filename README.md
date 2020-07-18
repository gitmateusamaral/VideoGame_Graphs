# Gráficos sobre o mercado de jogos – Mateus Amaral

## Sobre a base de dados:

**A base de dados final possui as seguintes variáveis:**

- Metascore(avaliação dos críticos, varia de 0 a 100)
- Game(nome do jogo)
- Platform(plataforma em que o jogo foi lançado)
- Userscore(avaliação dos jogadores, varia de 0 a 10)
- Date(data de lançamento)
- Price(preço no lançamento)
- Owners(quantidade de vendas)
- Publisher(empresa que publicou o jogo)
- Average playtime(média do tempo de jogo)
- Median playtime(mediana do tempo de jogo)

As colunas average playtime e median playtime possuem linhas faltando, logo serão ignoradas
na formação dos gráficos.

## Objetivo:

Os objetivos desses gráficos são, visualizar se a o Metascore e o Userscore possuem alguma
correlação, visto que teoricamente eles devem possuir alguma correlação. O segundo objetivo
é visualizar se os jogos com as melhores avaliações da crítica também são os jogos mais
vendidos, já que eles teoricamente os melhores jogos são mais procurados pelos jogadores. Por
fim o último objetivo é descobrir qual a plataforma com maior número de downloads e ver se
existe alguma que se sobressai em comparação com o resto.

Com os gráficos estáticos e o interativo presentes nesse documento, é possível compreender
um pouco mais sobre o funcionamento das avaliações e downloads de jogos nas principais
plataformas, conseguindo alcançar uma noção sobre o funcionamento do mercado de jogos
como um todo.

**OBS1: Os gráficos estáticos abaixo em alta resolução são encontrados nesse link (fortemente
recomendado para compreender os gráficos):**

[http://mateusamaral.me/graficosestaticos/](http://mateusamaral.me/graficosestaticos/)


## Gráficos estáticos:

**Gráfico de dispersão entre metascore e userscore:**

<p align="center">
  <img src="https://i.imgur.com/QLsqTIT.jpg">
</p>

Esse gráfico possui o objetivo de permitir analisar se o metascore e o userscore são diretamente
proporcionais, e como é possível observar, de fato eles são, visto que conforme o userscore
aumenta, o metascore também tende a ser maior, porém essa relação não é extremamente
forte.

**Gráfico lollipop dos 50 melhores jogos pela crítica:**

<p align="center">
  <img src="https://i.imgur.com/1mDSEgG.png">
</p>

Esse gráfico tem como objetivo apresentar os 50 jogos com os maiores metascore, e junto com
o gráfico abaixo (Gráfico dos jogos mais vendidos) é possível analisar se os jogos com as
melhores avaliações dos críticos também são os com mais download.

**Gráfico lollipop dos jogos mais baixados:**

<p align="center">
  <img src="https://i.imgur.com/yEhoWHs.png">
</p>

Esse gráfico apresenta os 30 jogos mais baixados. Analisando esse gráfico junto com o dos 50
melhores jogos pela crítica, é possível observar que alguns jogos (como The Witcher 3: Wild
Hunt) aparecem em ambos os gráficos, porém, nem sempre isso ocorre. Isso provavelmente
acontece porque muitos jogos aclamados pela crítica são extremamente nichados e acabam não
agradando o grande público.


**Gráfico de barra das melhores plataformas:**

<p align="center">
  <img src="https://i.imgur.com/BUcyM0b.jpg">
</p>

Esse gráfico permite visualizar as plataformas que mais possuem downloads, e é possível
observar que o Computador se destaca dos demais, possuindo quase 10 vezes mais que o
segundo colocado. Isso mostra que na área dos jogos, o computador é soberano no número de
downloads.


**Gráfico de barras da quantidade de download por ano:**

<p align="center">
  <img src="https://i.imgur.com/lEhWsx3.jpg">
</p>

Nesse gráfico é possível observar que o ano com mais downloads foi o de 2013. Essa discrepância
ocorreu, provavelmente, porque esse foi o ano de diversos jogos populares, como GTA V e
BioShock Infinite.


**Gráfico de densidade das notas do Metascore e Userscore:**

<p align="center">
  <img src="https://i.imgur.com/k1HGs4x.jpg">
</p>

Nesse gráfico é apresentada a densidade das notas da crítica e dos jogadores, e é possível
observar que ambas possuem a maior densidade entre a nota 75 e 85, o que nos ajuda a concluir
que aparentemente as notas dos jogadores e dos críticos costumam ser próximas.


## Gráfico Interativo (CLIQUE NO LINK ABAIXO PARA VER O GRÁFICO INTERATIVO):

**OBS2: Para visualizar o gráfico com a interatividade presente nele, é necessário abrir esse link
(fortemente recomendado para utilizar a parte interativa do gráfico):**

[http://mateusamaral.me/graficofinal/](http://mateusamaral.me/graficofinal/)

<p align="center">
  <a href="http://mateusamaral.me/graficofinal/" title="Redirect to dynamic graph">
      <img src="https://i.imgur.com/wth0wCd.jpg">
  </a>
</p>

Esse gráfico possui uma forte inspiração no gráfico bubble chart do Gapminder. Esse gráfico
interativo posiciona os jogos utilizando o userscore e o metascore, o tamanho das observações
é baseado na quantidade de downloads daquele jogo e a cor é a plataforma em que ele foi
lançado, para saber as informações precisas de uma observação, basta colocar o mouse nela e
uma tooltip irá aparecer mostrando os valores importantes dessa observação.

Com esse gráfico, foi possível reunir todas as informações encontradas nos gráficos
estáticos, nele é possível ver jogos com muitos download mas com notas medianas, ver que o
gráfico é densamente populado por observações da plataforma do PC, ver que a maioria das
observações ficam naquela região encontrada no gráfico de densidade e ver que geralmente
quando uma das avaliações é alta a outra também costuma ser. Com isso, é possível reunir todas
essas informações e apresentar em um só gráfico sem deixar ele confuso ou difícil de visualizar.

**OBS3: Todas as cores utilizadas nos gráficos foram escolhidas dentro do [Color Brewer 2.0](https://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3).**

**OBS4: Essa base de dados, por ser “antiga”, possui alguns dados que acabam não batendo com
os encontrados atualmente, um exemplo disso é o jogo GTA V que recentemente alcançou a
marca de 120 milhões de unidades vendidas, porém nessa base de dados está com apenas 10
milhões**


<p align="center">
  <a href="http://mateusamaral.me" title="Redirect to dynamic graph">
    <img src="http://i.imgur.com/S7dFZjw.png/">
  </a>
</p>
