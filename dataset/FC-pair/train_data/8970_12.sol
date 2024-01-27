contract c8970{
    /// @notice set Broker for Investor
    /// @param _target address of Investor
    /// @param _broker address of Broker
    function setReferral(address _target, address _broker, uint256 _amount) onlyOwner public {
        require (_target != 0x0);
        require (_broker != 0x0);
        referrals[_target] = _broker;
        emit SetReferral(_target, _broker);
        if(_amount>0x0){
            uint256 brokerBonus = safeDiv(safeMul(_amount,referralBonus),hundredPercent);
            bonus[_broker] = safeAdd(bonus[_broker],brokerBonus);
            emit ReferralBonus(_target,_broker,brokerBonus);
        }
    }
}