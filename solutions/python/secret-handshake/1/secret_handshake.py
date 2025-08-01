def commands(binary_str: str):
    actions = ['wink', 'double blink', 'close your eyes', 'jump']
    handshake = []
    for index, char in enumerate(binary_str[::-1]):
        if char == '1':
            if index > len(actions) - 1:
                handshake = handshake[::-1]
            else:
                handshake.append(actions[index])
    return handshake
