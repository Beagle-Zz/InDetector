contract c18738{
 /**
  * adds protection to a character
  * @param id the character id
  * @param lifes the number of protections
  * */
 function protectCharacter(uint32 id, uint8 lifes) internal {
   protection[id] = lifes;
   NewProtection(id, lifes);
 }
}