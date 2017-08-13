require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  test 'valid Quote' do
    quote = Quote.new(quote: "Hire me!", source: "Patrick Loeve")
    assert quote.valid?
  end

  test 'invalid without Quote' do
    quote = Quote.new(source: "Patrick Loeve")
    refute quote.valid?
    assert_not_nil quote.errors[:quote]
  end

  test 'invalid without Source' do
    quote = Quote.new(quote: "Hire me")
    refute quote.valid?
    assert_not_nil quote.errors[:source]
  end
end
