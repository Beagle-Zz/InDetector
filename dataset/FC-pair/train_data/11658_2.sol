contract c11658{
    // Will generate a new Narco and generate the event
    function _createNarco(
        string _genes,
        string _name,
        address _owner
    )
        internal
        returns (uint)
    {
        uint16[6] memory randomskills= [
            uint16(random(9)+1),
            uint16(random(9)+1),
            uint16(random(9)+1),
            uint16(random(9)+1),
            uint16(random(9)+1),
            uint16(random(9)+31)
        ];
        uint256[6] memory cools;
        uint16[9] memory nostats;
        Narco memory _narco = Narco({
            genes: _genes,
            narcoName: _name,
            cooldowns: cools,
            stats: nostats,
            weedTotal: 0,
            cokeTotal: 0,
            consumables: [4,6,2,1],
            skills: randomskills,
            homeLocation: uint8(random(6)+1)
        });
        uint256 newNarcoId = narcos.push(_narco) - 1;
        require(newNarcoId <= 4294967295);
        // raid character (token 0) live in 7 and have random special skills
        if (newNarcoId==0){
            narcos[0].homeLocation=7; // in vice island
            narcos[0].skills[4]=800; // defense
            narcos[0].skills[5]=65535; // carry
        }
        NarcoCreated(_owner, newNarcoId, _narco.genes);
        _transfer(0, _owner, newNarcoId);
        return newNarcoId;
    }
}