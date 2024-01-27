contract c8443{
    // Generates team tokens after ICO finished
    function generateTeamTokens() internal ICOFinished {
        require(!teamTokensGenerated);
        teamTokensGenerated = true;
        if(tokensCap > totalSupply) {
            //debugLog('before ', totalSupply);
            uint unsoldAmount = tokensCap.sub(totalSupply);
            token.mint(unsold, unsoldAmount);
            //debugLog('unsold ', unsoldAmount);
            totalSupply = totalSupply.add(unsoldAmount);
            //debugLog('after ', totalSupply);
        }
        uint totalSupplyTokens = totalSupply;
        totalSupplyTokens = totalSupplyTokens.mul(100);
        totalSupplyTokens = totalSupplyTokens.div(60);
        for (uint8 i = 0; i < listTeamTokens.length; ++i) {
            uint teamTokensPart = percent(totalSupplyTokens, listTeamTokens[i].percent);
            if (listTeamTokens[i].divider != 0) {
                teamTokensPart = teamTokensPart.div(listTeamTokens[i].divider);
            }
            if (listTeamTokens[i].maxTokens != 0 && listTeamTokens[i].maxTokens < teamTokensPart) {
                teamTokensPart = listTeamTokens[i].maxTokens;
            }
            token.mint(listTeamTokens[i].holder, teamTokensPart);
            if(listTeamTokens[i].freezePeriod != 0) {
                token.freezeTokens(listTeamTokens[i].holder, endTime + listTeamTokens[i].freezePeriod);
            }
            addToStat(teamTokensPart, 0);
        }
    }
}