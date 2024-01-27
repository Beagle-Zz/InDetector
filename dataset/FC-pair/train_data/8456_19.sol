contract c8456{
    // Add tokens&bonus amount to counters
    function addToStat(uint tokens, uint bonus) internal {
        uint total = tokens + bonus;
        totalSupply = totalSupply.add(total);
        //tokensBought = tokensBought.add(tokens.div(multiplier));
        //tokensBonus = tokensBonus.add(bonus.div(multiplier));
        tokensSoldTotal = tokensSoldTotal.add(tokens);
    }
}