#' 相関が強い列名を取得
#'
#' @param DATA data.frame 学習用データ
#' @param CUTOFF numeric ( default 0.75 )
#'
#' @return vector 相関が強い列名一覧
#'
#' @export
getHightlyCorDescr <- function(DATA, CUTOFF = 0.75){
  # 相関が強い列名を検索
  DATA.response <- subset(DATA, select = c(response))
  DATA.Descr <- subset(DATA, select = -c(response))

  descCor <- cor(DATA.Descr)
  highlyCorDescr <- caret::findCorrelation(descCor, cutoff = CUTOFF)

  return(names(DATA)[highlyCorDescr])
}
