contract c7603{
    /**
     * Function for the frontend to show ether waiting to be send to charity in contract
     */
    function etherToSendCharity()
        public
        view
        returns(uint256) {
        return SafeMath.sub(totalEthCharityCollected, totalEthCharityRecieved);
    }
}