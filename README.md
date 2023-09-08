# tt04-TI_S-Box
Threshold Implementation of an Advanced Encryption Standard(AES) Substitution Box(S-Box) for Tiny Tapeout-04

This implementation of the S-Box follows Canright’s tower field approach and contains linear mappings to and from a $GF(2^4)$ normal base, three instances of $GF(2^4)$ multipliers, one $GF(2^4)$ inverter and one square scaler. 
      
In the first phase, three shares are processed by the linear input mapping and afterward fed into a multiplier and a uniform reduction to two shares $(a,b,c)\mapsto(a,b \oplus c)$ is fed into the square scaler. 
The output of the multiplier is partially remasked by 8-bits of randomness while the square scaler output is left as is. 
The result is saved in a register. In phase two the overall five shares are combined into four shares. Due to the previous remasking, this can be done uniformly as such:
      
$$(x,y,a,b,c)\mapsto(x,y \oplus (r_1 \oplus r_2),a \oplus (b \oplus r_1),c \oplus r_2)$$

In the equation $x,y$ denote the square scaler output, while $a,b,c$ denote the multiplier output. Note that a register needs to hold all five shares before recombination as glitches in $a \oplus b$ might reveal secret information. 
After recombination, the four shares are fed into the inverter and remasked with 8-bits of randomness. A register stage preventing glitches follows. 
In the final stage the remasked outputs are reduced to three shares uniformly by the following function.
      
$$(a,b,c,d)\mapsto(a \oplus (b \oplus r_3),c \oplus r_4,d \oplus r_3 \oplus r_4)$$
      
Subsequently, these shares are fed into two multipliers. Finally, the inverse linear mapping follows. With this new construction, it is enough to have three input shares to the S-box since the multiplier block requires only three shares.
We need to reduce the number of shares from five to four at the end of the first phase for the inverter and from four to three at the end of the second phase for the following multipliers.
