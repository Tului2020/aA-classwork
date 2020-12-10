def duos(str)
    (1...str.length).count { |idx| str[idx] == str[idx - 1]}
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0



def sentence_swap(str, hsh)
    str.split(' ').map {|word| (hsh.include?(word))? (hsh[word]) : (word) }.join(' ')
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'



def hash_mapped(hsh, prc1, &prc2)
    result_hsh = {}
    hsh.each { |k, v| result_hsh[prc2.call(k)] = prc1.call(v)}
    result_hsh
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}



def counted_characters(str)
    hsh = Hash.new(0)
    str.each_char {|char| hsh[char] += 1}
    hsh.select {|k, v| v > 2 }.keys
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []



def triplet_true?(str)
    [*1...str.length].any? {|idx| str[idx] == str[idx - 1] && str[idx] == str[idx + 1]}

end

# p triplet_true?('caaabb')        # true
# p triplet_true?('terrrrrible')   # true
# p triplet_true?('runninggg')     # true
# p triplet_true?('bootcamp')      # false
# p triplet_true?('e')             # false



def energetic_encoding(str, hsh)
    new_str = ''
    hsh[' '] = ' '
    str.each_char {|char| (hsh.include?(char))? (new_str += hsh[char]):(new_str += '?')}
    new_str
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'



def uncompress(str)
    result_str = ''
    [*0...str.length / 2].each { |i| result_str += str[2 * i] * str[2 * i + 1].to_i }
    result_str
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'



def conjunct_select(arr, *prcs)
    result_arr = arr.dup
    prcs.each do |prc|
        temp_arr = []
        result_arr.each {|el| temp_arr << el if prc.call(el)}
        result_arr = temp_arr.dup
    end
    result_arr
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]



def convert_pig_latin(str)
    result_sentence = []
    vowels = "aeiouAEIOU"
    str.split(" ").each do |word|
        if word.length < 3
            result_sentence << word
        elsif vowels.include?(word[0])
            result_sentence << word += 'yay'
        else
            result_sentence << igpyay_atinlyay(word)
        end
        result_sentence[-1] = result_sentence[-1].downcase.capitalize if word == word.capitalize
    end
    result_sentence.join(" ")
end
def igpyay_atinlyay(word)
    vowels = "aeiouAEIOU"
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            return word[i..-1] + word[0...i] + 'ay'
        end
    end
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"



def reverberate(str)
    result_sentence = []
    vowels = "aeiouAEIOU"
    str.split(" ").each do |word|
        if word.length < 3
            result_sentence << word
        elsif vowels.include?(word[-1])
            result_sentence << word += word.downcase
        else
            result_sentence << reverberate_non_vowel(word)
        end
    end
    result_sentence.join(" ")
end
def reverberate_non_vowel(word)
    vowels = "aeiouAEIOU"
    arr = []
    word.each_char.with_index {|char, idx| arr << idx if vowels.include?(char)  }
    word += word[arr[-1]..word.length]
end

# p reverberate('We like to go running fast') == "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') == "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') == "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') == "Herer familyily flewew to Francefrance"



def disjunct_select(arr, *prcs)
    arr.select do |el|
        prcs.any? { |prc| prc.call(el)}
    end
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }
# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) == ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) == ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) == ["ace", "dog", "apple", "teeming", "boot"]



def alternating_vowel(str)
    words = []
    str.split(' ').each_with_index {|word, idx| (idx.even?)? (words << remove_vowel(word, 0)):(words << remove_vowel(word, -1))}
    words.join(' ')
end
def remove_vowel(word, vowel_to_be_removed)
    arr = []
    vowels = 'aeiou'
    chars = word.split('')
    chars.each_with_index {|char, idx| arr << idx if vowels.include?(char)}
    chars.delete_at(arr[vowel_to_be_removed]) if arr.length > 0
    chars.join('')
end

# p alternating_vowel('panthers are great animals') == "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') == "rnning panthrs re epc"
# p alternating_vowel('code properly please') ==  "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') == "my forecst prdicts ran tday"


def silly_talk(str)
    new_str = []
    vowels = 'aeiouAEIOU'
    str.split(' ').each { |word| (vowels.include?(word[-1]))? (new_str << silly_talk_vowel(word)) : (new_str << silly_talk_consonant(word))}
    new_str.join(' ')
end

def silly_talk_vowel(word)
    word + word[-1]
end

def silly_talk_consonant(word)
    vowels = 'aeiouAEIOU'
    result = ''
    word.each_char { |char| (vowels.include?(char))? (result += char + 'b' + char.downcase) : (result += char) }
    result
end

# p silly_talk_consonant('can')
# p silly_talk_vowel('code')



# p silly_talk('Kids like cats and dogs') == "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') == "Stobop thabat scobooboteber"
# p silly_talk('They can code') == "Thebey caban codee"
# p silly_talk('He flew to Italy') == "Hee flebew too Ibitabaly"



def compress(str)
    ret = ""
    str.each_char { |char| (ret[-2] == char)? (ret[-1] = (ret[-1].to_i + 1).to_s) : (ret << char + "1")}
    ret.delete("1")
end


# p compress('aabbbbc')   == "a2b4c"
# p compress('boot')      == "bo2t"
# p compress('xxxyxxzzzz')== "x3yx2z4"




