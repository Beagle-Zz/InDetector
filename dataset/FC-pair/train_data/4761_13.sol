contract c4761{
    // can never adjust tradable cards
    // each season gets a 'balancing beta'
    // totally immutable: season, rarity
    function replaceProto(
        uint16 index, uint8 god, uint8 cardType, uint8 mana, uint8 attack, uint8 health, uint8 tribe
    ) public onlyGovernor {
        ProtoCard memory pc = protos[index];
        require(!seasonTradable[pc.season]);
        protos[index] = ProtoCard({
            exists: true,
            god: god,
            season: pc.season,
            cardType: cardType,
            rarity: pc.rarity,
            mana: mana,
            attack: attack,
            health: health,
            tribe: tribe
        });
    }
}