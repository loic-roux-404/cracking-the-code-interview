class Solution(object):
    def mergeAlternately(self, word1, word2):
        """
        :type word1: str
        :type word2: str
        :rtype: str
        """
        biggest_word = word2 if len(word2) > len(word1) else word1
        res = []
        for i in range(0, len(biggest_word)):
            if i <= len(word1) - 1:
                res.append(word1[i])
            if i <= len(word2) - 1:
                res.append(word2[i])

        return ''.join(res)

            

