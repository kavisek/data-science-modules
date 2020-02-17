# Write a function to find the longest common prefix string amongst an array of strings.
#
# If there is no common prefix, return an empty string "".


class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        phrase = ''
        if (len(strs) > 1) & len(strs[0]=1:

        elif len(strs) > 1:
            # print('Long List')
            first_word=strs[0]
            phrase=first_word
            for i in range(len(first_word)-1):
                for j in range(len(first_word)-1):
                    # print(f'Testing {first_word[i:j+1]}')
                    result=[True if first_word[i:j+1] in word else False for word in strs]
                    if all(result):
                        if len(first_word[i:j+1]) > len(phrase):
                            phrase=first_word[i:j+1]
            return phrase
        elif len(strs) == 0:
            return phrase
        else:
            return strs[0]
