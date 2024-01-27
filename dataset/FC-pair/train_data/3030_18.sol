contract c3030{
    /**
    * @dev get factory address for given country
    * @param _country Name of country
    * @return Address of factory
    **/
    function getFactoryForCountry(string _country) public constant returns (address) {
        return countryFactory[_country];
    }
}