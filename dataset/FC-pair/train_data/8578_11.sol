contract c8578{
    /**
     * Anybody can credit ether on behalf of an advertiser
     *
     * @param advertiser    The advertiser to credit ether to
     */
    function creditAdvertiser (address advertiser) hasNotSuicided public payable {
        advertiserBalances[advertiser] += msg.value;
        emit Deposit(advertiser, msg.value, advertiserBalances[msg.sender]);
    }
}