#' 文字列データをfactorに変換
#'
#' @param data.frame データフレーム
#'
#' @return data.frame 文字列の列が factor 化されたデータ
#'
#' @export
changeFactor <- function(DATA){
  result <- mutate_if(DATA,is.character, funs(factor))

  return(result)
}
