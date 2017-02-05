// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

(LOOP)
  @KBD    // Load keyboard address into A
  D=M     // Read value of KBD

  @CLEAR  // Load clear address into A
  D;JEQ   // Clear screen if no key is pressed

  @FILL   // Load fill routine address into A
  0;JMP   // Fill screen since a key must be pressed if we get to this point

(CLEAR)
  @pixelval  // Load pixel val address into A
  M=0        // Set @pixelval to 0
  @PNTSCR    // Load pixel val routine address into A
  0;JMP      // draw pixels to screen by jumping to A

(FILL)
  @pixelval   // Load pixel val address into A
  M=-1        // Set @pixelval to 1 (black)
  @PNTSCR     // Load pixel val routine address into A
  0;JMP       // draw pixels to screen by jumping to A

(PNTSCR)
  @offset     // Store our offset into memory
  M=0         // Store our offset into memory
  @8192       // Store 8192 as the max offset
  D=A
  @maxoffset
  M=D

  (ILP)
    @SCREEN     // Get the address of screen
    D=A
    @offset
    D=D+M       // Pointer to current pixel (screen plus offset)
    @current    // Store that as current address
    M=D

    @pixelval
    D=M         // Load pixel color
    @current
    A=M         // Point A to current pixel
    M=D         // Store pixel color value into current pixel

    @offset
    M=M+1       // Increment our offset

    @offset
    D=M
    @maxoffset
    D=D-M       // Determine whether we're at the max offset

    @LOOP
    D;JEQ       // If so, then start over

    @ILP
    0;JMP       // Else keep drawing to the screen
