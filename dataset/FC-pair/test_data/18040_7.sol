contract c18040{
	// Function that returns the (dynamic) price of selling a single token.
	function sellPrice() public constant returns (uint) {
        var eth = getEtherForTokens(1 finney);
        var fee = div(eth, 10);
        return eth - fee;
    }
}