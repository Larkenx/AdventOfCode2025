import re
import math

f = open("input.txt", "r")
instructions = f.readlines()

pattern = r"(.)(\d+)"
LEFT = "L"
RIGHT = "R"


def solve_attempt_1(instructions):
    dial = 50
    number_of_zero_rotations = 0
    for instruction in instructions:
        matches = re.search(pattern, instruction)
        direction = matches.group(1)
        number_of_turns = int(matches.group(2))

        if number_of_turns >= 99:
            number_of_turns = number_of_turns % 99

        if direction == RIGHT:
            dial = (dial + number_of_turns) % 99

        if direction == LEFT:
            if number_of_turns <= dial:
                dial = dial - number_of_turns
            else:
                dial = (dial - number_of_turns) + 99

        if dial == 0:
            number_of_zero_rotations += 1

        print(instruction, dial)

    print(number_of_zero_rotations)
    return number_of_zero_rotations


def brute_force_solution_part_1(instructions):
    dial = 50
    number_of_zero_rotations = 0
    for instruction in instructions:
        matches = re.search(pattern, instruction)
        direction = matches.group(1)
        number_of_turns = int(matches.group(2))
        while number_of_turns != 0:
            number_of_turns = number_of_turns - 1
            if direction == LEFT:
                dial = dial - 1
                if dial == -1:
                    dial = 99
            if direction == RIGHT:
                dial = dial + 1
                if dial == 100:
                    dial = 0
        if dial == 0:
            number_of_zero_rotations += 1
    print(number_of_zero_rotations)
    return number_of_zero_rotations


def brute_force_solution_part_2(instructions):
    dial = 50
    number_of_zero_rotations = 0
    for instruction in instructions:
        matches = re.search(pattern, instruction)
        direction = matches.group(1)
        number_of_turns = int(matches.group(2))
        while number_of_turns != 0:
            number_of_turns = number_of_turns - 1
            if direction == LEFT:
                dial = dial - 1
                if dial == -1:
                    dial = 99
            if direction == RIGHT:
                dial = dial + 1
                if dial == 100:
                    dial = 0
            if dial == 0:
                number_of_zero_rotations += 1
    print(number_of_zero_rotations)
    return number_of_zero_rotations


brute_force_solution_part_1(instructions)
brute_force_solution_part_2(instructions)
