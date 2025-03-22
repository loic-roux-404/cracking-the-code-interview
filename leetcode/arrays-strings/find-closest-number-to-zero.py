class Solution(object):
    """
    https://leetcode.com/problems/find-closest-number-to-zero/description/
    """
    def findClosestNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        last_distance = nums[0] if nums[0] > 0 else -nums[0]
        last_distance_index = 0
        for i, n in enumerate(nums[1:len(nums)]):
            distance = n
            if n < 0:
                distance = -n

            if distance < last_distance:
                last_distance = distance
                last_distance_index = i + 1
            
            if distance == last_distance:
                if distance > nums[last_distance_index]:
                    last_distance_index = i + 1

        return nums[last_distance_index]

        