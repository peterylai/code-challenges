class Cipher

  def self.encode(plaintext)
    alphabet = ("a".."z").to_a
    encoded = plaintext.chars.map { |char| alphabet.reverse[alphabet.index(char)] }
    encoded.join
  end

end