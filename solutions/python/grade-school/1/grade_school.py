class Student:
    def __init__(self, name: str, grade: int) -> None:
        self.name = name
        self.grade = grade
        self.is_added = True

    def __eq__(self, other: 'Student') -> bool:
        return self.name == other.name


class School:
    def __init__(self):
        self.students: list[Student] = []

    def add_student(self, name: str, grade: int) -> None:
        new_student = Student(name, grade)
        if new_student in self.students:
            new_student.is_added = False

        self.students.append(new_student)

    def roster(self):
        return [student.name for student in self.sorted_students if student.is_added]

    def grade(self, grade_number: int):
        return [student.name for student in self.sorted_students if student.grade == grade_number and student.is_added]

    def added(self):
        return [student.is_added for student in self.students]

    @property
    def sorted_students(self) -> list[Student]:
        return sorted(self.students, key=lambda student: (student.grade, student.name))
