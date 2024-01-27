contract c11328{
    // A user tries to claim a tile that's already owned by another user. A battle ensues.
    // A random roll is done with % based on attacking vs defending amounts.
    function attackTile(address _msgSender, uint16 _tileId, uint _attackAmount, bool _useBattleValue) public isValidCaller {
        require(_attackAmount >= 1 finney);         // Don't allow attacking with less than one base tile price.
        require(_attackAmount % 1 finney == 0);
        address claimer;
        uint blockValue;
        (claimer, blockValue) = bwData.getTileClaimerAndBlockValue(_tileId);
        require(claimer != 0); // Can't do this on never-owned tiles
        require(claimer != _msgSender); // Can't attack one's own tiles
        require(claimer != owner); // Can't attack owner's tiles because it is used for raffle.
        // Calculate boosted amounts for attacker and defender
        // The base attack amount is sent in the by the user.
        // The base defend amount is the attacked tile's current blockValue.
        uint attackBoost;
        uint defendBoost;
        (attackBoost, defendBoost) = bwData.calculateBattleBoost(_tileId, _msgSender, claimer);
        // Adjust boost to optimize game strategy
        attackBoost = attackBoost.mul(ATTACK_BOOST_MULTIPLIER).div(100);
        defendBoost = defendBoost.mul(DEFEND_BOOST_MULTIPLIER).div(100);
        // Cap the boost to minimize its impact (prevents whales somehow)
        if (attackBoost > _attackAmount.mul(ATTACK_BOOST_CAP).div(100)) {
            attackBoost = _attackAmount.mul(ATTACK_BOOST_CAP).div(100);
        }
        if (defendBoost > blockValue.mul(DEFEND_BOOST_CAP).div(100)) {
            defendBoost = blockValue.mul(DEFEND_BOOST_CAP).div(100);
        }
        uint totalAttackAmount = _attackAmount.add(attackBoost);
        uint totalDefendAmount = blockValue.add(defendBoost);
        // Verify that attack odds are within allowed range.
        require(totalAttackAmount.div(10) <= totalDefendAmount); // Disallow attacks with more than 1000% of defendAmount
        require(totalAttackAmount >= totalDefendAmount.div(10)); // Disallow attacks with less than 10% of defendAmount
        uint attackFeeAmount = _attackAmount.mul(ATTACK_FEE).div(100);
        uint attackAmountAfterFee = _attackAmount.sub(attackFeeAmount);
        updateFeeBalance(attackFeeAmount);
        // The battle considers boosts.
        uint attackRoll = random(totalAttackAmount.add(totalDefendAmount)); // This is where the excitement happens!
        //gas cost of attack branch is higher than denfense branch solving MSB1
        if (attackRoll > totalDefendAmount) {
            // Change block owner but keep same block value (attacker got battlevalue instead)
            bwData.setClaimerForTile(_tileId, _msgSender);
            // Tile successfully attacked!
            if (_useBattleValue) {
                // Withdraw followed by deposit of same amount to prevent MSB1
                addUserBattleValue(_msgSender, attackAmountAfterFee); // Don't include boost here!
                subUserBattleValue(_msgSender, attackAmountAfterFee, false);
            } else {
                addUserBattleValue(_msgSender, attackAmountAfterFee); // Don't include boost here!
            }
            addUserBattleValue(claimer, 0);
            bwData.updateTileTimeStamp(_tileId);
            // Send update event
            emit TileAttackedSuccessfully(_tileId, _msgSender, attackAmountAfterFee, totalAttackAmount, claimer, blockValue, totalDefendAmount, attackRoll, block.timestamp);
        } else {
            bwData.setClaimerForTile(_tileId, claimer); //should be old owner
            // Tile successfully defended!
            if (_useBattleValue) {
                subUserBattleValue(_msgSender, attackAmountAfterFee, false); // Don't include boost here!
            }
            addUserBattleValue(claimer, attackAmountAfterFee); // Don't include boost here!
            // Send update event
            emit TileDefendedSuccessfully(_tileId, _msgSender, attackAmountAfterFee, totalAttackAmount, claimer, blockValue, totalDefendAmount, attackRoll, block.timestamp);
        }
    }
}