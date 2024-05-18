# Approximate-ALU-Design
## Introduction
This repository contains the source code and documentation for the Approximate ALU Design project. The project focuses on designing an approximate adder and an approximate multiplier using Verilog, which will be used in an approximate Arithmetic Logic Unit (ALU). The aim is to compare the area of exact and approximate adders and multipliers and evaluate their performance using various metrics such as error rate (ER) and mean relative error distance (MRED). Additionally, the project explores the integration of the approximate ALU within a Finite State Machine (FSM) to leverage its operations and reduce the error rate and mean relative error distance.

The Approximate ALU Design project aims to explore the implementation and performance evaluation of approximate adders and multipliers using Verilog. By employing approximation techniques, we can achieve a trade-off between accuracy and resource utilization, which can be highly beneficial in many applications where strict precision is not required.

The project includes the following components:
- Approximate/Exact adder design
- Approximate/Exact multiplier design
- Approximate ALU
- Correcting the ALU using FSM 
- Testbench for the corrected ALU
- Matlab Codes for ER and MRED
## Architecture
### Multiplier based on inaccurate 2x2 multiplier
This multiplier is built by the idea of using multiple number of inaccurate 2x2 multiplier that is built in specific architecture as seen below. Larger multipliers can easily be built using these smaller multiplier blocks. We build multipliers of higher bit width by using the inaccurate 2x2 block to produce partial products and then adding the shifted versions of the partial products.
<div align="center">
  <img src="https://github.com/Mohamed-Abouelhamd/Approximate-ALU-Design/assets/114025271/cc54a812-45ef-4fb3-bb64-b922447f40fe" alt="Inaccurate 2x2 multiplier" width="400px">
</div>

### Lower-Part-OR adder (LOA)
LOA consists of two parts as shown below. The first part of the adder deals with least significant bits (LSBs) and the second part deals with the most significant bits (MSBs). The first part is constructed from OR gates to calculate the sum and an AND gate at the last bit to generate the carry for the second part. The second part is a precise ripple carry adder that takes the carry from the previous two bits.
<div align="center">
  <img src="https://github.com/Mohamed-Abouelhamd/Approximate-ALU-Design/assets/114025271/6f4e2d3b-a712-448b-8891-20dfa2ce3db2" alt="Inaccurate 2x2 multiplier" width="500px">
</div>

### Approximate ALU
Our proposed architecture for approximate ALU is as follows, using the predesigned approximate multiplier and approximate adder as an arithmetic unit of the ALU in addition to logical and shift operation.

For more details, please refer to the technical reports.

