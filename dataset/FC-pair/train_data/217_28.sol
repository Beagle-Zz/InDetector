contract c217{
    /**
        @param raceAddress - address of this race
        @param eth_address - user's ethereum wallet address
        @return true if user is winner + name of the winning horse (LTC,BTC,ETH,...)
    */
    function _isWinnerOf(address raceAddress, address eth_address) internal view returns (bool,bytes32)
    {
        //acquire race, fails if doesnt exist
        EthorseRace race = EthorseRace(raceAddress);
        //make sure the race is legit (only if legit races list is filled)
        if(onlyLegit)
            require(legitRaces[raceAddress],"not legit race");
        //acquire chronus
        bool  voided_bet; //boolean: check if race has been voided
        bool  race_end; //boolean: check if race has ended
        (,,race_end,voided_bet,,,,) = race.chronus();
        //cant be winner if race was refunded or didnt end yet
        if(voided_bet || !race_end)
            return (false,bytes32(0));
        //aquire winner race index
        bytes32 horse;
        bool found = false;
        uint256 arrayLength = all_horses.length;
        //Iterate over coin symbols to find winner - tie could be possible?
        for(uint256 i = 0; i < arrayLength; i++)
        {
            if(race.winner_horse(all_horses[i])) {
                horse = all_horses[i];
                found = true;
                break;
            }
        }
        //no winner horse? shouldnt happen unless this horse isnt registered
        if(!found)
            return (false,bytes32(0));
        //check the bet amount of the eth_address on the winner horse
        uint256 bet_amount = 0;
        if(eth_address != address(0)) {
            (,,,, bet_amount) = race.getCoinIndex(horse, eth_address);
        }
        //winner if the eth_address had a bet > 0 on the winner horse
        return (bet_amount > 0, horse);
    }
}