Agent Cooper
======

[![travis](https://secure.travis-ci.org/rclosner/agent_cooper.png)](http://travis-ci.org/rclosner/agent_cooper)


<img src="https://github.com/rclosner/agent_cooper/raw/master/agent_cooper.jpg" width="200px">


Agent Cooper is a minimalist, Nokogiri-based Ruby wrapper to the [eBay Web Services API](http://developer.ebay.com/).


It supports the following eBay APIs:
  - [Finding API](http://developer.ebay.com/products/finding/)
  - [Shopping API](http://developer.ebay.com/products/shopping/)
  - [Merchandising API](http://developer.ebay.com/products/merchandising/)

Usage
-----
Set up.

```ruby
    AgentCooper.configure do |config|
      config.app_id = "YOUR_EBAY_APP_ID"
    end
```

Initialize a request

```ruby
    request = AgentCooper::Finder.new
    request = AgentCooper::Shopper.new
    request = AgentCooper::Merchandiser.new
```
Build request params.

```ruby
    request << {
      'OPERATION-NAME' => 'getSearchKeywordsRecommendation',
      'KEYWORDS'       => 'arry potter'
    }
```

Get a response.

```ruby
    response = request.get
```

Return a hash:

```ruby
    response.to_hash

    returns: {'getSearchKeywordsRecommendationResponse' => {'xmnls' => 'http://www.ebay.com/marketplace/search/v1/services', 'ack' => 'Success', 'version' => '1.9.0', 'keywords' => 'harry potter'}}
```

If you need to preserve XML attributes

```ruby
    response.to_hash(:preserve_attributes => true)

    returns: {'CurrentPrice' => {'__content__' => '154.99', 'CurrencyID' => 'EUR' }}
```

Or parse a response with Nokogiri:

```ruby
    response.xml.css("Item > Title").each do |title|
      some business value
    end

    response.xml.xpath("//Item")
```
