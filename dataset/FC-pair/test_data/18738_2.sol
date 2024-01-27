contract c18738{
 /**
  * buys as many characters as possible with the transfered value of the given type
  * @param characterType the type of the character
  */
 function addCharacters(uint8 characterType) payable public {
   uint8 amount = uint8(msg.value / costs[characterType]);
   uint16 nchars = numCharacters;
   if (characterType >= costs.length || msg.value < costs[characterType] || nchars + amount > maxCharacters) revert();
   //if type exists, enough ether was transferred and there are less than maxCharacters characters in the game
   bool isDragon = characterType < numDragonTypes;
   uint32 nid = nextId;
   if (isDragon) {
     //dragons enter the game directly
     for (uint8 i = 0; i < amount; i++) {
       addCharacter(nid + i, nchars + i);
       characters[nid + i] = Character(characterType, values[characterType], msg.sender);
     }
     numCharactersXType[characterType] += amount;
     numCharacters += amount;
   }
   else {
     for (uint8 j = 0; j < amount; j++) {
       characters[nid + j] = Character(characterType, values[characterType], msg.sender);
     }
   }
   nextId = nid + amount;
   NewPurchase(msg.sender, characterType, amount, nid);
 }
}