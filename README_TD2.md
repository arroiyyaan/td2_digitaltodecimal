#### ADE - TD2

Rilwanu Ar Roiyyaan KASNO | M2 Integration Circuit and System


###### _Objective_
- Optimizing binary to decimal numerical by omitting modulo usage and 'process' in vhdl

###### _Method_
- In this work, an 8-bit conversion algorithm called _Doubble Dabble_ is used and extended into 16-bit
      The workflow of this algorithm is as follow:

      1. the total n-bit input bit vector is mapped out into several BCD digit spaces, in this case, 4 spaces, which are 4 bits wide respectively, representing decimal numerical system (ones, tens, hundreds, and so on)
      2. the input bit vector is then left-shifted by 1 bit, into the BCD space
      3. this process is carried on unless one BCD space is equal or greater than 4(10)
      4. if this is the case, come back to step number 2.
      5. this whole process is done repeatedly until all the 16-bits input are shifted and mapped out to the BCD digit spaces.

###### _Results_
The vhdl code compiled successfully with much less total logic elements used


###### _Issues_
There are few issues faced during the work:
- The output on 7 segment display, as well as the waveform analysis were not yet done during this work, since there are some problems with the Modelsim simulator as it did not load any waveform
- the most time consuming work of this TD2 is the environment set up of Quartus and Modelsim on the laptop
