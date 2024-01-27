contract c10267{
    //@notice Create a country with a name, called only by the owner
    function createCountry(string _name) public onlyOwner{
        _createCountry(_name, startingPrice);
    }
}