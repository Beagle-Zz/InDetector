contract c16250{
    /**
     * @dev Function checks how much you can remove the Token
     * @param _address The address of depositor.
     * @param _now The current time.
     * @return the amount of Token that can be withdrawn from contract
     */
    function validWithdrawToken(address _address, uint256 _now) public returns (uint256){
        require(_address != address(0));
        uint256 amount = 0;
        if (balancesToken[_address] <= 0 || transferInsToken[_address].length <= 0) {
            return amount;
        }
        for (uint i = 0; i < transferInsToken[_address].length; i++) {
            uint256 indexCurStake = transferInsToken[_address][i].indexStake;
            TypeStake stake = arrayStakesToken[indexCurStake].stakeType;
            uint256 stakeTime = arrayStakesToken[indexCurStake].time;
            uint256 stakeAmount = arrayStakesToken[indexCurStake].amount;
            uint8 currentStake = 0;
            if (arrayStakesToken[transferInsToken[_address][i].indexStake].status == StatusStake.CANCEL) {
                amount = amount.add(stakeAmount);
                transferInsToken[_address][i].isRipe = true;
                continue;
            }
            if (stake == TypeStake.DAY) {
                currentStake = 0;
                if (_now < stakeTime.add(1 days)) continue;
            }
            if (stake == TypeStake.WEEK) {
                currentStake = 1;
                if (_now < stakeTime.add(7 days)) continue;
            }
            if (stake == TypeStake.MONTH) {
                currentStake = 2;
                if (_now < stakeTime.add(730 hours)) continue;
            }
            uint256 amountHours = _now.sub(stakeTime).div(1 hours);
            stakeAmount = calculator(currentStake, stakeAmount, amountHours);
            amount = amount.add(stakeAmount);
            transferInsToken[_address][i].isRipe = true;
            arrayStakesToken[transferInsToken[_address][i].indexStake].status = StatusStake.COMPLETED;
        }
        return amount;
    }
}