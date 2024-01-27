contract c3435{
    // we have two minters the crowdsale contract and the token deployer(owner)
    modifier hasMintPermission() {
        require(msg.sender == crowdsale || msg.sender == owner);
        _;
    }
}