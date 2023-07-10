def check_braces(line):

    stack = []
    for item in line: # Look at each character in the line of code received
        if item == '(' or item == '[' or item == '{': # Check for open braces
            stack.append(item)
        elif item == ')': # Check for close braces
            if len(stack) == 0 or stack.pop() != '(':
                return False
        elif item == ']':
            if len(stack) == 0 or stack.pop() != '[':
                return False
        elif item == '}':
            if len(stack) == 0 or stack.pop() != '{':
                return False
        # If there were any open braces not yet closed then we have an error.
        return len(stack) == 0