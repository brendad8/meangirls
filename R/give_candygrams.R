#' Announces the number of candygrams for a person.
#'
#' @param person The candygram recipient
#' @param number How many grams they got
#' @param extra_message A string giving extra commentary.
#'
#' @return A candy gram announcement
#'
#' @importFrom stringr str_detect str_to_title
#' @importFrom english as.english
#' @importFrom dplyr if_else
#'
#' @export
give_candygrams <- function(person, number,
                            extra_message = NULL) {

  stopifnot(number > 0)

  extra_message <- if_else(is.null(extra_message),
                           add_commentary(person, number),
                           glue::glue("{extra_message} {add_commentary(person, number)}")
  )

  message <- if_else(str_detect(person, "Gretchen"), "None for Gretchen Weiners.", "")


  number <- str_to_title(as.english(number))


  stringr::str_replace(stringr::str_trim(glue::glue("{number} for {person}.") + " " + extra_message), "  ", " ")



}

#' Tacks commentary on to candygram announcement
#'
#' @param person The candygram recipient
#' @param number How many grams they got
#'
#' @return A string (possibly blank)
add_commentary <- function(person, number) {

  case_when(
    stringr::str_detect(person, "Aaron") ~"They are from Regina.",
    number > 3 ~ glue::glue("You go, {person}!"),
    TRUE ~ ""
    )


}
