contract c8099{
// Annual Interest  Function
    function annualInterest() public view returns(uint interest) {
        uint _now = block.timestamp;
        interest = maxMintPoS;
        if((_now.sub(stakeCommence)).div(365 days) == 0) {
            interest = (770 * maxMintPoS).div(100);
        } else if((_now.sub(stakeCommence)).div(365 days) == 1){
            interest = (435 * maxMintPoS).div(100);
        }
    }
}