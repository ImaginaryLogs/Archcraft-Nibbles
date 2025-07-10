![title](./README/Title.png)

![Static Badge](https://img.shields.io/badge/AY2425--T3-CSARCH2-red)

**CSARCH2 Case Study 2: Microprogramming in Minecraft**

A 16-bit computer simulated on logisim evolution and simulated in Minecraft.
 
> [!note]
> The tools that may help you on this project is incomplete and will be accomplished in a later date.
> Though students can already explore the World File if they want to.
> It is recommended to use 1.20.4.

# Set up

The Minecraft world file can be found in the /game/ directory of this repository. Please run this on the Minecraft launcher on `1.20.4`.

Each group should have already received the project specifications outlining their tasks.

Though not required, you can enhance your building and gameplay experience, it is recommended to install the following Fabric mods, all available on Modrinth. 


## Project Overview

This case study focuses on implementing a partial 16-bit CPU with emphasis on:
- **Arithmetic Logic Unit (ALU)** with custom operations
- **Control Unit** with microprogram control signals
- **Register Controller** for data transfer operations
- **Instruction execution** without control flow operations

Students build and connect redstone circuits to simulate real CPU behavior, gaining practical understanding of how microinstructions coordinate different CPU components.

## Learning Objectives

Upon completion, students will be able to:
- Explain how microinstructions control data flow and component interaction within a CPU
- Design and implement a functional ALU using redstone logic components
- Simulate instruction execution based on a predefined opcode set
- Evaluate the effectiveness of gamified platforms in understanding complex architectural concepts


## Project Structure

### CPU Cycle Implementation
- **8 CPU cycles per instruction** (modified for Minecraft limitations)
- **Fetch & Decode**: 3 cycles (pre-implemented)
- **Execute**: 5 cycles (student implementation required)

### Control Signals
The implementation uses a comprehensive set of microcode control signals including:
- **Instruction Register**: IRin, IRDFout, IRAFout, SELECT
- **ALU Operations**: SELECT Y, SELECT 4, ALU OP0-OP2, Zin, Zout
- **Memory Operations**: MARin, MARout, MDRin, MDRout, READ, WRITE
- **Register Operations**: REGin, REGout, SWAP OUT
- **Program Counter**: PCin, PCout, RESET PC


## Core Mods
These are required or highly recommended for core functionality and quality of life.

| Name                      | Version  | Link                                                       |
| ------------------------- | -------- | ---------------------------------------------------------- |
| Axiom                     | 4.9.1    | [Modrinth](https://modrinth.com/mod/axiom)                 |
| AppleSkin                 | 2.5.1    | [Modrinth](https://modrinth.com/mod/appleskin)             |
| Bobby                     | 5.1.0    | [Modrinth](https://modrinth.com/mod/bobby)                 |
| Cloth Config              | 13.0.138 | [Modrinth](https://modrinth.com/mod/cloth-config)          |
| Fabric API                | 0.97.2   | [Modrinth](https://modrinth.com/mod/fabric-api)            |
| Mod Menu                  | 9.2.0    | [Modrinth](https://modrinth.com/mod/modmenu)               |
| Not Enough Animations     | 1.9.3    | [Modrinth](https://modrinth.com/mod/not-enough-animations) |
| Xaero's Minimap           | 25.2.6   | [Modrinth](https://modrinth.com/mod/xaeros-minimap)        |
| Xaero's World Map         | 1.39.9   | [Modrinth](https://modrinth.com/mod/xaeros-world-map)      |
| Yet Another Config Lib v3 | 3.6.6    | [Modrinth](https://modrinth.com/mod/yacl)                  |

## Auxiliary Mods

These are optional but highly recommended to improve FPS and reduce lag.

| Name           | Version | Link                                               |
| -------------- | ------- | -------------------------------------------------- |
| Dynamic FPS    | 3.9.4   | [Modrinth](https://modrinth.com/mod/dynamic-fps)   |
| Entity Culling | 1.7.4   | [Modrinth](https://modrinth.com/mod/entityculling) |
| FerriteCore    | 6.0.3   | [Modrinth](https://modrinth.com/mod/ferrite-core)  |
| Iris           | 1.7.2   | [Modrinth](https://modrinth.com/mod/iris)          |
| Lithium        | 0.12.1  | [Modrinth](https://modrinth.com/mod/lithium)       |
| Sodium         | 0.5.8   | [Modrinth](https://modrinth.com/mod/sodium)        |
| Sodium Extra   | 0.5.4   | [Modrinth](https://modrinth.com/mod/sodium-extra)  |


## Disclaimer

> [!warning]
> This repository contains a Minecraft world save showcasing in-game computers and redstone builds.
>
> Minecraft™ is a trademark of Mojang AB. This project is not affiliated with, endorsed by, or associated with Mojang AB, Microsoft, or any of their subsidiaries.
>
> All screenshots, images, and in-game builds shown here are fan-made creations, shared for educational and entertainment purposes only.
>
> You may use, modify, or share this world save freely, but you may not sell it or represent it as an official Mojang/Microsoft product.
