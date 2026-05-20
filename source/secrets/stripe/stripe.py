import stripe

def noncompliant():
 charge = stripe.Charge.retrieve(
  "ch_3LopUh2eZvKYlo2C1u1V6SvY",
  api_key="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"
 )

def compliant():
 charge = stripe.Charge.retrieve(
  "ch_3LopUh2eZvKYlo2C1u1V6SvY",
  api_key="sk_test_56JDkFAbpu7mtY1yXLT1BrkFE3O688ZyoAInby8uL9JntaSl1pkAIyVCyZXJYsBmZtr8xOKAVxn24NP68gNsnmzjAhIo0rj0YVp"
 )
