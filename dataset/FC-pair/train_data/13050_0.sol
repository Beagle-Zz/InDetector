contract c13050{
    /**
    * Reverts if not in crowdsale time range. 
    */
    modifier onlyWhileOpen {
        require(icoOpen);
        _;
    }
}