contract c3031{
    /**
    * @dev get google maps url of property location
    **/
    function getMap() public constant returns (string) {
        return mapURL;
    }
}