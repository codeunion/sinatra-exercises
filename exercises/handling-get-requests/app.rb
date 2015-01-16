require 'sinatra'
require 'uri'

QUOTES=[{ :author => "E. W. Dijkstra", :quote => "The computing scientist’s
          main challenge is not to get confused by the complexities of his own
          making." },

        { :author => "Ken Thompson", :quote => "One of my most productive days
          was throwing away 1000 lines of code." },

        { :author => "Brian W. Kerinighan and P. J. Plauger", :quote => "
          Debugging is twice as hard as writing the code in the first place.
          Therefore, if you write the code as cleverly as possible, you are, by
          definition, not smart enough to debug it." },

        { :author => "Alan Turing", :quote => "A man provided with paper,
          pencil, and rubber, and subject to strict discipline, is in effect a
          universal machine." },

        { :author => "John Carmack", :quote => "If you’re willing to restrict
          the flexibility of your approach, you can almost always do something
          better." },

        { :author => "Grace Hopper", :quote => "To me programming is more than
          an important practical art. It is also a gigantic undertaking in the
          foundations of knowledge." },

        { :author => "Pablo Picasso", :quote => "Computers are useless.  They
          can only give you answers." },

        { :author => "Ada Lovelace", :quote => "I never am really satisfied
          that I understand anything; because, understand it well as I may, my
          comprehension can only be an infinitesimal fraction of all I want to
          understand about the many connections and relations which occur to
          me, how the matter in question was first thought of or arrived at,
          etc., etc." },

        { :author => "Ada Lovelace", :quote => "The Analytical Engine has no
          pretensions whatever to originate anything. It can do whatever we
          know how to order it to perform. It can follow analysis, but it has
          no power of anticipating any analytical revelations or truths. Its
          province is to assist us in making available what we are already
          acquainted with." },
        { :author => "Zee Spencer", :quote => "I have no idea what I'm doing..." }]

##
# Case insensitive search. Returns an array of quotes. Allows `terms` to be URI
# Encoded.
#   See: http://ruby-doc.org/stdlib-2.1.2/libdoc/uri/rdoc/URI/Escape.html#method-i-unescape
# Examples:
#   search("Analytical%20Engine") # => [ { :quote => "The Analytical Engine...", ... }, ...]
#   search("Programming") # => [ {:quote => "To me programming...", ... }, ...]

def search(terms)
  QUOTES.select do |quote|
    quote[:quote].downcase.include?(URI.unescape(terms.downcase))
  end
end

##
# Converts an author string into a comparable offer string. Supports URI
# Escaped author names.
#
# Examples:
#  comparable_author("Zee Spencer") # => "zee-spencer"
#  comparable_author("Ada Lovelace") # => "ada-lovelace"
#  comparable_author("E.%20W.%20Dijkstra") # => "e-w-dijkstra"

def comparable_author(author)
  decoded_author = URI.unescape(author)
  case_insensitive_author = decoded_author
  author_with_spaces_replaced = author.gsub(" ", "-")
  author_with_non_alpha_chars_stripped = author.gsub(/[^a-z-]/, "")

  author_with_non_alpha_chars_stripped
end


##
# Searches quotes by author. Returns an array of quotes. Converts `author` to be
# lowercase letters and dashes.
#
# Examples:
#   * quotes_by("ada-lovelace") # => [ ... ]
#   * quotes_by("e-w-dijkstra") # => [ ... ]

def quotes_by(author)
  QUOTES.select do |quote|
    comparable_author(quotes[:author]) == comparable_author(author)
  end
end

get "/" do
  @quotes = []
  erb :home
end
