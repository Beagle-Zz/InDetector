contract c18738{
 /**
  * A knight may attack a dragon, but not choose which one.
  * The creature with the higher level wins. The level is determined by characterType % numDragonTypes.
  * The value of the loser is transfered to the winner. In case of a the same level, the winner is chosen randomly.
  * @param knightID the ID of the knight to perfrom the attack
  * @param knightIndex the index of the knight in the ids-array. Just needed to save gas costs.
  *					  In case it's unknown or incorrect, the index is looked up in the array.
  * */
 function fight(uint32 knightID, uint16 knightIndex) public {
   if (knightID != ids[knightIndex])
     knightID = getCharacterIndex(knightID);
   Character storage knight = characters[knightID];
   require(cooldown[knightID] + CooldownThreshold <= now);
   require(knight.owner == msg.sender);
   require(knight.characterType >= numDragonTypes);
   uint16 dragonIndex = getRandomDragon(knightID);
   assert(dragonIndex < maxCharacters);
   uint32 dragonID = ids[dragonIndex];
   Character storage dragon = characters[dragonID];
   uint16 tieBreaker = uint16(now % 2);
   uint128 value;
   if (knight.characterType - numDragonTypes > dragon.characterType || (knight.characterType - numDragonTypes == dragon.characterType && tieBreaker == 0)) {
     value = hitCharacter(dragonIndex, numCharacters);
     if (value > 0) {
       numCharacters--;
     }
     knight.value += value;
     cooldown[knightID] = now;
     if (oldest == 0) findOldest();
     NewFight(knightID, dragonID, value);
   }
   else {
     value = hitCharacter(knightIndex, numCharacters);
     if (value > 0) {
       numCharacters--;
     }
     dragon.value += value;
     NewFight(dragonID, knightID, value);
   }
 }
}