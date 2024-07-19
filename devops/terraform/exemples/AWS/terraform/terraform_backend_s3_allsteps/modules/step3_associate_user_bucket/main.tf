
data "aws_iam_policy_document" "s3_bucket_object_crud" {
  statement {
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [var.aws_bucket_arn]
  }

  statement {
    effect    = "Allow"
    actions   = ["s3:GetObject", "s3:PutObject"]
    resources = ["${var.aws_bucket_arn}/${var.key_path}"]
  }

  statement {
    effect    = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:GenerateDataKey"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "terraform" {
  name = "terraform_policy"
  policy = data.aws_iam_policy_document.s3_bucket_object_crud.json
  user   = var.aws_username
}

