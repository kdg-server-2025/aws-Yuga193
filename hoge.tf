resource "aws_sns_topic" "budget_alert" {
  name = "budget-alert-topic"
}

resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.budget_alert.arn
  protocol  = "email"
  endpoint  = "yuga.nakamoto1211@gmail.com"
}

resource "aws_budgets_budget" "kdg_all" {
  name              = "account-budget-5usd"
  budget_type       = "COST"
  limit_amount      = "5"
  limit_unit        = "USD"
  time_unit         = "MONTHLY"
  time_period_start = "2023-01-01_00:00"

  notification {
    comparison_operator         = "GREATER_THAN"
    threshold                   = 100
    threshold_type              = "PERCENTAGE"
    notification_type           = "ACTUAL"
    subscriber_sns_topic_arns  = [aws_sns_topic.budget_alert.arn]
  }
}
