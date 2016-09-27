require 'sinatra'

set :bind, '0.0.0.0'  # bind to all interfaces

def posts
  [
    {
      user: {
        name: "Adam Sheehan",
        avatar_url: "http://placekitten.com/g/50/50"
      },
      content: "Want to me to diagram that for you?",
      liked: false,
      comments: [
        {
          user: {
            name: "Everyone Everywhere",
            avatar_url: "http://placekitten.com/g/50/50"
          },
          content: "Yes!"
        }
      ]
    },
    {
      user: {
        name: "Eric Kelly",
        avatar_url: "http://placekitten.com/g/50/50"
      },
      content: "Everyone, please set up the preferences in Apollo for Sublime.",
      liked: true,
      comments: [
        {
          user: {
            name: "Helen Hood",
            avatar_url: "http://placekitten.com/g/50/50"
          },
          content: "Cats are awesome! Especially Mr. G."
        },
        {
          user: {
            name: "Sam McTaggart",
            avatar_url: "http://placekitten.com/g/50/50"
          },
          content: "I don't like cats."
        }
      ]
    },
    {
      user: {
        name: "Helen Hood",
        avatar_url: "http://placekitten.com/g/50/50"
      },
      content: "One day I will steal Mr. G!",
      liked: false,
      comments: [
        {
          user: {
            name: "Eric Kelly",
            avatar_url: "http://placekitten.com/g/50/50"
          },
          content: "NEVARRRR!"
        },
        {
          user: {
            name: "Mr. G.",
            avatar_url: "http://placekitten.com/g/50/50"
          },
          content: "I am fierce and unstealable."
        }
      ]
    },
    {
      user: {
        name: "Sam McTaggart",
        avatar_url: "http://placekitten.com/g/50/50"
      },
      content: "Objective C is incredible.",
      liked: false,
      comments: [
        {
          user: {
            name: "Faizaan Shamsi",
            avatar_url: "http://placekitten.com/g/50/50"
          },
          content: "Have you seen Ruby Motion?"
        }
      ]
    }
  ]
end

get '/' do
  @posts = posts
  erb :index
end
