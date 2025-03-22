class MyQueue(object):
    """
    https://leetcode.com/problems/implement-queue-using-stacks/?envType=problem-list-v2&envId=queue
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
        val = self.queue[0]
        self.queue = self.queue[1:len(self.queue)]
        return val
        

    def peek(self):
        """
        :rtype: int
        """
        return self.queue[0]
        

    def empty(self):
        """
        :rtype: bool
        """
        return len(self.queue) == 0

        


# Your MyQueue object will be instantiated and called as such:
obj = MyQueue()
obj.push(1)
obj.push(2)
param_1 = obj.peek()
param_2 = obj.pop()
param_3 = obj.empty()
assert param_1 == 1
assert param_2 == 1
assert param_3 == False

print("Tests passed")