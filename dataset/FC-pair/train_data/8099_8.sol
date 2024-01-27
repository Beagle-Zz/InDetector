contract c8099{
// Stake Reward Function
    function getPoSReward(address _address) internal view returns (uint) {
        require( (block.timestamp >= stakeCommence) && (stakeCommence > 0) );
        uint _now = block.timestamp;
        uint _coinAge = getCoinAge(_address, _now);
        if(_coinAge <= 0) return 0;
        uint interest = maxMintPoS;
        if((_now.sub(stakeCommence)).div(365 days) == 0) {
            interest = (770 * maxMintPoS).div(100);
        } else if((_now.sub(stakeCommence)).div(365 days) == 1){
            // 2nd year effective annual interest rate is 50%
            interest = (435 * maxMintPoS).div(100);
        }
        return (_coinAge * interest).div(365 * (10**decimals));
    }
}