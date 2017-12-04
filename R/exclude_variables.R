#' ダミー化された data.frame の特定の文字列を含む不要な列名を排除
#'
#' @param DATA data.frame 学習用データ
#' @param VECTOR vector 削除したい文字列
#'
#' @return vector 抽出された文字列
#'
#' @export
exclude_variables <- function(DATA, VECTOR){
  id <- NULL
  for(i in VECTOR){
    id <- c(id, grep(i, names(DATA)))
  }

  return(names(DATA[, -id]))
}
