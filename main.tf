resource "google_compute_image_iam_binding" "compute_image_iam_bindings" {
  for_each = var.compute_image_iam_bindings

  image   = each.value.image
  members = each.value.members
  role    = each.value.role
  project = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

