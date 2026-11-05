#' calculate change and percent change from baseline
#' @description
#' `calc_pchg` adds change from baseline (`CHG`) and percent change from baseline (`PCHG`)
#'
#' @details
#' change is aval-base and percent change is calculated as (aval-base)/base*100
#'
#'
#' @param data a data frame
#' @param aval <[`data-masking`][rlang::args_data_masking]>  analysis variable, Default `AVAL`
#' @param base <[`data-masking`][rlang::args_data_masking]>  base variable, Default `BASE`
#'
#' @return
#' data with two new columns added
#'
#' @author jagadish
#'
#' @import dplyr magrittr
#' @export
#' @examples
#' calc_pchg(adlb_demo)
#'
#' @example inst/example.R
#'
calc_pchg <- function(data, aval=AVAL, base=BASE){
  # this is to derive variables
  data %>% dplyr::mutate(
    CHG={{ aval }} - {{ base }},
    PCHG = dplyr::if_else(
      {{base}} == 0 , NA, 100* ({{aval}} - {{base}})/{{base}})
    )
}
