contract c18314{
    /**
     * transfer holds from => to (only holds, no bouns)
     * this will withdrawal the holder bonus of these holds
     * and the to's fullfilled will go up, since total bonus unchanged, but holds goes more
     */
    function transferHolds(address from, address to, uint amount) internal {
        require(holds[from] >= amount);
        require(amount > 0);
        uint256 fromBonus = (watermark - fullfilled[from]) * amount;
        uint256 toBonus = (watermark - fullfilled[to]) * holds[to];
        holds[from] -= amount;
        holds[to] += amount;
        fullfilled[to] = watermark - toBonus / holds[to];
        from.transfer(fromBonus);
        emit SHARE_TRANSFER(from, to, amount);
        emit WITHDRAWAL(from, fromBonus);
    }
}