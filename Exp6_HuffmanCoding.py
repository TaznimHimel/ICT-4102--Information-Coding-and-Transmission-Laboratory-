import heapq

# Step 1: Define the class for the Huffman Tree Node
class HuffmanNode:
    def __init__(self, symbol, frequency):
        self.symbol = symbol
        self.frequency = frequency
        self.left = None
        self.right = None
    
    def __lt__(self, other):
        return self.frequency < other.frequency

# Step 2: Function to build the Huffman Tree
def build_huffman_tree(symbols, frequencies):
    # Create a priority queue (min-heap) to build the tree
    priority_queue = [HuffmanNode(symbols[i], frequencies[i]) for i in range(len(symbols))]
    heapq.heapify(priority_queue)
    
    # Build the tree by combining the two least frequent nodes
    while len(priority_queue) > 1:
        # Pop the two nodes with the lowest frequencies
        left = heapq.heappop(priority_queue)
        right = heapq.heappop(priority_queue)
        
        # Create a new internal node with the combined frequency
        internal_node = HuffmanNode(None, left.frequency + right.frequency)
        internal_node.left = left
        internal_node.right = right
        
        # Push the internal node back to the priority queue
        heapq.heappush(priority_queue, internal_node)
    
    # The remaining node is the root of the Huffman tree
    return priority_queue[0]

# Step 3: Function to generate Huffman codes
def generate_huffman_codes(root):
    codes = {}
    
    def traverse(node, current_code):
        if node is not None:
            if node.symbol is not None:
                codes[node.symbol] = current_code
            traverse(node.left, current_code + "0")
            traverse(node.right, current_code + "1")
    
    traverse(root, "")
    return codes

# Step 4: Input symbols and frequencies
symbols = ['A', 'B', 'C', 'D', 'E']
frequencies = [0.4, 0.3, 0.2, 0.05, 0.05]

# Step 5: Build the Huffman tree and generate codes
root = build_huffman_tree(symbols, frequencies)
huffman_codes = generate_huffman_codes(root)

# Step 6: Display the Huffman codes
print("Huffman Codes:")
print("Symbol\tFrequency\tCode")

for i in range(len(symbols)):
    symbol = symbols[i]
    print(f"{symbol}\t{frequencies[i]}\t\t{huffman_codes[symbol]}")