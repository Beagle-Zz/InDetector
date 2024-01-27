contract c3031{
    /**
    * @dev calculate and distribute fee for fee-recievers
    * @param _fee Fee amount
    **/
    function distributeFee(uint256 _fee) private {
        balances[networkReserveFund] = balances[networkReserveFund].add((_fee.mul(data.getNetworkFee())).div(100));
        balances[blocksquare] = balances[blocksquare].add((_fee.mul(data.getBlocksquareFee())).div(100));
        balances[certifiedPartner] = balances[certifiedPartner].add((_fee.mul(data.getCPFee())).div(100));
        balances[address(firstBuyers)] = balances[address(firstBuyers)].add((_fee.mul(data.getFirstBuyersFee())).div(100));
        firstBuyers.incomingTransaction((_fee.mul(data.getFirstBuyersFee())).div(100));
    }
}