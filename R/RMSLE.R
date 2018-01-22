#' RMSLE を利用した評価
#'
#' @param DATA data.frame 予測結果データ
#'
#' @return numeric 評価値
#'
#' @export
RMSLE <- function (DATA, lev = NULL, model = NULL)
{
  out <- sqrt(sum((log(DATA$obs) - log(DATA$pred))^2)/nrow(DATA))
  names(out) <- c("RMSLE")

  return(out)
}
