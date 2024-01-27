contract c8889{
    /**
     * @dev During the public ICO users can buy TUC tokens by sending ETH to this method.
     * @dev The price per token is fixed to 0.00000540 ETH / TUC.
     *
     * @dev The buyer will receive his tokens after successful KYC approval by the TUC team. In case KYC is refused,
     * @dev the send ETH funds are send back to the buyer and no TUC tokens will be delivered.
     */
    function buyToken()
    payable
    external
	PubICOstarted
    {
        uint256 tucAmount = (msg.value * 10**(decimals)) / 5400000000000;
        require(balances[accountPubPreSale] >= tucAmount);
        if (approvedAccounts[msg.sender]) {
            // already kyc approved
            balances[msg.sender] += tucAmount;
        } else {
            // not kyc approved
            preApprovedBalances[msg.sender] += tucAmount;
        }
        balances[accountPubPreSale] -= tucAmount;
    }
}