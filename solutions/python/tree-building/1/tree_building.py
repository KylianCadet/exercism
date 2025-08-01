class Record:
    def __init__(self, record_id, parent_id):
        self.record_id = record_id
        self.parent_id = parent_id


class Node:
    def __init__(self, node_id):
        self.node_id = node_id
        self._children = []

    @property
    def children(self):
        return self._children

    @children.setter
    def children(self, value):
        self._children = value


def build_node(parent_node: Node, records: list[Record]) -> Node:
    children_record = [record for record in records if record.parent_id ==
                       parent_node.node_id]

    children_node = [build_node(Node(record.record_id), records)
                     for record in children_record]

    parent_node.children = children_node
    return parent_node


def BuildTree(records: list[Record]):
    if len(records) == 0:
        return None

    records = sorted(records, key=lambda x: x.record_id)

    if any(record.parent_id > record.record_id for record in records):
        raise ValueError(
            "Node parent_id should be smaller than it's record_id.")

    if any(b.record_id - a.record_id != 1 for a, b in zip(records, records[1:])) or \
            records[0].record_id != 0:
        raise ValueError("Record id is invalid or out of order.")

    if len(list(filter(lambda record: record.parent_id == record.record_id, records))) > 1:
        raise ValueError("Only root should have equal record and parent id.")

    root, *leafs = records

    root = Node(root.record_id)
    return build_node(root, leafs)
