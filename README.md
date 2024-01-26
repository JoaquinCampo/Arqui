## Overview
This laboratory project involves the implementation of a Reverse Polish Notation (RPN) calculator. RPN calculators are known for their efficiency as they do not require parentheses for operations. 
The task is to implement this calculator in both C and Assembler languages.

## Objective
The main objective is to create an RPN calculator that uses a stack to manage operators and operands, handling up to 31 operands. 
Additionally, the project aims to integrate command codes for various operations and status messages.

## Description of the Problem
The RPN calculator operates by first entering operands and then the operators. For instance, the operation 4 * (1 - 2) in RPN is written as 4 1 2 - *. 
The challenge is to implement this functionality, ensuring the calculator can handle various operations and properly manage the stack.

## Key Features

Stack Implementation: To store operands for operations.
Command Codes: Unique codes for each operation and status messages.
Operation Handling: Supports various arithmetic and logical operations.
Input and Output Management: Reading commands and outputting the operation's result and status.
##Program Descriptions
#### C Code: Implements the RPN calculator using a static array to model stack behavior. It includes a main loop to read commands and execute corresponding operations.
#### Assembler Code: Similar functionality as the C implementation but with direct memory address handling and custom stack management.
Challenges and Experimentation
Key challenges include handling IN and OUT instructions in Assembler, memory management, and understanding the nuances of the 8086 processor architecture.

## Conclusion
The project underscores the importance of a deep understanding of processor architecture and the distinction between high-level and low-level programming, particularly in terms of memory and instruction handling.
