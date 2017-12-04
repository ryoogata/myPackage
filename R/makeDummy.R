#' 説明変数をダミー変数化
#'
#' @param DATA data.frame 学習用データ
#'
#' @return data.frame ダミー変数化されたデータ
#'
#' @export
makeDummy <- function(DATA){
  # 目的変数と説明変数を分割
  DATA.response <- subset(DATA, select = c(response))
  DATA.Descr <- subset(DATA, select = -c(response))

  # 説明変数を dummy 変数化
  # factor の level が 1 だとエラーになるので注意
  noNames <- caret::dummyVars(~., data = DATA.Descr)
  filterdDescr <- as.data.frame(predict(noNames, DATA.Descr))

  # 目的変数と説明変数を結合
  DATA.dummy <- dplyr::bind_cols(filterdDescr,DATA.response)

  return(DATA.dummy)
}
