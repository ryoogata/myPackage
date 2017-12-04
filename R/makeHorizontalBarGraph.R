#' 指定した列名の横棒グラフを作成
#'
#' @param DATA data.frame データ
#' @param ROWNAME character 列名
#'
#' @export
makeHorizontalBarGraph <- function(DATA, ROWNAME){
 row <- DATA %>% 
   select_(ROWNAME) %>% 
   group_by_(ROWNAME) %>% 
   tally() %>% 
   arrange((n)) %>%
   mutate_at(vars(ROWNAME), as.character) %>% 
   data.frame

   LEVELS  <- unique(select_(row, ROWNAME)) %>% extract2(1)
   row <- mutate_at(row, vars(ROWNAME), factor, levels = LEVELS)
 
  ggplot(row, aes_(as.name(ROWNAME),as.name("n"))) +
    geom_bar(stat="identity") +
    ggtitle(ROWNAME) + xlab("") + ylab("") + 
    theme(axis.text.x = element_text(angle = 180, hjust =1)) +
    theme_bw(base_family = "HiraKakuProN-W3") +
    coord_flip() +
    scale_y_continuous(labels = scales::comma)  
}

