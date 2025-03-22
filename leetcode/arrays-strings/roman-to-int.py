class Solution(object):
    """
    https://leetcode.com/problems/roman-to-integer/
    """
    mapping = {
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    }

    def romanToInt(self, s):
        """
        :type s: str
        :rtype: int
        """
        res = 0
        for i in range(0, len(s)):
            l = s[i]
            curr = self.mapping[l]
            next_l = self.mapping[s[i + 1]] if i < len(s) - 1 else None

            if next_l is not None and next_l > curr:
                continue

            res += curr
            prev_l = self.mapping[s[i - 1]] if i > 0 else None

            if prev_l is not None and prev_l < curr:
                res -= prev_l
                continue

        return res
