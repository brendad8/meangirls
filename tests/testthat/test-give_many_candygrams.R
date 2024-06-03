test_that("test giving candy grams to many people with no extra commentary", {

  students <- c("Taylor Zimmerman", "Glen Coco", "Cady Heron", "Gretchen Weiners")
  counts <- c(2, 4, 1, 1)

  correct_result <- c("Two for Taylor Zimmerman.",
                      "Four for Glen Coco. You go, Glen Coco!",
                      "One for Cady Heron.",
                      "None for Gretchen Weiners.")

  my_result <- give_many_candygrams(students, counts)

  expect_equal(my_result, correct_result)
})


test_that("test giving candy grams to many people with extra commentary", {

  students <- c("Taylor Zimmerman", "Glen Coco", "Cady Heron", "Gretchen Weiners")
  counts <- c(2, 4, 1, 1)
  extra_commentary <- c("", "What a stud!", "Here you go!", "Eww!")

  correct_result <- c("Two for Taylor Zimmerman.",
                      "Four for Glen Coco. What a stud! You go, Glen Coco!",
                      "One for Cady Heron. Here you go!",
                      "None for Gretchen Weiners.") # Gretchen should get no extra commentary

  my_result <- give_many_candygrams(students, counts, extra_commentary)

  expect_equal(my_result, correct_result)
})

