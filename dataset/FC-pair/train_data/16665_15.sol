contract c16665{
    // Allows execution by the contract owner only
    modifier onlyHuman {
        require(msg.sender == address(human));
        _;
    }
}