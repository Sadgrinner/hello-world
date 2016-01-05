# Custom Keyboard Project

### Keyboard design goals:
* tenkeyless
* more ergonomic layout
* keycaps act as reference material for computer science and mathematical formulae

### Plan:
* Create a custom design for the [WASD V2 87-Key Custom Mechanical Keyboard](http://www.wasdkeyboards.com/index.php/products/mechanical-keyboard/wasd-v2-87-key-custom-mechanical-keyboard.html).
* use QGMLWY layout from http://mkweb.bcgsc.ca/carpalx/?full_optimization
  * It maintains the locations of the Q S Z X C V Y keys
* swap the Caps Lock and Backspace key (see below)
* Use [Eve Sans Neue](https://github.com/zachanima/t3/tree/master/app/assets/fonts) fonts for a slightly futuristic look

### Reference material ideas:
* F1 - F12 keys are powers of 2
* 11 keys to fill in with formulas: tab, L_shift, L_ctrl, win, L_alt, SPACEBAR, R_alt, menu, R_ctrl, R_shift, enter
* Binomial coefficient
* Euler's Identity
* Euler's number defined as `the limit of (1 + 1/n)^n as n approaches infinity` and as the `sum of the infinite series 1/(n!)`.  Also note the relationship of 'e' to the study of compound interest.
* [Natural logarithm properties](https://en.wikipedia.org/wiki/Natural_logarithm#Properties)
* Logarithms and log properties `(y = log base b of x equivalent to x = b^y)`.  See others at https://en.wikipedia.org/wiki/List_of_logarithmic_identities
* Demorgan's Laws
* Baye's Theorem?
* [Compound Interest](https://en.wikipedia.org/wiki/Compound_interest#Mathematics_of_interest_rates)
* Sum of integers = `((n+1)*n) / 2`


### How to remap keys in Windows

One must edit the registry keys. To do that:

1. Go to `Start > Run...`, and type in `regedit`.  (Or press `Win+R` and type `regedit` in the box).
2. In the editor that opens up, double-click on the following folders in order...
  * HKEY_LOCAL_MACHINE
  * SYSTEM
  * CurrentControlSet
  * Control
  * Click once on Keyboard Layout. ("Layout" singular, not plural!)
3. Again, you're modifying the key at `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout`
4. If there is an item already here called "Scancode Map", right-click it and modify it. If not - under "Data" it might say `(value not set)` - right-click and select `New > Binary Value` and call it "Scancode Map".
5. Note, the `Type` of your new entry is `REG_BINARY`.
6. To swap the Caps Lock Key and the Backspace key, right-click your Scancode Map and select `Modify...`.  Enter the following without spaces: `00000000 00000000 03000000 0e003a00 3a000e00 00000000`
  * Note: the editor will display the value slightly differently - even though you are entering 48 characters, it will display them in groups of two.  Like this:
    ```
    0000	00 00 00 00 00 00 00 00 ........
    0008	03 00 00 00 0E 00 3A 00 ........
    0010	3A 00 0E 00 00 00 00 00 ........
    0018
    ```
  * The values on the left (that you cannot modify) are merely hexidecimal line markers.  IE: `0000` means 'position 0', `0008` means 'position 8', `0010` means 'position 16', `0018` means 'position 24'.  That's hex for you!
7. So.  What does the `00000000 00000000 03000000 0e003a00 3a000e00 00000000` String *mean*? 
    The first two blocks of 16 zeros are just there to waste space.
    
    The third block, “03000000”, represents how many keys we are going to re-map plus 1.  We are remapping two keys in this example, thus the '3' is used.
    
    The fourth block could be split into two parts for readability: "0e00" followed by "3a00".
    	The latter portion, “3A00” is the key we are modifying, which in this case is the caps lock key.
    	The former part, "0E00" is the key we are mapping *to*, which in this case is the backspace key.  So this entire fourth section means 'map the backspace functionality to the caps lock key.'
        
    The fifth block, you'll notice, is the same two groups of four in reverse order: "3a00" followed by "0e00".  Again, the first group of four is the key we are mapping *to* ("3a00", or the caps lock key), and the second group of four is the key we are modifying ("0e00", or the backspace key).  So the entire fifth section is an instruction to 'map the caps lock functionality to the backspace key'.
    
    The final 8 zeros are there to waste space as the null terminator.
8. Finally, close Regedit and restart your computer.
  * Thanks to http://theangryskunk.blogspot.com/2011/06/who-uses-capslock-swap-it-with.html for the inspiration and [here](http://www.howtogeek.com/howto/windows-vista/disable-caps-lock-key-in-windows-vista/) for the explanation.  With this understanding you should be able to manually edit your keyboard layout to your heart's content!
  
