contract c12755{
    /**
     * Start ICO crowdsale.
     */
    function startIco() public {
        require(msg.sender == owner);
        require(!icoProceeding);
        icoProceeding = true;
		emit StartICO(msg.sender, true);
    }
}