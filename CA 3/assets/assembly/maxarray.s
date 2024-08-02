.global _boot

.text
_boot:
jal x0, FindMax  # Jump to FindMax

FindMax:
lw   x8, 1000(x0)
add  x9, x0, x0  

Loop:
addi x9, x9, 4      
slti x6, x9, 40 
beq  x6, x0, EndLoop    
lw   x18, 1000(x9)   
slt  x6, x8, x18      
beq  x6, x0, Loop    
add  x8, x18, x0      
jal  x0, Loop       

EndLoop:
sw x8, 2000(x0)     
jal x0, End           

End:
