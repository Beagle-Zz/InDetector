contract c10958{
    // should be called after crowdsale ends or to emergency stop the sale
    function finalize() onlyOwner {
        require(!isFinalized);
        Finalized();
        isFinalized = true;
    }
}