#' 正解データと予測結果をグラフで表示
#'
#' @param DATA data.frame データ
#' @param MODEL 学習済みモデル
#'
#' @export
responsePredictGraph <- function(DATA, MODEL){
  response_sort <- DATA %>%
    arrange((response))

  # 予測
  if(class(MODEL) == "train"){
    df_pred_sort <- predict(MODEL, newdata = response_sort)
  } else if(class(MODEL) == "ranger"){
    df_pred_sort <- predict(MODEL, data = response_sort)["predictions"] %>%
      magrittr::extract2(1)
  }

  ggplot(response_sort) +
    geom_line(aes(x = 1:nrow(response_sort), y = df_pred_sort ,color = "b")) +
    geom_line(aes(x = 1:nrow(response_sort), y = response ,color = "a")) +
    xlab("index") + ylab("response") +
    scale_color_hue(name = "", labels = c("response","predict") ) +
    theme(axis.text.x = element_text(angle = 180, hjust =1)) +
    theme_bw(base_family = "HiraKakuProN-W3")
}
