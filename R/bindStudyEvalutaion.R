#' 学習用/評価用データの結合
#'
#' @param STUDY data.frame 学習用データ
#' @param EVALUATION data.frame 評価用データ
#'
#' @return data.frame 結合されたデータ
#'
#' @export
bindStudyEvalutaion <- function(STUDY, EVALUATION){
  STUDY$bindStudyEvalutaion <- "study"
  EVALUATION$bindStudyEvalutaion <- "evaluation"

  all <- dplyr::bind_rows(STUDY, EVALUATION)

  return(all)
}
