output "sum-and-product" {
  value = local.sum
}

output "twice" {
  value = [for i in var.lis-num : i*2]
}

output "num-odd" {
  value = [for i in var.lis-num : i if i % 2 != 0]
}

output "person-fname" {
  value = [for p in var.lis-obj : p.fname]
}