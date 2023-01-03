resource "aws_guardduty_detector" "not_ok" {
  enable = true
}

resource "aws_guardduty_detector" "not_ok_false" {
  enable = true
}

resource "aws_guardduty_organization_configuration" "example_2" {
  auto_enable = false
  detector_id = aws_guardduty_detector.not_ok_false.id
}