module SubscriptionsHelper
  def braintree_env
    Rails.env.production? ? 'production' : 'sandbox'
  end

  def payment_method_details(object)
    if object.paypal?
      "#{object.card_type} #{object.card_last4}"
    else
      "#{object.card_type} ending in #{object.card_last4}"
    end
  end
end
