contract c16582{
    // TODO Check
    function refund() public {
        require(canRefund());
        address buyer = msg.sender;
        uint amount = buyerToSentWei[buyer];
        require(amount > 0);
        RefundEthEvent(buyer, amount);
        buyerToSentWei[buyer] = 0;
        totalWeiRefunded = totalWeiRefunded.add(amount);
        buyer.transfer(amount);
    }
}