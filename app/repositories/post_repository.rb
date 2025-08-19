require 'rom-repository'

class PostRepository < ROM::Repository[:posts]
    def all
        posts.to_a
    end
end