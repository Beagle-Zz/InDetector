contract c18996{
    //Aura Boosts
    // Red - Burning Strike - + 10 battle power  
    // Green - Healing Light - 20% chance to heal 75 hp each battle
    //Yellow - Guiding Path - 5 hp recovered each turn.
    //Purple - Uncontroled Fury - 10% chance for sudden kill 
    //Orange - Radiant Power - +100 max hp on joining board. 
    //Blue - Friend to all - immunity from monster attacks 
          // Utility Functions
    function DataContacts(address _angelCardDataContract, address _petCardDataContract,  address _medalDataContract, address _battleboardDataContract) onlyCREATOR external {
        angelCardDataContract = _angelCardDataContract;
        petCardDataContract = _petCardDataContract;
        medalDataContract = _medalDataContract;
        battleboardDataContract = _battleboardDataContract;
    }
}