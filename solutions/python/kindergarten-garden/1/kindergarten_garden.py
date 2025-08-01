STUDENTS = [
    "Alice", "Bob", "Charlie", "David",
    "Eve", "Fred", "Ginny", "Harriet",
    "Ileana", "Joseph", "Kincaid", "Larry"

]

PLANTS = {
    'V': 'Violets',
    'R': 'Radishes',
    'C': 'Clover',
    'G': 'Grass'
}


class Garden:
    def __init__(self, diagram: str, students: list[str] = []):
        row_one, row_two = diagram.split('\n')
        self.students = sorted(students) or STUDENTS
        self.grouped_diagrams = [row_one[i:i+2] + row_two[i:i+2]
                                 for i in range(0, len(row_one), 2)]

    def plants(self, student: str):
        return [PLANTS[plant] for plant in self.grouped_diagrams[self.students.index(student)]]
