#https://towardsdatascience.com/analyzing-video-games-data-in-r-1afad7122aab

install.packages("tidyverse")
install.packages("lubridate")
install.packages("ggpubr")
install.packages("patchwork")
install.packages("ggalt")
install.packages("extrafont")
install.packages("ggthemes")
library(tidyverse) ## For data wrangling and visualization
library(lubridate) ## To work with dates
library(ggpubr)    ## Extra visualizations and themes
library(patchwork) ## Patch visualizations together
library(ggalt)     ## Extra visualizations
library(extrafont) ## Exta fonts
library(plotly)
library(gganimate)

#Aluno: Mateus Amaral do Nascimento

#Criando a base de dados######################################################################

video_games <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-07-30/video_games.csv") %>%
  mutate(release_date = as.Date(release_date, "%b %d, %Y")) %>%
  distinct(game, developer, publisher, .keep_all = TRUE)

#Caso seja aberto em outro computador o caminho tem que ser modificado
metacritic_games <- read_csv("C:\\Users\\reicl\\Downloads\\FGV\\EMAP\\TrabalhoFinal_MateusAmaral\\EntregaFinal\\metacriticdb\\result.csv",trim_ws = TRUE)
colnames(metacritic_games) <- c("metascore", "game","platform","userscore","date")

names(games.features$QueryID) <- "game" 

games_final <- metacritic_games %>%
  inner_join(video_games,by = "game") %>%
  mutate(owners=parse_number(owners,trim_ws = TRUE)) %>%
  mutate(publisher = case_when(str_detect(publisher,pattern = "Warner Bros|WB")~"Warner Brothers",TRUE~publisher)) %>% 
  select(-c(release_date,developer,number,metascore.y))
  
games_final <- games_final %>%
  filter(platform!="VITA", platform!="WII", platform!="WIIU", platform!="XBOX", platform!="PS2", platform!="3DS", 
         platform!="DC", platform!="DS", platform!="GBA", platform!="GC", platform!="PS", platform!="PSP")

games_final <- games_final %>% distinct(game, .keep_all = TRUE)

games_final <- games_final %>% filter(average_playtime!=0)

games_final$price[is.na(games_final$price)] <- 0.00

games_final$year <- sub(".*, ", "", games_final$date)

top_50_games <- games_final %>% group_by(game) %>% summarise(metascore.x = max(metascore.x, na.rm = TRUE)) %>% top_n(50)

top_30_games_owners <- games_final %>% group_by(game) %>% summarise(owners = sum(owners)) %>% top_n(30)

platforms_owners <- games_final %>% group_by(platform) %>% summarise(owners = sum(owners))

owners_by_year <- games_final %>% group_by(year) %>% summarise(owners = sum(owners))

#Criando o grafico######################################################################
#Gráfico de dispersão entre metascore e userscore:
ggplot(games_final, aes(x=metascore.x, y=userscore))+
  geom_point()+
  geom_smooth(se = FALSE, method = "lm")+
  labs(x="Metascore", y = "Userscore")+
  ggtitle("Relação entre metascore e userscore")+
  theme(plot.title = element_text(hjust = 0.5))

ggsave("Graph1_MateusAmaral.jpg", path = "C:/Users/reicl/Downloads/FGV/EMAP/TrabalhoFinal_MateusAmaral/GraficosFinais")

#Gráfico dos 50 melhores jogos pela crítica:
ggplot(top_50_games, aes(reorder(game,metascore.x),metascore.x))+
  geom_lollipop()+
  coord_flip()+
  geom_text(aes(label = metascore.x), hjust = -1)+
  labs(x='', y = "Metascore")+
  ggtitle("Top 50 Jogos pela Crítica")+
  theme(plot.title = element_text(hjust = 0.4))

ggsave("Graph2_MateusAmaral.jpg", path = "C:/Users/reicl/Downloads/FGV/EMAP/TrabalhoFinal_MateusAmaral/GraficosFinais")

#Gráfico dos jogos mais baixados:
ggplot(top_30_games_owners, aes(reorder(game,owners),owners))+
  geom_lollipop(color = "#1b9e77")+
  coord_flip()+
  geom_text(aes(label = paste0(round(owners/1000000,digits = 1)," ","M"), hjust = -0.3),color = "#1b9e77")+
  labs(x='', y = "Downloads")+
  ggtitle("Top 30 Jogos com mais downloads")+
  theme_tufte()+
  theme(plot.title = element_text(hjust = 0.4),text = element_text(family = "Decima WE"))

ggsave("Graph3_MateusAmaral.jpg", path = "C:/Users/reicl/Downloads/FGV/EMAP/TrabalhoFinal_MateusAmaral/GraficosFinais")

#Gráfico das melhores plataformas:
ggplot(platforms_owners, aes(reorder(platform, owners),owners))+
  geom_bar(stat='identity', fill = "#1b9e77")+
  coord_flip()+
  geom_text(aes(label = paste0(round(owners/1000000,digits = 1)," ","M"), hjust = -0.3))+
  labs(x="Plataformas", y = "Downloads")+
  ggtitle("Downloads por Plataforma")+
  theme(plot.title = element_text(hjust = 0.5))

ggsave("Graph4_MateusAmaral.jpg", path = "C:/Users/reicl/Downloads/FGV/EMAP/TrabalhoFinal_MateusAmaral/GraficosFinais")

#Gráfico de quantidade de downloads por ano
ggplot(owners_by_year, aes(year,owners))+
  geom_bar(stat='identity', fill = "#1b9e77")+
  coord_flip()+
  geom_text(aes(label = paste0(round(owners/1000000,digits = 1)," ","M"), hjust = -0.3))+
  labs(x="Ano", y = "Downloads")+
  ggtitle("Downloads por Ano")+
  theme(plot.title = element_text(hjust = 0.5))

ggsave("Graph5_MateusAmaral.jpg", path = "C:/Users/reicl/Downloads/FGV/EMAP/TrabalhoFinal_MateusAmaral/GraficosFinais")

#Gráfico de densidade das notas:
density_metascore <- ggplot(games_final,aes(x=metascore.x))+
  geom_density(fill= "#1b9e77", color = "#e9ecef", alpha=0.8)+
  ggtitle("Gráfico de Densidade do Metascore")+
  labs(x="Metascore", y = "Densidade")+
  theme(plot.title = element_text(hjust = 0.5))+
  xlim(0,100)

density_userscore <- ggplot(games_final,aes(x=userscore))+
  geom_density(fill= "#7570b3", color = "#e9ecef", alpha=0.8)+
  ggtitle("Gráfico de Densidade do Userscore")+
  labs(x="Userscore", y = "Densidade")+
  theme(plot.title = element_text(hjust = 0.5))+
  xlim(0,10.0)

desinty_grouped <- rbind(ggplotGrob(density_metascore),
      ggplotGrob(density_userscore))

grid::grid.newpage()
grid::grid.draw(desinty_grouped)

ggsave("Graph6_MateusAmaral.jpg", path = "C:/Users/reicl/Downloads/FGV/EMAP/TrabalhoFinal_MateusAmaral/GraficosFinais")


#Gráfico final interativo:
plot_games <- ggplot(games_final, aes(x=metascore.x, y=userscore, label = game))+
  geom_jitter(aes(size=owners, color = platform, text = paste0("</br>", game,
                                                              "</br>Userscore: ", userscore,
                                                              "</br>Metascore: ", metascore.x,
                                                              "</br>Owners: ", format(owners,big.mark=",", scientific = FALSE))))+
  labs(x = "Metascore", y = "Userscore")+
  ggtitle("Gráfico de desempenho dos jogos")+
  guides(size=FALSE)+
  scale_color_manual(values = c("#8dd3c7","#ffffb3","#bebada","#fb8072","#80b1d3","#fdb462"))+
  theme(panel.background = element_rect(fill="#e2e2e2"))
plot_games

p <- ggplotly(plot_games, tooltip = "text") %>% layout(legend = list(x = 1.01, y = 0.97))
p


