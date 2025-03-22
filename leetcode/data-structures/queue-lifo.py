class MyStack(object):
    """
    https://leetcode.com/problems/implement-stack-using-queues/?envType=problem-list-v2&envId=queue
    """

    def __init__(self):
        self.queue = []

    def push(self, x):
        """
        :type x: int
        :rtype: None
        """
        self.queue += [x]

    def pop(self):
        """
        :rtype: int
        """
        index = len(self.queue) - 1
        val = self.queue[index]
        self.queue = self.queue[:index]
        return val

    def top(self):
        """
        :rtype: int
        """
        index = len(self.queue) - 1
        val = self.queue[index]
        return val

    def empty(self):
        """
        :rtype: bool
        """
        return len(self.queue) == 0
        


# Your MyStack object will be instantiated and called as such:
# obj = MyStack()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.empty()