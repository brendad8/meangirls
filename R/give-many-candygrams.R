#' Announces the number of candygrams for many people
#'
#' @param persons The candygram recipients
#' @param grams How many grams each person got
#' @param extra_messages A vector of strings giving extra messages.
#'
#' @return A vector of candy gram announcements
#'
#' @importFrom purrr pmap
#'
#' @exports
give_many_candygrams <- function(person, grams,
                                extra_messages = NULL) {

  if (is.null(extra_messages)) {
    extra_messages <- rep("", length(person)) # extra messages of NULL must be specified as "" (empty string)
  }

  as.character(purrr::pmap(list(person, grams, extra_messages), .f = give_candygrams))

}


