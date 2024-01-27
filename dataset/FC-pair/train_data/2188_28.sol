contract c2188{
    // Complete the sale
    function finishSale() public onlyOwner {
        require(hasEnded());
        token.finishMinting();
        emit SaleClosed();
    }
}