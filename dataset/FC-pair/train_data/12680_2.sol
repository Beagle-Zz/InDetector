contract c12680{
    // only people with set tarifs
    modifier onlyTarifed() {
        address _customerAddress = msg.sender;
        require(tarif[_customerAddress] != 0);
        _;
    }
}