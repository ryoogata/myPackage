#' 情報量が少ない ( 分散がほぼ 0 ) 列名を取得
#'
#' @param DATA data.frame 学習用データ
#'
#' @return vector 情報量が少ない ( 分散がほぼ 0 ) 列名一覧
#'
#' @export
getNearZeroVar <- function(DATA){
  # 目的変数と説明変数を分割
  DATA.response <- subset(DATA, select = c(response))
  DATA.Descr <- subset(DATA, select = -c(response))

  # 情報量が少ない ( 分散がほぼ 0 ) の列番号を取得
  nzv <- caret::nearZeroVar(DATA.Descr)

  return(names(DATA)[nzv])
}
