# telegram_bot gem
[![Build Status](https://travis-ci.org/odarriba/telegram_bot_gem.svg)](https://travis-ci.org/odarriba/telegram_bot_gem)

The aim of this gem is to provide a useful wrapper of Telegram's Bot API that makes use of Webhooks functionality.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'telegram_bot'
```

And then execute:
```
$ bundle
```

Or install it yourself as:
```
$ gem install telegram_bot
```

## Configuration

Gem configuration can be initialized by running a custom generator:

```
$ rails g telegram_bot:install
```

Then, you can change the configuration by editing the file located at `config/initializers/telegram_bot.rb`

At least, you should include:
* Your bot's token
* Your web hook callback URL (in which you'll receive the updates sent to your bot).

**Important:** your webhook we'll be registered only if the `delivery_method` is set to `:delivery_method`.

## Usage

This gem provides models to access easily to API updates, and to create responses and requests to send messages and attachments to Telegram.

### Models

Used to parse received data from Telegram.

Available models are:
* TelegramBot::Model::Chat
* TelegramBot::Model::Message
* TelegramBot::Model::Update
* TelegramBot::Model::User
* TelegramBot::Model::Attachment::Audio
* TelegramBot::Model::Attachment::Contact
* TelegramBot::Model::Attachment::Document
* TelegramBot::Model::Attachment::Location
* TelegramBot::Model::Attachment::PhotoSize
* TelegramBot::Model::Attachment::Sticker
* TelegramBot::Model::Attachment::Video
* TelegramBot::Model::Attachment::Voice

If you want to know the variables available in each one, you can check the [official docs](https://core.telegram.org/bots/api#available-types).

And they can be instantiated like any other model. You will commonly receive an `Update` object:

```ruby
received_hash = JSON.parse(request.body.read)
received_update = TelegramBot::Model::Update.new(received_hash)
```

Associated models (like the `Message` included inside the `Update`) will be automatically converted when instantiating the `Update` object.

### Requests

Request are objects that can receive (and validate) the parameters that can be sent in a request to the API.

The available requests are:
* TelegramBot::Request::ForwardMessage
* TelegramBot::Request::GetMe
* TelegramBot::Request::SendAudio
* TelegramBot::Request::SendChatAction
* TelegramBot::Request::SendDocument
* TelegramBot::Request::SendLocation
* TelegramBot::Request::SendMessage
* TelegramBot::Request::SendPhoto
* TelegramBot::Request::SendSticker
* TelegramBot::Request::SendVideo
* TelegramBot::Request::SendVoice
* TelegramBot::Request::SetWebhook

If you want to know the variables available in each one, you can check the [official docs](https://core.telegram.org/bots/api#available-methods).

#### Sending a request

There are two ways of sending a request:

* All of them can be send asynchronously to the API using the `#send_request` method available in all request classes:

```ruby
req = TelegramBot::Request::GetMe.new()
response = req.send_request
```

  *Note:* if the API returns an error, a `Faraday::Error` exception will be raised

* Synchronously as the response to the updates reception in the webhook callback URL. For example:

```ruby
def receive
  received = TelegramBot::Model::Update.new(JSON.parse(request.body.read))

  response = TelegramBot::Request::SendMessage.new({
    chat_id: received.message.chat.id,
    text: "Okay! I've got it!",
    reply_to_message_id: received.message.message_id
  })

  render json: response
end
```

## Unit testing

Several tests have been implemented to verify that model an requests behave as expected.

So please, if you want to contribute to this gem, check that tests are maintained and all of them pass.

## To-Do

There are several thing to do on this project:
* Receiving updates by polling.
* Getting user profile photos from the API.
* Create models of custom keyboard responses (actually they can be hardcoded as a Hash object, [check the documentation](https://core.telegram.org/bots/api#replykeyboardmarkup)).
* Inline queries.

If you want to check out the gem's source code and want to contribute, you are welcome!

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/odarriba/telegram_bot_gem](https://github.com/odarriba/telegram_bot_gem). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

Everyone's contributions are welcome, so if you want to contribute, just fork this repo, make the changes you want and create a descriptive pull request :)


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT) as can be seen in LICENSE file.
