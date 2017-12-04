#'
#' 学習用データを訓練データと検証データに分割
#'
#' @param DATA data.frame 学習用データ
#' @param PERCENTAGE numeric 訓練用データの割合 ( default 0.8 )
#'
#' @return list(訓練データ, 検証データ)
#'
#' @export
dataPartition <- function(DATA, PERCENTAGE = 0.8){
  # 再現性のため乱数シードを固定
  set.seed(10)

  # 訓練データと検証データに分割する
  # Train 用の列番号を作成
  trainIndex <- caret::createDataPartition(DATA$response
                                           ,p = PERCENTAGE
                                           ,list = FALSE
                                           ,times = 1
                                          )
  train.train <- DATA[trainIndex,]
  train.test  <- DATA[-trainIndex,]

  return(list(train.train, train.test))
}
