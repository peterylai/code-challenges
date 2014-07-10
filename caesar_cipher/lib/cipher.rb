class Cipher

  def self.encode(plaintext)
    rotated_alphabet = Hash[('a'..'z').zip(('a'..'z').to_a.rotate(13))]
    encoded = plaintext.chars.map { |char| rotated_alphabet[char] }
    encoded.join
  end

end