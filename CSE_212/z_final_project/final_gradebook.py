# # Create a grade book where you get to revmove your lowest

class Node:
    def __init__(self, data=None):
        self.data = data
        self.next = None

class LinkedList:
    def __init__(self):
        self.head = None

    def insert(self, data):
        new_node = Node(data)
        if self.head is None:
            self.head = new_node
        else:
            current = self.head
            while current.next:
                current = current.next
            current.next = new_node

    def display(self):
        current = self.head
        while current:
            print(current.data, end=" ")
            current = current.next
        print()

def remove_lowest_replace_highest(llist):
    if llist.head is None:
        return

    lowest = float('inf')
    highest = float('-inf')
    current = llist.head
    prev = None
    lowest_prev = None

    while current:
        if current.data < lowest:
            lowest = current.data
            lowest_prev = prev
        if current.data > highest:
            highest = current.data
        prev = current
        current = current.next

    if lowest == highest:
        return

    if lowest_prev is None:
        llist.head.data = highest
    else:
        lowest_prev.next.data = highest

def create_student_grades_dict(num_students, num_grades):
    students_dict = {}

    for i in range(num_students):
        llist = LinkedList()
        print(f"Enter grades for student {i+1}:")
        for j in range(num_grades):
            grade = float(input(f"Grade {j+1}: "))
            llist.insert(grade)
        remove_lowest_replace_highest(llist)
        students_dict[f"Student {i+1}"] = llist

    return students_dict

def display_and_calculate_average(student, llist):
    print(student)
    grades = []
    current = llist.head
    while current:
        grades.append(current.data)
        current = current.next

    grades.sort()
    print("Grades:", ", ".join(str(grade) for grade in grades))
    average = sum(grades) / len(grades)
    print("Average:", round(average, 2))
    print()

# Test 1

# Create the number of stuents
num_students = 1
# Create the number of grades(test every two weeks)
num_grades = 7

students_dict = create_student_grades_dict(num_students, num_grades)

# Display the student grades and calculate average
for student, llist in students_dict.items():
    display_and_calculate_average(student, llist)
