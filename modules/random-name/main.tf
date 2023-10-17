locals {
    result = random_string.randomname.result
}

resource "random_string" "randomname" {
    length = 6
    special = false
    upper = false
    numeric = false
}