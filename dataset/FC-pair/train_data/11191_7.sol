contract c11191{
    /**
     * @dev Split user bet in some pieces:
     * - 55% go to bank
     * - 20% go to contract developer :)
     * - 12% go to sponsor
     * - 10% go to stock for future restores
     * - 3%  go to referral (if exists, if not - go into stock)
     */
    function splitTheBet(address referral) internal {
        uint256 _partBank     = Math.percent(msg.value, partBank);
        uint256 _partOwner    = Math.percent(msg.value, partOwner);
        uint256 _partStock    = Math.percent(msg.value, partStock);
        uint256 _partSponsor  = Math.percent(msg.value, partSponsor);
        uint256 _partReferral = Math.percent(msg.value, partReferral);
        bank  = Math.add(bank,  _partBank);
        stock = Math.add(stock, _partStock);
        owner.transfer(_partOwner);
        sponsor.transfer(_partSponsor);
        if (referral != address(0) && referral != msg.sender && bets[referral] > 0) {
            referral.transfer(_partReferral);
        } else {
            stock = Math.add(stock, _partReferral);
        }
    }
}