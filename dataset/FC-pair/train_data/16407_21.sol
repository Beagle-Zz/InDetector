contract c16407{
    /**
    * @dev Connect to gene contract. That way we can update that contract and add more fighters.
    */
    function setGeneContractAddress(address _address) external contract_onlyOwner returns (bool success) {
        geneContract = GeneInterface(_address);
        return true;
    }
}