contract c10476{
    // Returns day details
    function getDay (uint16 dayId) public view
        onlyValidDay(dayId)
    returns (uint16 id, address owner, string message, uint256 sellprice, uint256 buyprice) {
        return(  
            dayId,
            dayStructs[dayId].owner,
            dayStructs[dayId].message,
            getCurrentPrice(dayId),
            dayStructs[dayId].buyprice
        );    
    }
}