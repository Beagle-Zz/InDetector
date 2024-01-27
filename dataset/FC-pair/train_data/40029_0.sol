contract c40029{
     
    function getTile(uint location) returns (address, string, string, uint) {
        return (tiles[location].owner,
                tiles[location].image,
                tiles[location].url,
                tiles[location].price);
    }
}