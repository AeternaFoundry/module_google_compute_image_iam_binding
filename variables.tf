variable "compute_image_iam_bindings" {
  description = <<EOT
Map of compute_image_iam_bindings, attributes below
Required:
    - image
    - members
    - role
Optional:
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    image   = string
    members = set(string)
    role    = string
    project = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

