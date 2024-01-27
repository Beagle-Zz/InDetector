contract c13303{
    // Call from Crowdsale:
    function getBeneficiaryCash() external canGetCash {
        require(rightAndRoles.onlyRoles(msg.sender,1));
        address _beneficiary = rightAndRoles.wallets(2,0);
        uint256 move=benReady;
        benWallet=_beneficiary;
        if (move == 0) return;
        emit Receive(_beneficiary, move);
        benReady = 0;
        benTook += move;
        _beneficiary.transfer(move);
    }
}